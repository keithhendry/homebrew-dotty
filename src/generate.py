#!/usr/bin/env python3

import argparse
import contextlib
import enum
import hashlib
import pathlib
import sys
from collections import defaultdict
from string import Template
from typing import NamedTuple
from urllib.request import urlopen

REPOSITORY = "https://github.com/keithhendry/dotty"
FILENAME = "dotty-$VERSION-$PLATFORM-$ARCHITECTURE.tar.gz"

TEMPLATE = Template(
    """# typed: false
# frozen_string_literal: true

# This file was generated. DO NOT EDIT.
class Dotty < Formula
  desc "Dotfiles using symlinks and embedded git"
  homepage "$REPOSITORY"
  url "$URL"
  version "$VERSION"
  sha256 "$SHA256"
  license "MIT"

  $DOWNLOAD

  def install
    bin.install "dotty"
  end

  test do
    system "#{bin}/dotty", "--version"
  end
end"""
)

PLATFORM_TEMPLATE = Template(
    """on_$PLATFORM do
    $ARCHITECTURE
  end"""
)

ARCHITECTURE_TEMPLATE = Template(
    """on_$ARCHITECTURE do
      url "$URL"
      sha256 "$SHA256"
    end"""
)

DOTTY_RB_PATH = (
    pathlib.Path(__file__).parent.resolve() / ".." / "Formula" / "dotty.rb"
).resolve()


class Platform(NamedTuple):
    platform: str
    platform_alias: str
    architecture: str
    architecture_alias: str

    def __repr__(self) -> str:
        return f"{self.platform}/{self.architecture}"


class PlatformOption(Platform, enum.Enum):
    DARWIN_AMD64 = Platform("darwin", "macos", "amd64", "intel")
    DARWIN_ARM64 = Platform("darwin", "macos", "arm64", "arm")
    LINUX_AMD64 = Platform("linux", "linux", "amd64", "intel")
    LINUX_ARM64 = Platform("linux", "linux", "arm64", "arm")


PLATFORM_MAPPING: dict[str, Platform] = {
    str(platform.value): platform.value for platform in list(PlatformOption)
}


class PlatformArtifact(NamedTuple):
    platform: Platform
    url: str
    sha256: str


def get_filename(filename_template: Template, version: str, platform: Platform) -> str:
    return filename_template.substitute(
        {
            "VERSION": version,
            "PLATFORM": platform.platform,
            "ARCHITECTURE": platform.architecture,
        }
    )


def get_url_sha256(url: str) -> str:
    with urlopen(url) as response:
        body = response.read()
        sha256_hash = hashlib.sha256()
        sha256_hash.update(body)
        return sha256_hash.hexdigest()


def get_artifact(
    repository: str, filename_template: Template, version: str, platform: Platform
) -> PlatformArtifact:
    filename = get_filename(
        filename_template=filename_template, version=version, platform=platform
    )
    url = f"{repository}/releases/download/{version}/{filename}"
    return PlatformArtifact(platform=platform, url=url, sha256=get_url_sha256(url))


def generate(
    repository: str,
    version: str,
    platform_artifacts: list[PlatformArtifact],
) -> str:
    arch_templates: defaultdict[str, list[str]] = defaultdict(list)
    for artifact in platform_artifacts:
        arch_templates[artifact.platform.platform_alias].append(
            ARCHITECTURE_TEMPLATE.substitute(
                {
                    "ARCHITECTURE": artifact.platform.architecture_alias,
                    "URL": artifact.url,
                    "SHA256": artifact.sha256,
                }
            )
        )
    platform_templates: list[str] = []
    for platform, templates in arch_templates.items():
        platform_templates.append(
            PLATFORM_TEMPLATE.substitute(
                {"PLATFORM": platform, "ARCHITECTURE": "\n\n    ".join(templates)}
            )
        )

    url = f"{repository}/archive/refs/tags/{version}.tar.gz"
    return TEMPLATE.substitute(
        {
            "REPOSITORY": repository,
            "URL": url,
            "VERSION": version,
            "SHA256": get_url_sha256(url),
            "DOWNLOAD": "\n\n  ".join(platform_templates),
        }
    )


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Generate dotty formula.",
        formatter_class=argparse.ArgumentDefaultsHelpFormatter,
    )
    parser.add_argument(
        "--repository",
        default=REPOSITORY,
        help="The base repository URL.",
    )
    parser.add_argument(
        "--filename",
        default=FILENAME,
        help="The filename template of the release artifacts.",
    )
    parser.add_argument(
        "--version",
        required=True,
        help="The version being released.",
    )
    parser.add_argument(
        "--platform",
        action="append",
        type=lambda val: PLATFORM_MAPPING[val],
        choices=PLATFORM_MAPPING.values(),
        required=True,
        help="The platforms being released to.",
    )
    parser.add_argument(
        "--output",
        default=DOTTY_RB_PATH,
        help="The filename to write to or - for stdout.",
    )

    args = parser.parse_args()
    return args


@contextlib.contextmanager
def smart_open(filename=None):
    if filename and filename != "-":
        fh = open(filename, "w")
    else:
        fh = sys.stdout

    try:
        yield fh
    finally:
        if fh is not sys.stdout:
            fh.close()


def main():
    args = parse_args()
    filename_template = Template(args.filename)
    platform_artifacts = [
        get_artifact(
            repository=args.repository,
            filename_template=filename_template,
            version=args.version,
            platform=platform,
        )
        for platform in args.platform
    ]
    formula = generate(
        repository=args.repository,
        version=args.version,
        platform_artifacts=platform_artifacts,
    )
    with smart_open(args.output) as fh:
        print(formula, file=fh)


if __name__ == "__main__":
    main()

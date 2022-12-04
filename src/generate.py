#!/usr/bin/env python3

import argparse
from collections import defaultdict
import enum
from pathlib import Path
from string import Template
from typing import NamedTuple

TEMPLATE = Template(
    """# typed: false
# frozen_string_literal: true

# This file was generated. DO NOT EDIT.
class Dotty < Formula
  desc "Dotfiles using symlinks and embedded git"
  homepage "https://github.com/keithhendry/dotty"
  license "MIT"

  $download

  def install
    bin.install "dotty"
  end

  test do
    system "#{bin}/dotty", "--version"
  end
end"""
)

PLATFORM_TEMPLATE = Template(
    """on_$platform do
    $arch
  end"""
)

ARCHITECTURE_TEMPLATE = Template(
    """on_${arch_name} do
      url "https://github.com/keithhendry/dotty/releases/download/$version/$artifact"
      sha256 "$sha256"
    end"""
)


class Platform(NamedTuple):
    platform: str
    platform_name: str
    arch: str
    arch_name: str

    def __repr__(self) -> str:
        return f"{self.platform}/{self.arch}"


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
    filename: str
    sha256: str


def get_filename(platform: Platform, version: str) -> str:
    return f"dotty-{version}-{platform.platform}-{platform.arch}.tar.gz"


def read_checksums(checksums_path: Path) -> dict[str, str]:
    checksums: dict[str, str] = {}

    with open(checksums_path) as f:
        for line in f.readlines():
            sha256, file = line.strip().split("  ")
            checksums[file] = sha256

    return checksums


def get_artifact(
    checksums: dict[str, str], version: str, platform: Platform
) -> PlatformArtifact:
    filename = get_filename(platform, version)
    checksum = checksums[filename]
    return PlatformArtifact(platform, filename, checksum)


def generate(version: str, platform_artifacts: list[PlatformArtifact]) -> str:
    arch_templates: defaultdict[str, list[str]] = defaultdict(list)
    for artifact in platform_artifacts:
        arch_templates[artifact.platform.platform_name].append(
            ARCHITECTURE_TEMPLATE.substitute(
                {
                    "arch_name": artifact.platform.arch_name,
                    "version": version,
                    "artifact": artifact.filename,
                    "sha256": artifact.sha256,
                }
            )
        )
    platform_templates: list[str] = []
    for platform, templates in arch_templates.items():
        platform_templates.append(
            PLATFORM_TEMPLATE.substitute(
                {"platform": platform, "arch": "\n\n    ".join(templates)}
            )
        )

    return TEMPLATE.substitute({"download": "\n\n  ".join(platform_templates)})


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Generate dotty formula.")
    parser.add_argument(
        "--checksums-path",
        type=Path,
        required=True,
        help="The path to the checksums file.",
    )
    parser.add_argument(
        "--filename",
        default="dotty-{VERSION}-{PLATFORM}-{ARCHITECTURE}.tar.gz",
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

    args = parser.parse_args()
    return args


def main():
    args = parse_args()
    checksums = read_checksums(args.checksums_path)
    platform_artifacts = [
        get_artifact(checksums, args.version, platform) for platform in args.platform
    ]
    formula = generate(
        version=args.version,
        platform_artifacts=platform_artifacts,
    )
    print(formula)


if __name__ == "__main__":
    main()

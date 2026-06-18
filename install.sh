#!/usr/bin/env bash
set -euo pipefail

FLAKE_TARGET="vivobook-m1403qa"
DISKO_CONFIG="nixos/disko/ext4-luks.nix"
HARDWARE_CONFIG="nixos/hardware/configuration.nix"

echo "==> Generating hardware configuration..."
nixos-generate-config --no-filesystems --show-hardware-config > "${HARDWARE_CONFIG}"

echo "==> Partitioning disks (DESTRUCTIVE)..."
sudo nix \
  --experimental-features "nix-command flakes" \
  run github:nix-community/disko/latest -- \
  --mode destroy,format,mount "${DISKO_CONFIG}"

echo "==> Installing NixOS..."
sudo nixos-install \
  --root /mnt \
  --no-root-passwd \
  --flake ".#${FLAKE_TARGET}" \
  --option extra-substituters "https://hambosto.cachix.org https://nix-community.cachix.org "https://noctalia.cachix.org"" \
  --option extra-trusted-public-keys "hambosto.cachix.org-1:y8ajUwyukSGFdhV13wTsFbcqyITABZQ4bEW4pN8kUDg= nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs=       "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4=""

echo "==> Installation complete. Rebooting..."
sudo reboot

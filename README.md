# NixOS Configuration

A declarative, reproducible NixOS configuration flake for streamlined system setup. This repository provides everything you need to quickly deploy and maintain your NixOS system with confidence.

## ✨ Features

- **Hardware-aware configurations** - Automatically adapts to your specific hardware
- **Modular architecture** - Easily extend or modify individual components
- **Declarative system management** - What you see is what you get, every time
- **Flake-powered** - Leveraging the latest Nix features for reproducibility
- **Disko integration** - Automated disk partitioning and formatting

## 📋 Prerequisites

- A computer with NixOS minimal installation media booted
- Internet connection
- Basic familiarity with Nix concepts
- USB drive (8GB+) for creating bootable installation media

## 🚀 Installation

Follow these steps to deploy this configuration:

### 1. Boot into NixOS Minimal Installation Media

Download the [NixOS minimal ISO](https://nixos.org/download.html#nixos-iso) and boot your computer using this installation media. The minimal ISO is recommended as it provides just the essentials needed for installation without unnecessary packages.

### 2. Install Git

```bash
nix-shell -p git
```

### 3. Clone This Repository

```bash
git clone https://github.com/hambosto/nixos.git
cd nixos
```

### 4. Generate Hardware Configuration

```bash
nixos-generate-config --no-filesystems --show-hardware-config > nixos/hardware/configuration.nix
```

### 5. Run the Partitioning Script

```bash
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount nixos/disko/btrfs-luks.nix
```

### 6. Install the System

```bash
sudo nixos-install --root /mnt --no-root-passwd --flake .#vivobook-m1403qa
```

After installation completes, reboot your system. You'll be greeted with the NixOS login screen where you can sign in using the root password you set during installation.

## 🔧 Customization

This configuration is designed to be easily customizable:

- **Hardware profiles**: Located in `nixos/hardware/`
- **User configurations**: Modify `nixos/users/` to add or adjust user accounts
- **System services**: Edit service configurations in `nixos/services/`
- **Package selection**: Adjust packages in `nixos/packages/`

The modular structure makes it simple to adapt the configuration to your specific needs without having to understand the entire system at once.

## ⚠️ Troubleshooting

If you encounter issues during installation or rebuild:

- Verify your hardware configuration matches your actual hardware
- Ensure Nix flakes are enabled (`experimental-features = nix-command flakes` in nix configuration)
- Check that all paths in the configuration exist
- Examine logs with `journalctl -xe` for detailed error information

For persistent issues, please file a detailed bug report in the GitHub issue tracker.

## 👥 Contributing

**Note on contributions**: This repository contains my personal NixOS configuration tailored to my specific needs and hardware. While you're welcome to submit issues or PRs, please be aware that contributions may not be accepted if they don't align with my use case. 

**Instead of PRs, I encourage you to:**
- Fork this repository
- Adapt it to your own needs
- Use it as inspiration for your own NixOS configuration

If you find a bug or security issue, I'd still appreciate an issue report!

## 📄 License

This project is licensed under the [MIT License](LICENSE) - see the LICENSE file for details.

---

**Note**: This configuration is primarily designed for personal use but shared in hopes it may be useful to others. While care has been taken to make it adaptable, you may need to adjust certain aspects to suit your specific hardware and preferences.

**Important**: This configuration requires the minimal NixOS installation ISO. Using the full/graphical ISO may lead to conflicts with the packages and configurations defined in this flake.

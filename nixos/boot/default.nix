{
  lib,
  pkgs,
  ...
}:
{
  # ---- Secure Boot and TPM Setup with Lanzaboote ----
  #
  # This section outlines how to configure Secure Boot using the `lanzaboote` tool,
  # integrate TPM-based encryption, and manage the bootloader using `systemd-boot`.
  #
  # Steps to set up Secure Boot:
  #
  # 1. Generate Secure Boot signing keys using sbctl:
  #    sudo sbctl create-keys
  #
  # 2. Enable lanzaboote for Secure Boot support and disable systemd-boot, then rebuild the system:
  #    # Set `lanzaboote.enable = true;` and disable systemd-boot.
  #    sudo sbctl verify
  #
  # 3. Enable Secure Boot in the BIOS/UEFI and reset Secure Boot keys:
  #    # Ensure that Secure Boot is enabled in the BIOS/UEFI settings.
  #    sudo sbctl enroll-keys --microsoft
  #
  # 4. Check the status of the bootloader:
  #    bootctl status
  #
  # 5. Enable initrd with systemd-based initrd for TPM-based encryption (if desired):
  #    # This is required for using TPM 2.0 for disk encryption:
  #    sudo systemd-cryptenroll --tpm2-device=auto --tpm2-pcrs=0+2+7+12 --wipe-slot=tpm2 /dev/nvme0n1p2
  #
  # Configuration Options:
  # - `bootspec.enable`: Enables the boot specification (true/false).
  # - `kernelPackages`: Specifies the latest Linux kernel packages.
  # - `loader.efi.canTouchEfiVariables`: Allows modification of EFI variables (true/false).
  # - `loader.systemd-boot.enable`: Enables the systemd-boot bootloader (true/false).
  # - `lanzaboote`: Optional configuration for Secure Boot handling, disabled by default.
  # - `tmp.cleanOnBoot`: Cleans temporary files on boot (true/false).
  # - `initrd.systemd.enable`: Enables systemd-based initrd (true/false) for TPM-based encryption.

  boot = {
    bootspec.enable = true;
    kernelPackages = pkgs.linuxPackages_cachyos;
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = lib.mkForce false; # Disable this if using lanzaboote instead.
    };
    lanzaboote = {
      enable = true; # Set to `true` to enable lanzaboote for Secure Boot.
      pkiBundle = "/var/lib/sbctl"; # Path to the sbctl public key infrastructure (PKI) bundle.
    };
    tmp.cleanOnBoot = true;
    initrd.systemd.enable = true; # Set to `true` if using systemd-based initrd for TPM.
  };
}

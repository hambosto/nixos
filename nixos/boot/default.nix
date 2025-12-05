{ pkgs, ... }:
{
  # ---- Secure Boot and TPM Setup with Limine ----
  #
  # This section outlines how to configure Secure Boot using the `limine` bootloader,
  # integrate TPM-based encryption, and manage boot configuration.
  #
  # Steps to set up Secure Boot with Limine:
  #
  # 1. Generate Secure Boot signing keys using sbctl:
  #    sudo sbctl create-keys
  #
  # 2. Reset Secure Boot to "Setup Mode" in your BIOS/UEFI:
  #    # This step is device-specific. Look for "Clear Secure Boot Keys" or "Reset to Setup Mode"
  #    # in your UEFI firmware settings.
  #
  # 3. Enroll the keys with Microsoft keys included (recommended for compatibility):
  #    sudo sbctl enroll-keys -m -f
  #
  # 4. Enable Secure Boot in the configuration below by setting `secureBoot.enable = true;`
  #    then rebuild your system:
  #    sudo nixos-rebuild switch
  #
  # 5. Enable Secure Boot in the BIOS/UEFI (disable "Setup Mode"):
  #    # Once keys are enrolled, disable Setup Mode and enable Secure Boot in firmware.
  #
  # 6. (Optional) Enable TPM 2.0 for disk encryption:
  #    # First enable systemd-based initrd by setting `initrd.systemd.enable = true;`
  #    # Then enroll your encrypted partition with TPM:
  #    sudo systemd-cryptenroll --tpm2-device=auto --tpm2-pcrs=0+2+7+12 --wipe-slot=tpm2 /dev/nvme0n1p2
  #
  # Configuration Options:
  # - `bootspec.enable`: Enables the boot specification for proper boot entry generation.
  # - `kernelPackages`: Specifies which Linux kernel packages to use (latest recommended).
  # - `loader.efi.canTouchEfiVariables`: Allows modification of EFI variables (required for Limine).
  # - `loader.limine.enable`: Enables the Limine bootloader.
  # - `loader.limine.efiSupport`: Enables EFI mode for Limine (required for UEFI systems).
  # - `loader.limine.secureBoot.enable`: Signs the Limine binary with sbctl for Secure Boot.
  # - `tmp.cleanOnBoot`: Cleans temporary files on boot for better security.
  # - `initrd.systemd.enable`: Enables systemd-based initrd (required for TPM-based encryption).

  boot = {
    bootspec.enable = true;
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      efi.canTouchEfiVariables = true;
      limine = {
        enable = true;
        efiSupport = true;
        secureBoot.enable = false; # Set to `true` to enable Secure Boot with sbctl signing.
      };
    };
    tmp.cleanOnBoot = true;
    initrd.systemd.enable = false; # Set to `true` if using systemd-based initrd for TPM.
  };
}

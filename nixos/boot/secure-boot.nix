{
  # ---- Secure Boot and TPM Setup ----
  #
  # This file configures Secure Boot using the `limine` bootloader and integrates
  # TPM-based encryption for enhanced security.
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
  #    # First enable systemd-based initrd in system.nix by setting `initrd.systemd.enable = true;`
  #    # Then enroll your encrypted partition with TPM:
  #    sudo systemd-cryptenroll --tpm2-device=auto --tpm2-pcrs=0+2+7+12 --wipe-slot=tpm2 /dev/nvme0n1p2
  #
  # Configuration Options:
  # - `loader.limine.secureBoot.enable`: Signs the Limine binary with sbctl for Secure Boot.
  # - `initrd.systemd.enable`: Enables systemd-based initrd (required for TPM-based encryption).
  boot = {
    loader.limine.secureBoot.enable = false; # Set to `true` to enable Secure Boot with sbctl signing.
    initrd.systemd.enable = false; # Set to `true` if using systemd-based initrd for TPM.
  };
}

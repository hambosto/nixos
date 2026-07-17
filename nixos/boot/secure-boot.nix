{
  # ---- Secure Boot Setup ----
  #
  # This file configures Secure Boot using the `limine` bootloader, with
  # automatic key generation and enrollment. Because this file is part
  # of your flake, this enrollment happens DURING bootloader installation
  # itself — i.e. during the `nixos-install` step inside `install.sh`,
  # not as a separate step after.
  #
  # Steps to set up Secure Boot with Limine:
  #
  # 1. BEFORE running `./install.sh`, reset Secure Boot to "Setup Mode"
  #    in your BIOS/UEFI:
  #    # This step is device-specific. Look for "Clear Secure Boot Keys" or "Reset to Setup Mode"
  #    # in your UEFI firmware settings.
  #
  # 2. With the firmware already in Setup Mode, run the install script
  #    as usual:
  #    ./install.sh
  #    # Because `secureBoot.enable` and `autoEnrollKeys.enable` are set below
  #    # (which implies key generation too), the bootloader install step inside `nixos-install`
  #    # (the "Installing NixOS..." stage of install.sh) generates your
  #    # Secure Boot keys and enrolls them into firmware automatically —
  #    # equivalent to running `sbctl create-keys` followed by
  #    # `sbctl enroll-keys --microsoft --firmware-builtin` yourself.
  #    # install.sh reboots automatically at the end — let it.
  #
  # 3. After the reboot, confirm the fresh install boots, then go back
  #    into the BIOS/UEFI and enable Secure Boot (disable "Setup Mode"):
  #    # Once keys are enrolled, disable Setup Mode and enable Secure Boot in firmware.
  #
  # 4. Verify:
  #    bootctl status
  #    # Should show: Secure Boot: enabled (user)
  #    # If it shows "disabled" or "setup" instead, Setup Mode likely wasn't
  #    # active during install.sh's run — rerun `sudo nixos-rebuild switch`
  #    # (from within the installed system, flake target "vivobook-m1403qa")
  #    # while back in Setup Mode to trigger key-gen + enrollment after the fact.
  #
  # 5. (Optional) Enable TPM 2.0 for disk encryption:
  #    # Bind only to PCR 7 (Secure Boot state) for automatic unlock at boot.
  #    # PCR 0/2 are redundant with 7 and just cause unnecessary re-enrollment
  #    # on firmware updates, so they're left out:
  #    sudo systemd-cryptenroll --tpm2-device=auto --tpm2-pcrs=7 --wipe-slot=tpm2 /dev/nvme0n1p2
  #    # Make sure Secure Boot is active and in user mode before running this,
  #    # otherwise unauthorized boot devices could unlock the volume.
  #    # Note: without a PIN, TPM+PCR only proves the software state hasn't
  #    # changed — it does not protect against theft (anyone who powers on
  #    # the device gets an automatic unlock).
  #
  # Configuration Options:
  # - `loader.limine.secureBoot.enable`: Signs the Limine binary with sbctl for Secure Boot.
  # - `loader.limine.secureBoot.autoEnrollKeys.enable`: Enrolls the generated keys automatically.
  #   Note: this alone implies `autoGenerateKeys = true` — the module sets that for you
  #   automatically whenever autoEnrollKeys.enable is true, so it doesn't need to be
  #   set explicitly here.
  boot.loader.limine.secureBoot = {
    enable = true; # Set to `true` to enable Secure Boot with sbctl signing.
    autoEnrollKeys.enable = true; # Auto-generates keys (if none exist) and enrolls them.
  };
}

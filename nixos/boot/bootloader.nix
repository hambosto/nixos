{
  boot = {
    bootspec.enable = true;
    loader = {
      efi.canTouchEfiVariables = true;
      limine = {
        enable = true;
        efiSupport = true;
      };
    };
    tmp.cleanOnBoot = true;
  };
}

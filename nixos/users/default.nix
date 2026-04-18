{ config, pkgs, ... }:
{
  users = {
    mutableUsers = false;
    users = {
      ilham = {
        description = "Ilham Putra Husada";
        extraGroups = [ "wheel" ];
        hashedPassword = "$6$cps4.Bkw1vFnkmpJ$2cRDUI6QVPNZx1MCgIURL5zuLPLkXYdF2mR3gDu5bSswVj5KWJp/CA0QcFhWNTBbCkKbnIYD1C/Y38gMm0O6w/"; # admin
        # hashedPasswordFile = config.sops.secrets.hashed-password.path;
        isNormalUser = true;
        shell = pkgs.fish;
      };
    };
  };
}

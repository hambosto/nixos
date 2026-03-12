{ config, pkgs, ... }:
{
  users = {
    mutableUsers = false;
    users = {
      ilham = {
        description = "Ilham Putra Husada";
        extraGroups = [ "wheel" ];
        # hashedPassword = "$6$2NNDncfRhhRCNdGt$lAce2eVzcOmL5NEsEerbWQDpqvwOQcqerrzD/SEGET9VK6c1gu/BJA9EzJwpubYAHnyEzrrmreDpJCJS9eqD51";
        hashedPasswordFile = config.sops.secrets.hashed-password.path;
        isNormalUser = true;
        shell = pkgs.fish;
      };
    };
  };
}

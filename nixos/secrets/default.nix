{ inputs, ... }:
{
  imports = [ inputs.sops-nix.nixosModules.sops ];

  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;
    age.keyFile = "/home/ilham/.config/sops/age/keys.txt";

    secrets.hashed-password.neededForUsers = true;
  };
}

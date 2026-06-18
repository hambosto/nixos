{ inputs, ... }:
{
  imports = [ inputs.sops-nix.nixosModules.default ];

  sops = {
    age.keyFile = "/home/ilham/.config/sops/age/keys.txt";
    defaultSopsFile = ../../secrets/secrets.yaml;

    secrets.hashed-password.neededForUsers = true;
  };
}

{
  hostname,
  inputs,
  username,
  system,
  fullname,
  ...
}:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    extraSpecialArgs = {
      inherit username;
      inherit inputs;
      inherit hostname;
      inherit system;
      inherit fullname;
    };
    users.${username} = import ../../home-manager;
  };
}

{
  fullname,
  hostname,
  inputs,
  system,
  username,
  ...
}:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager.users.${username} = import ../../home-manager;

  home-manager.extraSpecialArgs = {
    inherit username;
    inherit inputs;
    inherit hostname;
    inherit system;
    inherit fullname;
  };
}

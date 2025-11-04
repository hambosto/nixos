{ config, ... }:
{
  users = {
    mutableUsers = false;
    users = {
      ilham = {
        isNormalUser = true;
        description = "Ilham Putra Husada";
        extraGroups = [
          "networkmanager"
          "wheel"
        ];
        shell = config.programs.fish.package;
        hashedPassword = "$6$/1/Fc9yZLcNu6KVM$VxT6dGXJj81BlYnOrJ0pji/bxWe7PvRKOojy5kj3sjFvmtUxnNw2MHbhgVPay2RMygByKYd.t1ijaeohzyNcq/";
      };
      root.hashedPassword = "!"; # Lock the root user.
    };
  };
}

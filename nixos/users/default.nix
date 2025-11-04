{ pkgs, ... }:
{
  users = {
    mutableUsers = false;
    users = {
      ilham = {
        isNormalUser = true;
        extraGroups = [
          "networkmanager"
          "wheel"
        ];
        shell = pkgs.fish;
        hashedPassword = "$6$/1/Fc9yZLcNu6KVM$VxT6dGXJj81BlYnOrJ0pji/bxWe7PvRKOojy5kj3sjFvmtUxnNw2MHbhgVPay2RMygByKYd.t1ijaeohzyNcq/";
      };
    };
  };
}

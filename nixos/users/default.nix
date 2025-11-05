{ pkgs, ... }:
{
  users = {
    mutableUsers = false;
    users = {
      ilham = {
        description = "Ilham Putra Husada";
        extraGroups = [
          "networkmanager"
          "wheel"
        ];
        hashedPassword = "$6$/1/Fc9yZLcNu6KVM$VxT6dGXJj81BlYnOrJ0pji/bxWe7PvRKOojy5kj3sjFvmtUxnNw2MHbhgVPay2RMygByKYd.t1ijaeohzyNcq/";
        isNormalUser = true;
        shell = pkgs.fish;
      };
    };
  };
}

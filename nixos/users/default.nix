{ pkgs, ... }:
{
  users = {
    mutableUsers = false;
    users.ilham = {
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
      hashedPassword = "$y$j9T$Lbwif0l9QnHjD7TG0Xekp/$zwD2gb/43zdE4nBSTibnjVg1fzulII7us1I2xB75QB6";
      isNormalUser = true;
      shell = pkgs.fish;
    };
  };
}

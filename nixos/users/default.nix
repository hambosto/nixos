{ pkgs, ... }:
{
  users.users.ilham = {
    isNormalUser = true;
    description = "Ilham Putra Husada";
    extraGroups = [
      "docker"
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.fish;
    initialHashedPassword = "$6$/h/R3yYQDg0n3oNL$dqkwBWyN0KyOo4R/u9o9RUjqkNvg9W5B3gnGoR19YokrCIVt17/69L3X5efshhAE8GymqrxOYMRM54hV21tOF1";
  };
}

{
  username,
  fullname,
  ...
}:
{
  users.users.${username} = {
    description = "${fullname}";
    extraGroups = ["networkmanager" "wheel"];
    initialHashedPassword = "$6$/h/R3yYQDg0n3oNL$dqkwBWyN0KyOo4R/u9o9RUjqkNvg9W5B3gnGoR19YokrCIVt17/69L3X5efshhAE8GymqrxOYMRM54hV21tOF1"; 
    isNormalUser = true;
  };
}

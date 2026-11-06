{ pkgs, ... }:
let
  sudoers-lecture = pkgs.writeText "sudoers.lecture" ''

    Congratulations, you have been promoted to TEMPORARY GOD.
    Please read the Terms of Service you will absolutely not read:

       1. You are about to run a command you found on Stack Overflow.
          The top answer is from 2011. The comments say "DON'T DO THIS".
          You scrolled past the comments. Classic.
       2. "It works on my machine" is not a defense. It is a confession.
       3. Root does not ask "are you sure?". Root is the friend who
          says "yeah, jump, I'll hold your drink".
       4. Backups are like parachutes: you find out you needed one
          about two seconds too late.
       5. chmod -R 777 is not a fix. It is a cry for help
          with extra steps.
       6. Yes, you could have read the error message. No, you did not.
          Yes, we are all very proud of you.
       7. Somewhere, a sysadmin felt a disturbance in the Force
          and does not know why. They are already tired.
       8. If this breaks prod, the postmortem will say "human error".
          The human is you. The error is also you.

             \   ^__^
              \  (oo)\_______
                 (__)\       )\/\
                     ||----w |
                     ||     ||    "Mooooove fast. Break everything."

    Your command has been logged, filed, and forwarded to HR,
    your mom, and a very disappointed Linus Torvalds.
    Nobody is reading the logs. That's the real danger.

  '';
in
{
  security.sudo = {
    enable = true;
    extraConfig = ''
      Defaults insults
      Defaults lecture = always
      Defaults lecture_file = ${sudoers-lecture}
      Defaults pwfeedback
    '';
  };
}

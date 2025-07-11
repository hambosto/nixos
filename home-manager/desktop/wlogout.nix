{
  config,
  pkgs,
  ...
}:
{
  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown";
        keybind = "s";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
        keybind = "r";
      }
      {
        label = "logout";
        action = "hyprctl dispatch exit";
        text = "Exit";
        keybind = "e";
      }
      {
        label = "suspend";
        action = "systemctl suspend";
        text = "Suspend";
        keybind = "u";
      }
      {
        label = "lock";
        action = "hyprlock";
        text = "Lock";
        keybind = "l";
      }
      {
        label = "hibernate";
        action = "systemctl hibernate";
        text = "Hibernate";
        keybind = "h";
      }
    ];
    style = ''
      * {
        font-family: Ubuntu Nerd Font;
      	background-image: none;
      	transition: 20ms;
        box-shadow: none;
      }

      window {
        background: linear-gradient(
          rgba(0, 0, 0, 0.75), 
          rgba(0, 0, 0, 0.75)
        ), url("${config.stylix.image}");
        background-size: cover;
        font-size: 16pt;
        color: #${config.lib.stylix.colors.base0D};
      }

      button {
      	background-repeat: no-repeat;
        background-position: center;
        background-size: 20%;
        background-color: rgba(200, 220, 255, 0);
        animation: gradient_f 20s ease-in infinite;
        border-radius: 80px;
        border: 0px;
        transition: all 0.3s cubic-bezier(.55, 0.0, .28, 1.682), box-shadow 0.2s ease-in-out, background-color 0.2s ease-in-out;
      }

      button:focus {
        background-size: 22%;
        border: 0px;
      }

      button:hover {
        background-color: #${config.lib.stylix.colors.base0D};
        opacity: 0.8;
        color: #${config.lib.stylix.colors.base00};
        background-size: 30%;
        margin: 30px;
        border-radius: 80px;
        box-shadow: 0 0 50px #${config.lib.stylix.colors.base0D};
      }

      button span {
        font-size: 1.2em;
      }

      #logout {
      	margin: 10px;
      	border-radius: 20px;
      	background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/logout.png"));
      }

      #suspend {
      	margin: 10px;
      	border-radius: 20px;
      	background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/suspend.png"));
      }

      #shutdown {
      	margin: 10px;
      	border-radius: 20px;
      	background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/shutdown.png"));
      }

      #reboot {
      	margin: 10px;
      	border-radius: 20px;
      	background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/reboot.png"));
      }

      #lock {
      	margin: 10px;
      	border-radius: 20px;
      	background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/lock.png"));
      }

      #hibernate {
      	margin: 10px;
      	border-radius: 20px;
      	background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/hibernate.png"));
      }
    '';
  };
}

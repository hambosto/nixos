{
  config,
  ...
}:
{
  services.swaync = {
    enable = true;
    settings = {
      control-center-height = 915;
      control-center-margin-bottom = 10;
      control-center-margin-left = 10;
      control-center-margin-right = 10;
      control-center-margin-top = 10;
      control-center-width = 400;
      cssPriority = "user";
      fit-to-screen = false;
      hide-on-action = true;
      hide-on-clear = false;
      image-visibility = "when-available";
      keyboard-shortcuts = true;
      notification-body-image-height = 128;
      notification-body-image-width = 200;
      notification-icon-size = 64;
      notification-window-width = 375;
      positionX = "right";
      positionY = "top";
      script-fail-notify = true;
      timeout = 6;
      timeout-critical = 0;
      timeout-low = 3;
      transition-time = 200;

      widget-config = {
        title = {
          text = "Notification Center";
          clear-all-button = true;
          button-text = "󰆴";
        };
        dnd = {
          text = "Do Not Disturb";
        };
        label = {
          max-lines = 1;
          text = "Notification Center";
        };
        mpris = {
          image-size = 96;
          image-radius = 4;
        };
      };
      widgets = [
        "title"
        "dnd"
        "mpris"
        "notifications"
      ];
    };
    style = ''
      * {
        font-family: "Ubuntu Nerd Font";
        background-clip: border-box;
      }

      label {
        color: #${config.lib.stylix.colors.base05};
      }

      .notification {
        border: none;
        box-shadow: none;
        border-radius: 4px;
        background: inherit;
      }

      .notification button {
        background: transparent;
        border-radius: 0px;
        border: none;
        margin: 0px;
        padding: 0px;
      }

      .notification button:hover {
        background: #${config.lib.stylix.colors.base02};
      }

      .notification-content {
        min-height: 64px;
        margin: 10px;
        padding: 0px;
        border-radius: 0px;
      }

      .close-button {
        background: transparent;
        color: transparent;
      }

      .notification-default-action,
      .notification-action {
        background: transparent;
        border: none;
      }

      .notification-default-action {
        border-radius: 4px;
      }

      .notification-default-action:not(:only-child) {
        border-bottom-left-radius: 0px;
        border-bottom-right-radius: 0px;
      }

      .notification-action {
        border-radius: 0px;
        padding: 2px;
        color: #${config.lib.stylix.colors.base05};
      }

      .notification-action:first-child {
        border-bottom-left-radius: 4px;
      }

      .notification-action:last-child {
        border-bottom-right-radius: 4px;
      }

      .summary {
        color: #${config.lib.stylix.colors.base05};
        font-size: 14px;
        padding: 0px;
      }

      .time {
        color: #${config.lib.stylix.colors.base04};
        font-size: 12px;
        text-shadow: none;
        margin: 0px 0px 0px 0px;
        padding: 2px 0px;
      }

      .body {
        font-size: 14px;
        font-weight: 500;
        color: #${config.lib.stylix.colors.base04};
        text-shadow: none;
        margin: 0px 0px 0px 0px;
      }

      .body-image {
        border-radius: 4px;
      }

      .control-center {
        background: #${config.lib.stylix.colors.base00};
        border-radius: 5px;
        border: 0px solid #${config.lib.stylix.colors.base0E};
        box-shadow: 0 0 10px 0 #${config.lib.stylix.colors.base01};
        margin: 10px;
        padding: 4px;
      }

      .control-center-list {
        background: #${config.lib.stylix.colors.base00};
        min-height: 5px;
        border-top: none;
        border-radius: 0px 0px 4px 4px;
      }

      .control-center-list-placeholder,
      .notification-group-icon,
      .notification-group {
        color: #${config.lib.stylix.colors.base04};
      }

      .notification-group {
        opacity: 1.0;
        box-shadow: none;
      }

      .notification-group > box {
        all: unset;
        background: transparent;
        padding: 4px;
        margin: 0px;
        border: none;
        border-radius: 4px;
        box-shadow: none;
      }

      .notification-row {
        outline: none;
        transition: all 1s ease;
        background: #${config.lib.stylix.colors.base00};
        border: 0px solid #${config.lib.stylix.colors.base01};
        margin: 10px 5px 0px 5px;
        border-radius: 5px;
      }

      .notification-row:focus,
      .notification-row:hover {
        box-shadow: none;
      }

      .control-center-list > row,
      .control-center-list > row:focus,
      .control-center-list > row:hover {
        background: transparent;
        border: none;
        margin: 0px;
        padding: 5px 10px 5px 10px;
        box-shadow: none;
      }

      .control-center-list > row:last-child {
        padding: 5px 10px 10px 10px;
      }

      .blank-window {
        background: transparent;
      }

      .widget-title {
        margin: 0px;
        background: transparent;
        border-radius: 4px 4px 0px 0px;
        border-bottom: none;
      }

      .widget-title > label {
        margin: 18px 10px;
        font-size: 20px;
        font-weight: 500;
      }

      .widget-title > button {
        font-weight: 700;
        padding: 7px 3px;
        margin-right: 10px;
        color: #${config.lib.stylix.colors.base01};
        transition: all 0.2s ease;
      }

      .widget-title > button:hover {
        background: #${config.lib.stylix.colors.base09};
        color: #${config.lib.stylix.colors.base00};
        border-color: #${config.lib.stylix.colors.base09};
        box-shadow: 0 2px 4px #${config.lib.stylix.colors.base02};
      }

      .widget-label {
        margin: 0px;
        padding: 0px;
        min-height: 5px;
        background: #${config.lib.stylix.colors.base01};
        border-radius: 0px 0px 4px 4px;
        border-top: none;
      }

      .widget-label > label {
        font-size: 15px;
        font-weight: 400;
      }

      .widget-mpris {
        padding: 8px;
        padding-bottom: 15px;
        margin-bottom: -33px;
      }

      .widget-mpris > box {
        padding: 0px;
        margin: -5px 0px -10px 0px;
        padding: 0px;
        border-radius: 4px;
        background: #${config.lib.stylix.colors.base01};
      }

      .widget-mpris > box > button:nth-child(1),
      .widget-mpris > box > button:nth-child(3) {
        margin-bottom: 0px;
      }

      .widget-mpris > box > button:nth-child(1) {
        margin-left: -25px;
        margin-right: -25px;
        opacity: 0;
      }

      .widget-mpris > box > button:nth-child(3) {
        margin-left: -25px;
        margin-right: -25px;
        opacity: 0;
      }

      .widget-mpris-album-art {
        all: unset;
      }

      .widget-mpris > box > carousel > widget > box > box:nth-child(2) {
        margin: 10px 10px 5px 10px;
      }

      .widget-mpris > box > carousel > widget > box > box:nth-child(2) > button {
        border-radius: 4px;
      }

      .widget-mpris > box > carousel > widget > box > box:nth-child(2) > button:hover {
        background: #${config.lib.stylix.colors.base02};
      }

      carouselindicatordots {
        opacity: 0;
      }

      .widget-mpris-title {
        color: #${config.lib.stylix.colors.base05};
        font-weight: bold;
        font-size: 1.25rem;
        text-shadow: 0px 0px 5px #${config.lib.stylix.colors.base01};
      }

      .widget-mpris-subtitle {
        color: #${config.lib.stylix.colors.base05};
        font-size: 1rem;
        text-shadow: 0px 0px 3px #${config.lib.stylix.colors.base01};
      }

      .widget-mpris-player {
        border-radius: 0px;
        margin: 0px;
      }

      .widget-mpris-player > box > image {
        margin: 0px 0px -48px 0px;
      }

      .notification-group > box.vertical {
        margin-top: 3px;
      }

      .widget-dnd {
        margin: 6px;
        font-size: 1.2rem;
      }

      .widget-dnd > switch {
        background: #${config.lib.stylix.colors.base0D};
        font-size: initial;
        border-radius: 8px;
        box-shadow: none;
        padding: 2px;
      }

      .widget-dnd > switch:checked {
        background: #${config.lib.stylix.colors.base08};
      }

      .widget-dnd > switch slider {
        background: #${config.lib.stylix.colors.base00};
        border-radius: 6px;
      }
    '';
  };
}

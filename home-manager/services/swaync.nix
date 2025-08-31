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
        font-family: Ubuntu Nerd Font;
        color: #${config.lib.stylix.colors.base05};
      }

      .notification-row {
        outline: none;
      }

      .notification-row:focus,
      .notification-row:hover {
        background: #${config.lib.stylix.colors.base00};
      }

      .notification {
        border: 1px solid #${config.lib.stylix.colors.base00};
        border-radius: 4px;
        margin: 6px 12px;
        box-shadow: none;
        padding: 0;
        font-size: 20px;
      }

      .critical {
        border: 1px solid #${config.lib.stylix.colors.base08};
      }

      .notification-content {
        background: #${config.lib.stylix.colors.base00};
        padding: 6px;
        border-radius: 4px;
      }

      .close-button {
        background: #${config.lib.stylix.colors.base05};
        color: #${config.lib.stylix.colors.base00};
        text-shadow: none;
        padding: 0;
        border-radius: 100%;
        margin-top: 10px;
        margin-right: 16px;
        box-shadow: none;
        border: none;
        min-width: 24px;
        min-height: 24px;
      }

      .close-button:hover {
        box-shadow: none;
        background: #${config.lib.stylix.colors.base08};
        transition: all 0.15s ease-in-out;
        border: none;
      }

      .notification-default-action,
      .notification-action {
        padding: 4px;
        margin: 0;
        box-shadow: none;
        background: #${config.lib.stylix.colors.base00};
        border: 1px solid #${config.lib.stylix.colors.base05};
        color: #${config.lib.stylix.colors.base05};
      }

      .notification-default-action:hover,
      .notification-action:hover {
        -gtk-icon-effect: none;
        background: #${config.lib.stylix.colors.base02};
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
        border-top: none;
        border-right: none;
      }

      .notification-action:first-child {
        border-bottom-left-radius: 4px;
      }

      .notification-action:last-child {
        border-bottom-right-radius: 4px;
        border-right: 1px solid #${config.lib.stylix.colors.base05};
      }

      .image {
      }

      .body-image {
        margin-top: 6px;
        background-color: #${config.lib.stylix.colors.base07};
        border-radius: 6px;
      }

      .summary {
        font-size: 14px;
        font-weight: bold;
        background: #${config.lib.stylix.colors.base00};
        color: #${config.lib.stylix.colors.base05};
        text-shadow: none;
      }

      .time {
        font-size: 13px;
        font-weight: bold;
        background: #${config.lib.stylix.colors.base00};
        color: #${config.lib.stylix.colors.base05};
        text-shadow: none;
        margin-right: 18px;
      }

      .body {
        font-size: 12px;
        font-weight: normal;
        background: #${config.lib.stylix.colors.base00};
        color: #${config.lib.stylix.colors.base05};
        text-shadow: none;
      }

      .top-action-title {
        color: #${config.lib.stylix.colors.base05};
        text-shadow: none;
      }

      .control-center {
        background-color: #${config.lib.stylix.colors.base00};
        border-radius: 6px;
        border: 1px solid #${config.lib.stylix.colors.base05};
      }

      .control-center-list {
        background: #${config.lib.stylix.colors.base00};
      }

      .floating-notifications {
        background: none;
      }

      .blank-window {
        background: none;
      }

      .widget-title {
        margin: 8px;
        font-size: 16px;
      }

      .widget-title > button {
        font-size: initial;
        color: #${config.lib.stylix.colors.base05};
        text-shadow: none;
        background: #${config.lib.stylix.colors.base00};
        box-shadow: none;
        border-radius: 4px;
      }

      .widget-title > button:hover {
        background: #${config.lib.stylix.colors.base0D};
      }

      .widget-dnd {
        margin: 8px;
        font-size: 1.1rem;
      }

      .widget-dnd > switch {
        font-size: initial;
        border-radius: 4px;
        background: #${config.lib.stylix.colors.base00};
        border: 1px solid #${config.lib.stylix.colors.base05};
        box-shadow: none;
      }

      .widget-dnd > switch:checked {
        background: #${config.lib.stylix.colors.base00};
      }

      .widget-dnd > switch slider {
        background: #${config.lib.stylix.colors.base0D};
        border-radius: 4px;
      }

      .widget-label {
        margin: 4px 8px 8px;
      }

      .widget-label > label {
        font-size: 16px;
      }

      /* Mpris widget */
      .widget-mpris {
      }

      .widget-mpris-player {
        padding: 8px;
        margin: 8px;
      }

      .widget-mpris-title {
        font-weight: bold;
        font-size: 1.25rem;
      }

      .widget-mpris-subtitle {
        font-size: 1.1rem;
      }
    '';
  };
}

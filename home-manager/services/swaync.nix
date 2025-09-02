{
  config,
  ...
}:
{
  services.swaync = {
    enable = true;
    settings = {
      ignore-gtk-theme = true;
      positionX = "right";
      positionY = "top";
      layer = "overlay";
      control-center-layer = "top";
      layer-shell = true;
      layer-shell-cover-screen = true;
      cssPriority = "application";
      control-center-margin-top = 0;
      control-center-margin-bottom = 0;
      control-center-margin-right = 0;
      control-center-margin-left = 0;
      notification-2fa-action = true;
      notification-inline-replies = false;
      notification-body-image-height = 100;
      notification-body-image-width = 200;
      timeout = 2;
      timeout-low = 2;
      timeout-critical = 0;
      fit-to-screen = false;
      relative-timestamps = true;
      control-center-width = 400;
      control-center-height = 800;
      notification-window-width = 400;
      keyboard-shortcuts = true;
      notification-grouping = true;
      image-visibility = "when-available";
      transition-time = 200;
      hide-on-clear = false;
      hide-on-action = true;
      script-fail-notify = true;

      widgets = [
        "title"
        "volume"
        "backlight"
        "dnd"
        "notifications"
      ];

      widget-config = {

        title = {
          text = "Notifications";
          clear-all-button = true;
          button-text = "󰎟 Clear";
        };
        dnd = {
          text = "Do Not Disturb";
        };

        volume = {
          label = "󰓃";
        };

        backlight = {
          label = "󰃠";
          device = "amdgpu_bl1";
        };

      };

    };
    style = ''
      * {
        color: #${config.lib.stylix.colors.base05};
        font-family: 'JetBrainsMono Nerd Font Propo';
      }

      .notification-row {
        background-color: transparent;
        outline: none;
        border-radius: 12px;
      }

      .notification-row:focus,
      .notification-row:hover {
        background: transparent;
      }

      .notification {
        border-radius: 12px;
        margin: 6px 12px;
        box-shadow: 0 0 0 1px #${config.lib.stylix.colors.base00},
        0 1px 3px 1px #${config.lib.stylix.colors.base01},
        0 2px 6px 2px #${config.lib.stylix.colors.base00};
        padding: 0;
        background: #${config.lib.stylix.colors.base00};
      }

      .notification-content {
        background: transparent;
        padding: 6px;
        border-radius: 12px;
      }

      .close-button {
        background: #${config.lib.stylix.colors.base02};
        color: #${config.lib.stylix.colors.base05};
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
        -gtk-icon-effect: none;
        padding: 4px;
        margin: 0;
        box-shadow: none;
        background: #${config.lib.stylix.colors.base00};
        border: 1px solid #${config.lib.stylix.colors.base0D};
      }

      .notification-default-action:hover,
      .notification-action:hover {
        -gtk-icon-effect: none;
        background: #${config.lib.stylix.colors.base02};
      }

      .notification-default-action {
        border-radius: 12px;
      }

      /* When alternative actions are visible */
      .notification-default-action:not(:only-child) {
        border-bottom-left-radius: 0px;
        border-bottom-right-radius: 0px;
      }

      .notification-action {
        border-radius: 0px;
        border-top: none;
        border-right: none;
      }

      /* add bottom border radius to eliminate clipping */
      .notification-action:first-child {
        border-bottom-left-radius: 10px;
      }

      .notification-action:last-child {
        border-bottom-right-radius: 10px;
        border-right: 1px solid #${config.lib.stylix.colors.base03};
      }

      .body-image {
        margin-top: 6px;
        background-color: transparent;
        border-radius: 12px;
      }

      .summary {
        font-size: 16px;
        font-weight: bold;
        background: transparent;
        color: #${config.lib.stylix.colors.base05};
        text-shadow: none;
      }

      .time {
        font-size: 16px;
        font-weight: bold;
        background: transparent;
        color: #${config.lib.stylix.colors.base05};
        text-shadow: none;
        margin-right: 18px;
      }

      .body {
        font-size: 15px;
        font-weight: normal;
        background: transparent;
        color: #${config.lib.stylix.colors.base05};
        text-shadow: none;
      }

      /* The "Notifications" and "Do Not Disturb" text widget */
      .top-action-title {
        color: #${config.lib.stylix.colors.base05};
        text-shadow: none;
      }

      .control-center {
        background-color: #${config.lib.stylix.colors.base00};
        border-radius: 15px;
        border: 2px solid #${config.lib.stylix.colors.base0D};
      }

      .control-center-list {
        background: transparent;
      }

      .floating-notifications {
        background: transparent;
      }

      .notification-group {
        background-color: transparent;
      }

      /* Window behind control center and on all other monitors */
      .blank-window {
        background: transparent;
      }

      /*** Widgets ***/

      /* Title widget */
      .widget-title {
        margin-top: 10px;
        margin: 8px;
        font-size: 1.5rem;
      }

      .widget-title>button {
        font-size: initial;
        color: #${config.lib.stylix.colors.base05};
        text-shadow: none;
        background: transparent;
        border: 1px solid #${config.lib.stylix.colors.base0D};
        box-shadow: none;
        border-radius: 12px;
      }

      .widget-title>button:hover {
        background: #${config.lib.stylix.colors.base02};
      }

      /* DND widget */
      .widget-dnd {
        margin: 8px;
        font-size: 1.1rem;
      }

      .widget-dnd>switch {
        font-size: initial;
        border-radius: 15px;
        background: transparent;
        border: 1px solid #${config.lib.stylix.colors.base0D};
        box-shadow: none;
      }

      .widget-dnd>switch:checked {
        background: #${config.lib.stylix.colors.base0D};
      }

      .widget-dnd>switch slider {
        background: #${config.lib.stylix.colors.base0D};
        border-radius: 12px;
      }

      .widget-dnd>switch:checked slider {
        background: #${config.lib.stylix.colors.base00};
        border-radius: 12px;
      }

      /* Volume and Brightness Widget*/

      trough {
        border-radius: 20px;
        background: transparent;
      }

      trough highlight {
        padding: 5px;
        background: #${config.lib.stylix.colors.base0D};
        border-radius: 20px;
        box-shadow: none;
        transition: all .7s ease;
      }

      trough highlight:hover {
        padding: 5px;
        background: #${config.lib.stylix.colors.base0C};
        border-radius: 20px;
        box-shadow: none;
        transition: all .7s ease;
      }

      trough slider {
        background: transparent;
        box-shadow: none;
      }

      trough slider:hover {
        background: transparent;
      }

      .widget-volume {
        background-color: transparent;
        padding: 0px 8px;
        margin: 0px 8px;
      }

      .widget-backlight {
        background-color: transparent;
        padding: 0px 8px;
        margin: 0px 8px 8px;
      }
    '';
  };
}

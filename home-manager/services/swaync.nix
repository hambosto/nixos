{
  config,
  ...
}:
{
  services.swaync = {
    enable = true;
    settings = {
      positionX = "right";
      positionY = "top";
      control-center-width = 380;
      control-center-height = 750;
      control-center-margin-top = 2;
      control-center-margin-bottom = 2;
      control-center-margin-right = 1;
      control-center-margin-left = 0;
      notification-window-width = 400;
      notification-icon-size = 48;
      notification-body-image-height = 160;
      notification-body-image-width = 200;
      timeout = 4;
      timeout-low = 2;
      timeout-critical = 6;
      fit-to-screen = false;
      keyboard-shortcuts = true;
      image-visibility = "when-available";
      transition-time = 200;
      hide-on-clear = false;
      hide-on-action = false;
      script-fail-notify = true;
      widgets = [
        "dnd"
        "title"
        "notifications"
      ];

      widget-config = {
        title = {
          text = "Notification Center";
          clear-all-button = true;
          button-text = "󰎟";
        };
        dnd = {
          text = "Do Not Disturb";
        };
      };
    };
    style = ''
      * {
        font-family: "Ubuntu Nerd Font";
        font-weight: 700;
        font-size: 13px;
        transition: all 0.25s cubic-bezier(0.165, 0.84, 0.44, 1);
      }

      .close-button {
        background: #${config.lib.stylix.colors.base02};
        color: #${config.lib.stylix.colors.base05};
        text-shadow: none;
        padding: 0;
        border-radius: 10px;
        margin-top: 8px;
        margin-right: 8px;
        box-shadow: none;
        border: none;
        min-width: 24px;
        min-height: 24px;
      }

      .close-button:hover {
        box-shadow: none;
        background: #${config.lib.stylix.colors.base03};
        transition: all 0.25s cubic-bezier(0.165, 0.84, 0.44, 1);
        border: none;
      }

      .notification-row {
        background: none;
        outline: none;
      }

      .notification-row:focus {
        background: #${config.lib.stylix.colors.base01};
      }

      .notification-row .notification-background {
        padding: 6px 12px;
        margin: 2px 0px;
      }

      .notification-row .notification-background .notification {
        border-radius: 10px;
        border: 2px solid #${config.lib.stylix.colors.base0D};
        padding: 0px;
        transition: all 0.25s cubic-bezier(0.165, 0.84, 0.44, 1);
        background: #${config.lib.stylix.colors.base00};
      }

      .notification-row .notification-background .notification .notification-default-action {
        padding: 10px 6px;
        margin: 0;
        box-shadow: none;
        background: transparent;
        border: none;
        color: #${config.lib.stylix.colors.base05};
        transition: all 0.25s cubic-bezier(0.165, 0.84, 0.44, 1);
        border-radius: 10px;
      }

      .notification-row .notification-background .notification .notification-default-action:hover {
        -gtk-icon-filter: none;
        background: #${config.lib.stylix.colors.base01};
      }

      .notification-row .notification-background .notification .notification-default-action:not(:only-child) {
        border-bottom-left-radius: 0px;
        border-bottom-right-radius: 0px;
      }

      .notification-row .notification-background .notification .notification-default-action .notification-content {
        background: transparent;
        border-radius: 10px;
        padding: 0;
      }

      .notification-row .notification-background .notification .notification-default-action .notification-content .image {
        -gtk-icon-filter: none;
        -gtk-icon-size: 64px;
        border-radius: 10px;
        margin: 4px;
      }

      .notification-row .notification-background .notification .notification-default-action .notification-content .app-icon {
        -gtk-icon-filter: none;
        -gtk-icon-size: 21px;
        -gtk-icon-shadow: none;
        margin: 6px;
      }

      .notification-row .notification-background .notification .notification-default-action .notification-content .text-box label {
        filter: none;
      }

      .notification-row .notification-background .notification .notification-default-action .notification-content .text-box .summary {
        font-size: 16px;
        font-weight: bold;
        background: transparent;
        color: #${config.lib.stylix.colors.base05};
        text-shadow: none;
        margin-bottom: 4px;
      }

      .notification-row .notification-background .notification .notification-default-action .notification-content .text-box .time {
        font-size: 12px;
        font-weight: bold;
        background: transparent;
        color: #${config.lib.stylix.colors.base04};
        text-shadow: none;
        margin-right: 30px;
      }

      .notification-row .notification-background .notification .notification-default-action .notification-content .text-box .body {
        font-size: 14px;
        font-weight: 600;
        background: transparent;
        color: #${config.lib.stylix.colors.base05};
        text-shadow: none;
        margin: 2px;
      }

      .notification-row .notification-background .notification .notification-default-action .notification-content progressbar {
        margin-top: 4px;
      }

      .notification-row .notification-background .notification .notification-default-action .notification-content .body-image {
        margin-top: 4px;
        background-color: #${config.lib.stylix.colors.base00};
        -gtk-icon-filter: none;
      }

      .notification-row .notification-background .notification .notification-default-action .notification-content .inline-reply {
        margin-top: 4px;
      }

      .notification-row .notification-background .notification .notification-default-action .notification-content .inline-reply .inline-reply-entry {
        background: #${config.lib.stylix.colors.base00};
        color: #${config.lib.stylix.colors.base05};
        caret-color: #${config.lib.stylix.colors.base0D};
        border: 2px solid #${config.lib.stylix.colors.base0D};
        border-radius: 10px;
      }

      .notification-row .notification-background .notification .notification-default-action .notification-content .inline-reply .inline-reply-button {
        margin-left: 4px;
        background: #${config.lib.stylix.colors.base00};
        border: 2px solid #${config.lib.stylix.colors.base0D};
        border-radius: 10px;
        color: #${config.lib.stylix.colors.base05};
      }

      .notification-row .notification-background .notification .notification-default-action .notification-content .inline-reply .inline-reply-button:disabled {
        background: #${config.lib.stylix.colors.base01};
        color: #${config.lib.stylix.colors.base03};
        border: 1px solid #${config.lib.stylix.colors.base02};
      }

      .notification-row .notification-background .notification .notification-default-action .notification-content .inline-reply .inline-reply-button:hover {
        background: #${config.lib.stylix.colors.base02};
      }

      .notification-row .notification-background .notification .notification-alt-actions {
        background: none;
        border-bottom-left-radius: 10px;
        border-bottom-right-radius: 10px;
        padding: 4px;
      }

      .notification-row .notification-background .notification .notification-action {
        margin: 4px;
        padding: 0;
      }

      .notification-row .notification-background .notification .notification-action>button {
        border-radius: 10px;
        background: #${config.lib.stylix.colors.base01};
        color: #${config.lib.stylix.colors.base05};
        border: 1px solid #${config.lib.stylix.colors.base0D};
        transition: all 0.25s cubic-bezier(0.165, 0.84, 0.44, 1);
      }

      .notification-row .notification-background .notification .notification-action>button:hover {
        background: #${config.lib.stylix.colors.base02};
      }

      .notification-group {
        transition: all 0.25s cubic-bezier(0.165, 0.84, 0.44, 1);
      }

      .notification-group:focus {
        background: #${config.lib.stylix.colors.base01};
      }

      .notification-group .notification-group-close-button .close-button {
        margin: 12px 20px;
      }

      .notification-group .notification-group-buttons,
      .notification-group .notification-group-headers {
        margin: 0 16px;
        color: #${config.lib.stylix.colors.base05};
      }

      .notification-group .notification-group-headers .notification-group-icon {
        color: #${config.lib.stylix.colors.base0D};
        -gtk-icon-size: 32px;
      }

      .notification-group .notification-group-headers .notification-group-header {
        color: #${config.lib.stylix.colors.base05};
        font-weight: bold;
      }

      .notification-group .notification-group-buttons>* {
        background: #${config.lib.stylix.colors.base01};
        color: #${config.lib.stylix.colors.base05};
        text-shadow: none;
        padding: 0;
        border-radius: 10px;
        margin-top: 8px;
        margin-right: 8px;
        box-shadow: none;
        border: none;
        min-width: 24px;
        min-height: 24px;
      }

      .notification-group .notification-group-buttons>*:hover {
        box-shadow: none;
        background: #${config.lib.stylix.colors.base02};
        transition: all 0.25s cubic-bezier(0.165, 0.84, 0.44, 1);
        border: none;
      }

      .notification-group.collapsed.not-expanded {
        opacity: 0.6;
      }

      .notification-group.collapsed .notification-row .notification {
        background-color: #${config.lib.stylix.colors.base00};
      }

      .notification-group.collapsed .notification-row:not(:last-child) {
        opacity: 1;
      }

      .notification-group.collapsed .notification-row:not(:last-child) .notification-action,
      .notification-group.collapsed .notification-row:not(:last-child) .notification-default-action {
        opacity: 0;
      }

      .notification-group.collapsed,
      .notification-group.notification-group.collapsed.not-expanded {
        background-color: #${config.lib.stylix.colors.base00};
      }

      .notification-group.collapsed .notification-row:not(:only-child) .notification {
        background-color: #${config.lib.stylix.colors.base00};
        opacity: 1;
      }

      .notification-group.collapsed:hover .notification-row:not(:only-child) .notification {
        background-color: #${config.lib.stylix.colors.base01};
      }

      .control-center {
        background: #${config.lib.stylix.colors.base00};
        color: #${config.lib.stylix.colors.base05};
        border-radius: 10px;
        border: 2px solid #${config.lib.stylix.colors.base0D};
      }

      .control-center .control-center-list-placeholder {
        opacity: 0.5;
        color: #${config.lib.stylix.colors.base04};
      }

      .control-center .control-center-list {
        background: #${config.lib.stylix.colors.base00};
      }

      .control-center .control-center-list .notification {
        box-shadow: none;
      }

      .control-center .control-center-list .notification .notification-default-action,
      .control-center .control-center-list .notification .notification-action {
        transition: all 0.25s cubic-bezier(0.165, 0.84, 0.44, 1);
      }

      .control-center .control-center-list .notification .notification-default-action:hover,
      .control-center .control-center-list .notification .notification-action:hover {
        background-color: #${config.lib.stylix.colors.base01};
      }

      .blank-window {
        background: transparent;
        margin: 5px;
      }

      .floating-notifications {
        background: transparent;
      }

      .floating-notifications .notification {
        box-shadow: none;
      }

      .widget-title {
        margin: 10px 10px;
      }

      .widget-title>label {
        font-size: 1.5rem;
        font-weight: bold;
        color: #${config.lib.stylix.colors.base05};
      }

      .widget-title>button {
        all: unset;
        font-size: 22px;
        font-weight: 900;
        margin: 2px;
        padding: 2px 6px;
        color: #${config.lib.stylix.colors.base05};
        text-shadow: none;
        background: #${config.lib.stylix.colors.base02};
        border: 0px solid #${config.lib.stylix.colors.base0D};
        box-shadow: none;
        border-radius: 10px;
        transition: all 0.25s cubic-bezier(0.165, 0.84, 0.44, 1);
      }

      .widget-title>button:hover {
        background-color: #${config.lib.stylix.colors.base03};
      }

      .widget-dnd {
        margin: 15px 5px;
        margin-bottom: 0px;
      }

      .widget-dnd label {
        color: #${config.lib.stylix.colors.base05};
        margin: 15px;
        font-size: 1.1rem;
        font-weight: bold;
      }

      .widget-dnd switch {
        border-radius: 10px;
        background-color: #${config.lib.stylix.colors.base02};
        margin: 8px;
        border: 1px solid #${config.lib.stylix.colors.base0D};
        transition: all 0.25s cubic-bezier(0.165, 0.84, 0.44, 1);
      }

      .widget-dnd switch:active {
        background-color: #${config.lib.stylix.colors.base0D};
      }

      .widget-dnd>switch:checked {
        background: #${config.lib.stylix.colors.base0D};
        border-radius: 10px;
        color: #${config.lib.stylix.colors.base00};
      }

      .widget-dnd switch slider {
        border-radius: 10px;
        background: #${config.lib.stylix.colors.base05};
      }
    '';
  };
}

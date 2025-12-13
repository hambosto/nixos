{
  config,
  ...
}:
{
  programs.vesktop = {
    enable = false;
    settings = {
      appBadge = false;
      arRPC = true;
      checkUpdates = false;
      customTitleBar = false;
      disableMinSize = true;
      minimizeToTray = false;
      tray = false;
      splashTheming = true;
      staticTitle = true;
      hardwareAcceleration = true;
      discordBranch = "stable";
    };
    vencord = {
      themes = {
        system24 = ''
          @import url("https://refact0r.github.io/system24/build/system24.css");

          body {
              --font: "Maple Mono NF";
              --code-font: "Maple Mono NF";
              font-weight: 300;
              letter-spacing: -0.05ch;
              --gap: 12px;
              --divider-thickness: 4px;
              --border-thickness: 2px;
              --border-hover-transition: 0.2s ease;
              --animations: on;
              --list-item-transition: 0.2s ease;
              --dms-icon-svg-transition: 0.4s ease;
              --top-bar-height: var(--gap);
              --top-bar-button-position: titlebar;
              --top-bar-title-position: off;
              --subtle-top-bar-title: off;
              --custom-window-controls: off;
              --window-control-size: 14px;
              --custom-dms-icon: off;
              --dms-icon-svg-url: url("");
              --dms-icon-svg-size: 90%;
              --dms-icon-color-before: var(--icon-secondary);
              --dms-icon-color-after: var(--white);
              --custom-dms-background: off;
              --dms-background-image-url: url("");
              --dms-background-image-size: cover;
              --dms-background-color: linear-gradient(70deg, var(--blue-2), var(--purple-2), var(--red-2));
              --background-image: off;
              --background-image-url: url("");
              --transparency-tweaks: off;
              --remove-bg-layer: off;
              --panel-blur: off;
              --blur-amount: 12px;
              --bg-floating: var(--bg-3);
              --small-user-panel: on;
              --unrounding: on;
              --custom-spotify-bar: on;
              --ascii-titles: on;
              --ascii-loader: system24;
              --panel-labels: on;
              --label-color: var(--text-muted);
              --label-font-weight: 500;
          }

          :root {
              --colors: on;
              --text-0: var(--bg-4);
              --text-1: #${config.lib.stylix.colors.base07};
              --text-2: #${config.lib.stylix.colors.base06};
              --text-3: #${config.lib.stylix.colors.base05};
              --text-4: #${config.lib.stylix.colors.base04};
              --text-5: #${config.lib.stylix.colors.base03};
              --bg-1: #${config.lib.stylix.colors.base01};
              --bg-2: #${config.lib.stylix.colors.base01};
              --bg-3: #${config.lib.stylix.colors.base00};
              --bg-4: #${config.lib.stylix.colors.base00};
              --hover: #${config.lib.stylix.colors.base02}40;
              --active: #${config.lib.stylix.colors.base02}60;
              --active-2: #${config.lib.stylix.colors.base02}80;
              --message-hover: var(--hover);
              --accent-1: var(--blue-1);
              --accent-2: var(--blue-2);
              --accent-3: var(--blue-3);
              --accent-4: var(--blue-4);
              --accent-5: var(--blue-5);
              --accent-new: var(--red-2);
              --mention: linear-gradient(to right, color-mix(in hsl, var(--accent-2), transparent 90%) 40%, transparent);
              --mention-hover: linear-gradient(to right, color-mix(in hsl, var(--accent-2), transparent 95%) 40%, transparent);
              --reply: linear-gradient(to right, color-mix(in hsl, var(--text-3), transparent 90%) 40%, transparent);
              --reply-hover: linear-gradient(to right, color-mix(in hsl, var(--text-3), transparent 95%) 40%, transparent);
              --online: var(--green-2);
              --dnd: var(--red-2);
              --idle: var(--yellow-2);
              --streaming: var(--blue-2);
              --offline: var(--text-4);
              --border-light: var(--hover);
              --border: var(--active);
              --border-hover: var(--accent-2);
              --button-border: #${config.lib.stylix.colors.base05}20;
              --red-1: #${config.lib.stylix.colors.base08};
              --red-2: #${config.lib.stylix.colors.base08};
              --red-3: #${config.lib.stylix.colors.base08};
              --red-4: #${config.lib.stylix.colors.base08};
              --red-5: #${config.lib.stylix.colors.base08};
              --green-1: #${config.lib.stylix.colors.base0B};
              --green-2: #${config.lib.stylix.colors.base0B};
              --green-3: #${config.lib.stylix.colors.base0B};
              --green-4: #${config.lib.stylix.colors.base0B};
              --green-5: #${config.lib.stylix.colors.base0B};
              --blue-1: #${config.lib.stylix.colors.base0D};
              --blue-2: #${config.lib.stylix.colors.base0D};
              --blue-3: #${config.lib.stylix.colors.base0D};
              --blue-4: #${config.lib.stylix.colors.base0D};
              --blue-5: #${config.lib.stylix.colors.base0D};
              --yellow-1: #${config.lib.stylix.colors.base0A};
              --yellow-2: #${config.lib.stylix.colors.base0A};
              --yellow-3: #${config.lib.stylix.colors.base0A};
              --yellow-4: #${config.lib.stylix.colors.base0A};
              --yellow-5: #${config.lib.stylix.colors.base0A};
              --purple-1: #${config.lib.stylix.colors.base0E};
              --purple-2: #${config.lib.stylix.colors.base0E};
              --purple-3: #${config.lib.stylix.colors.base0E};
              --purple-4: #${config.lib.stylix.colors.base0E};
              --purple-5: #${config.lib.stylix.colors.base0E};
          }
        '';
      };
      settings = {
        autoUpdate = false;
        autoUpdateNotification = false;
        notifyAboutUpdates = false;
        disableMinSize = true;
        frameless = true;
        enabledThemes = [ "system24.css" ];
      };
    };
  };
}

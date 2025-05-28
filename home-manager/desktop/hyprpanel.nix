{
  config,
  inputs,
  lib,
  pkgs,
  fullname,
  ...
}:
let
  profile_picture = ../../assets/profile-picture.jpg;
in
{
  imports = [ inputs.hyprpanel.homeManagerModules.hyprpanel ];

  programs.hyprpanel = {
    enable = false;
    systemd.enable = true;
    overwrite.enable = true;

    settings = {
      layout = {
        "bar.layouts" = {
          "0" = {
            left = [
              "dashboard"
              "workspaces"
              "windowtitle"
            ];
            middle = [
              "media"
            ];
            right = [
              "systray"
              # "cava"
              "hyprsunset"
              "volume"
              "battery"
              "bluetooth"
              "network"
              "clock"
              "notifications"
            ];
          };
          "1" = {
            left = [
              "dashboard"
              "workspaces"
              "windowtitle"
            ];
            middle = [
              "media"
            ];
            right = [
              "systray"
              # "cava"
              "hyprsunset"
              "volume"
              "battery"
              "bluetooth"
              "network"
              "clock"
              "notifications"
            ];
          };
        };
      };
      bar.clock.format = "%H:%M %Z";
      bar.clock.icon = "";
      bar.clock.showIcon = true;
      bar.clock.showTime = true;
      bar.customModules.cava.bars = 15;
      bar.customModules.cava.showActiveOnly = true;
      bar.customModules.cava.showIcon = true;
      bar.customModules.hyprsunset.temperature = "4500k";
      bar.customModules.updates.pollingInterval = 1440000;
      bar.launcher.icon = "";
      bar.media.show_active_only = true;
      bar.network.label = true;
      bar.network.showWifiInfo = true;
      bar.network.truncation = false;
      bar.network.rightClick = lib.getExe pkgs.iwgtk;
      bar.notifications.show_total = true;
      bar.volume.label = true;
      bar.windowtitle.label = true;
      bar.workspaces.applicationIconEmptyWorkspace = "󱙝";
      bar.workspaces.icons.active = "󰮯";
      bar.workspaces.icons.available = "󰊠";
      bar.workspaces.icons.occupied = "󰮯";
      bar.workspaces.monitorSpecific = false;
      bar.workspaces.numbered_active_indicator = "color";
      bar.workspaces.showApplicationIcons = false;
      bar.workspaces.show_numbered = false;
      bar.workspaces.showWsIcons = false;
      bar.workspaces.show_icons = true;
      bar.workspaces.workspaces = 5;
      menus.clock.time.military = true;
      menus.clock.weather.key = "4afb0b6cb609401da30231750242807";
      menus.clock.weather.location = "Tirtoyudo";
      menus.clock.weather.unit = "metric";
      menus.dashboard.directories.enabled = false;
      menus.dashboard.powermenu.avatar.image = "${profile_picture}";
      menus.dashboard.powermenu.avatar.name = "${fullname}";
      menus.dashboard.powermenu.confirmation = false;
      menus.dashboard.shortcuts.left.shortcut1.command = "${lib.getExe pkgs.firefox}";
      menus.dashboard.shortcuts.left.shortcut1.icon = "󰖟";
      menus.dashboard.shortcuts.left.shortcut1.tooltip = "Browser";
      menus.dashboard.shortcuts.left.shortcut2.command = "${lib.getExe pkgs.kitty}";
      menus.dashboard.shortcuts.left.shortcut2.icon = "";
      menus.dashboard.shortcuts.left.shortcut2.tooltip = "Terminal";
      menus.dashboard.shortcuts.left.shortcut3.command =
        "${lib.getExe pkgs.kitty} -e ${lib.getExe pkgs.yazi}";
      menus.dashboard.shortcuts.left.shortcut3.icon = "";
      menus.dashboard.shortcuts.left.shortcut3.tooltip = "File Explorer";
      menus.dashboard.shortcuts.left.shortcut4.command = "rofi-launcher";
      menus.dashboard.shortcuts.left.shortcut4.icon = "";
      menus.dashboard.shortcuts.left.shortcut4.tooltip = "Search Apps";
      menus.dashboard.shortcuts.right.shortcut1.command =
        "${lib.getExe pkgs.kitty} -e ${lib.getExe pkgs.btop}";
      menus.dashboard.shortcuts.right.shortcut1.icon = "";
      menus.dashboard.shortcuts.right.shortcut1.tooltip = "Resource Monitor";
      menus.dashboard.shortcuts.right.shortcut3.command = "${lib.getExe pkgs.vscode}";
      menus.dashboard.shortcuts.right.shortcut3.icon = "󰨞";
      menus.dashboard.shortcuts.right.shortcut3.tooltip = "Visual Studio Code";
      menus.dashboard.stats.enabled = false;
      menus.power.lowBatteryNotification = true;
      menus.power.lowBatteryThreshold = 20;
      theme.bar.border_radius = "20px";
      theme.bar.buttons.monochrome = false;
      theme.bar.buttons.padding_x = "0.8rem";
      theme.bar.buttons.padding_y = "0.4rem";
      theme.bar.buttons.radius = "13px";
      theme.bar.buttons.spacing = "0.1em";
      theme.bar.buttons.y_margins = "0px";
      theme.bar.floating = false;
      theme.bar.location = "top";
      theme.bar.margin_bottom = "2";
      theme.bar.margin_sides = "1px";
      theme.bar.margin_top = "2";
      theme.bar.menus.border.radius = "20px";
      theme.bar.menus.border.size = "3px";
      theme.bar.menus.card_radius = "20px";
      theme.bar.menus.menu.dashboard.profile.radius = "10em";
      theme.bar.menus.menu.media.card.tint = 90;
      theme.bar.menus.monochrome = false;
      theme.bar.outer_spacing = "0px";
      theme.bar.scaling = 85;
      theme.bar.transparent = true;
      theme.font.name = "Ubuntu Nerd Font";
      theme.font.size = "14px";
      theme.notification.border_radius = "20px";
      theme.osd.enable = true;
      theme.osd.location = "left";
      theme.osd.margins = "0px 0px 0px 10px";
      theme.osd.muted_zero = true;
      theme.osd.orientation = "vertical";
      theme.osd.radius = "20px";
      wallpaper.enable = false;
      wallpaper.pywal = false;
    };
    override = {
      "theme.bar.shadow" = "0px 0px 0px 0px #16161e";
      "theme.bar.background" = "#${config.lib.stylix.colors.base00}";
      "theme.bar.buttons.background" = "#${config.lib.stylix.colors.base00}";
      "theme.bar.buttons.hover" = "#${config.lib.stylix.colors.base03}";
      "theme.bar.buttons.icon" = "#${config.lib.stylix.colors.base0A}";
      "theme.bar.buttons.modules.cava.background" = "#${config.lib.stylix.colors.base00}";
      "theme.bar.buttons.notifications.border" = "#${config.lib.stylix.colors.base09}";
      "theme.bar.buttons.notifications.hover" = "#${config.lib.stylix.colors.base03}";
      "theme.bar.buttons.notifications.icon" = "#${config.lib.stylix.colors.base09}";
      "theme.bar.buttons.notifications.total" = "#${config.lib.stylix.colors.base09}";
      "theme.bar.buttons.style" = "default";
      "theme.bar.buttons.text" = "#${config.lib.stylix.colors.base07}";
      "theme.bar.buttons.workspaces.active" = "#${config.lib.stylix.colors.base0E}";
      "theme.bar.buttons.workspaces.available" = "#${config.lib.stylix.colors.base03}";
      "theme.bar.buttons.workspaces.hover" = "#${config.lib.stylix.colors.base04}";
      "theme.bar.menus.background" = "#${config.lib.stylix.colors.base00}";
      "theme.bar.menus.border.color" = "#${config.lib.stylix.colors.base0D}";
      "theme.bar.menus.buttons.active" = "#${config.lib.stylix.colors.base0A}";
      "theme.bar.menus.buttons.default" = "#${config.lib.stylix.colors.base0C}";
      "theme.bar.menus.cards" = "#${config.lib.stylix.colors.base02}";
      "theme.bar.menus.check_radio_button.active" = "#${config.lib.stylix.colors.base0B}";
      "theme.bar.menus.dropdownmenu.background" = "#${config.lib.stylix.colors.base02}";
      "theme.bar.menus.dropdownmenu.text" = "#${config.lib.stylix.colors.base07}";
      "theme.bar.menus.iconbuttons.active" = "#${config.lib.stylix.colors.base0E}";
      "theme.bar.menus.icons.active" = "#${config.lib.stylix.colors.base0A}";
      "theme.bar.menus.label" = "#${config.lib.stylix.colors.base07}";
      "theme.bar.menus.listitems.active" = "#${config.lib.stylix.colors.base0D}";
      "theme.bar.menus.menu.battery.slider.primary" = "#${config.lib.stylix.colors.base08}";
      "theme.bar.menus.menu.battery.icons.active" = "#${config.lib.stylix.colors.base08}";
      "theme.bar.menus.menu.battery.listitems.active" = "#${config.lib.stylix.colors.base08}";
      "theme.bar.menus.menu.battery.label.color" = "#${config.lib.stylix.colors.base08}";
      "theme.bar.menus.menu.battery.border.color" = "#${config.lib.stylix.colors.base0D}";
      "theme.bar.menus.menu.clock.time.time" = "#${config.lib.stylix.colors.base0E}";
      "theme.bar.menus.menu.clock.calendar.weekdays" = "#${config.lib.stylix.colors.base0E}";
      "theme.bar.menus.menu.clock.calendar.paginator" = "#${config.lib.stylix.colors.base0E}";
      "theme.bar.menus.menu.clock.calendar.currentday" = "#${config.lib.stylix.colors.base0E}";
      "theme.bar.menus.menu.clock.weather.icon" = "#${config.lib.stylix.colors.base0E}";
      "theme.bar.menus.menu.clock.weather.stats" = "#${config.lib.stylix.colors.base0E}";
      "theme.bar.menus.menu.clock.weather.hourly.time" = "#${config.lib.stylix.colors.base0E}";
      "theme.bar.menus.menu.clock.weather.hourly.icon" = "#${config.lib.stylix.colors.base0E}";
      "theme.bar.menus.menu.clock.weather.hourly.temperature" = "#${config.lib.stylix.colors.base0E}";
      "theme.bar.menus.menu.clock.border.color" = "#${config.lib.stylix.colors.base0D}";
      "theme.bar.menus.menu.notifications.clear" = "#${config.lib.stylix.colors.base09}";
      "theme.bar.menus.menu.notifications.switch.enabled" = "#${config.lib.stylix.colors.base09}";
      "theme.bar.menus.menu.notifications.scrollbar.color" = "#${config.lib.stylix.colors.base09}";
      "theme.bar.menus.menu.notifications.label" = "#${config.lib.stylix.colors.base09}";
      "theme.bar.menus.menu.notifications.border.color" = "#${config.lib.stylix.colors.base0D}";
      "theme.bar.menus.menu.network.label.color" = "#${config.lib.stylix.colors.base0B}";
      "theme.bar.menus.menu.network.listitems.active" = "#${config.lib.stylix.colors.base0B}";
      "theme.bar.menus.menu.network.icons.active" = "#${config.lib.stylix.colors.base0B}";
      "theme.bar.menus.menu.network.iconbuttons.active" = "#${config.lib.stylix.colors.base0B}";
      "theme.bar.menus.menu.network.switch.enabled" = "#${config.lib.stylix.colors.base0B}";
      "theme.bar.menus.menu.network.border.color" = "#${config.lib.stylix.colors.base0D}";
      "theme.bar.menus.menu.volume.input_slider.primary" = "#${config.lib.stylix.colors.base0D}";
      "theme.bar.menus.menu.volume.audio_slider.primary" = "#${config.lib.stylix.colors.base0D}";
      "theme.bar.menus.menu.volume.label.color" = "#${config.lib.stylix.colors.base0D}";
      "theme.bar.menus.menu.volume.listitems.active" = "#${config.lib.stylix.colors.base0D}";
      "theme.bar.menus.menu.volume.iconbutton.active" = "#${config.lib.stylix.colors.base0D}";
      "theme.bar.menus.menu.volume.icons.active" = "#${config.lib.stylix.colors.base0D}";
      "theme.bar.menus.popover.background" = "#${config.lib.stylix.colors.base02}";
      "theme.bar.menus.popover.text" = "#${config.lib.stylix.colors.base07}";
      "theme.bar.menus.progressbar.foreground" = "#${config.lib.stylix.colors.base0B}";
      "theme.bar.menus.slider.primary" = "#${config.lib.stylix.colors.base0E}";
      "theme.bar.menus.switch.enabled" = "#${config.lib.stylix.colors.base0B}";
      "theme.bar.menus.text" = "#${config.lib.stylix.colors.base07}";
      "theme.bar.menus.tooltip.background" = "#${config.lib.stylix.colors.base02}";
      "theme.bar.menus.tooltip.text" = "#${config.lib.stylix.colors.base07}";
      "theme.notification.labelicon" = "#${config.lib.stylix.colors.base0C}";
      "theme.notification.text" = "#${config.lib.stylix.colors.base07}";
      "theme.notification.time" = "#${config.lib.stylix.colors.base07}";
      "theme.notification.border" = "#${config.lib.stylix.colors.base02}";
      "theme.notification.label" = "#${config.lib.stylix.colors.base0D}";
      "theme.notification.actions.text" = "#${config.lib.stylix.colors.base00}";
      "theme.notification.actions.background" = "#${config.lib.stylix.colors.base0B}";
      "theme.notification.background" = "#${config.lib.stylix.colors.base01}";
      "theme.osd.bar_color" = "#${config.lib.stylix.colors.base0B}";
      "theme.osd.bar_container" = "#${config.lib.stylix.colors.base01}";
      "theme.osd.bar_overflow_color" = "#${config.lib.stylix.colors.base08}";
      "theme.osd.icon" = "#${config.lib.stylix.colors.base00}";
      "theme.osd.icon_container" = "#${config.lib.stylix.colors.base0D}";
      "theme.osd.label" = "#${config.lib.stylix.colors.base0E}";
      "theme.bar.buttons.windowtitle.text" = "#${config.lib.stylix.colors.base0C}";
      "theme.bar.buttons.windowtitle.icon" = "#${config.lib.stylix.colors.base0C}";
      "theme.bar.buttons.volume.text" = "#${config.lib.stylix.colors.base0D}";
      "theme.bar.buttons.volume.icon" = "#${config.lib.stylix.colors.base0D}";
      "theme.bar.buttons.network.text" = "#${config.lib.stylix.colors.base0B}";
      "theme.bar.buttons.network.icon" = "#${config.lib.stylix.colors.base0B}";
      "theme.bar.buttons.battery.text" = "#${config.lib.stylix.colors.base08}";
      "theme.bar.buttons.battery.icon" = "#${config.lib.stylix.colors.base08}";
      "theme.bar.buttons.battery.border" = "#${config.lib.stylix.colors.base08}";
      "theme.bar.buttons.clock.text" = "#${config.lib.stylix.colors.base0E}";
      "theme.bar.buttons.clock.icon" = "#${config.lib.stylix.colors.base0E}";
      "theme.bar.buttons.clock.border" = "#${config.lib.stylix.colors.base0E}";
      "theme.bar.buttons.modules.hyprsunset.text" = "#${config.lib.stylix.colors.base0A}";
      "theme.bar.buttons.modules.hyprsunset.icon" = "#${config.lib.stylix.colors.base0A}";
      "theme.bar.buttons.modules.hyprsunset.border" = "#${config.lib.stylix.colors.base0A}";
      "theme.bar.buttons.dashboard.icon" = "#${config.lib.stylix.colors.base0B}";
      "theme.bar.buttons.dashboard.border" = "#${config.lib.stylix.colors.base0B}";
      "theme.bar.menus.menu.dashboard.directories.right.bottom.color" =
        "#${config.lib.stylix.colors.base08}";
      "theme.bar.menus.menu.dashboard.directories.right.middle.color" =
        "#${config.lib.stylix.colors.base0A}";
      "theme.bar.menus.menu.dashboard.directories.right.top.color" =
        "#${config.lib.stylix.colors.base0B}";
      "theme.bar.menus.menu.dashboard.directories.left.bottom.color" =
        "#${config.lib.stylix.colors.base0C}";
      "theme.bar.menus.menu.dashboard.directories.left.middle.color" =
        "#${config.lib.stylix.colors.base09}";
      "theme.bar.menus.menu.dashboard.directories.left.top.color" = "#${config.lib.stylix.colors.base0E}";
      "theme.bar.menus.menu.dashboard.controls.input.text" = "#${config.lib.stylix.colors.base05}";
      "theme.bar.menus.menu.dashboard.controls.input.background" = "#${config.lib.stylix.colors.base0D}";
      "theme.bar.menus.menu.dashboard.controls.volume.text" = "#${config.lib.stylix.colors.base05}";
      "theme.bar.menus.menu.dashboard.controls.volume.background" = "#${config.lib.stylix.colors.base08}";
      "theme.bar.menus.menu.dashboard.controls.notifications.text" =
        "#${config.lib.stylix.colors.base05}";
      "theme.bar.menus.menu.dashboard.controls.notifications.background" =
        "#${config.lib.stylix.colors.base09}";
      "theme.bar.menus.menu.dashboard.controls.bluetooth.text" = "#${config.lib.stylix.colors.base05}";
      "theme.bar.menus.menu.dashboard.controls.bluetooth.background" =
        "#${config.lib.stylix.colors.base0C}";
      "theme.bar.menus.menu.dashboard.controls.wifi.text" = "#${config.lib.stylix.colors.base05}";
      "theme.bar.menus.menu.dashboard.controls.wifi.background" = "#${config.lib.stylix.colors.base0E}";
      "theme.bar.menus.menu.dashboard.controls.disabled" = "#${config.lib.stylix.colors.base03}";
      "theme.bar.menus.menu.dashboard.shortcuts.recording" = "#${config.lib.stylix.colors.base0B}";
      "theme.bar.menus.menu.dashboard.shortcuts.text" = "#${config.lib.stylix.colors.base05}";
      "theme.bar.menus.menu.dashboard.shortcuts.background" = "#${config.lib.stylix.colors.base02}";
      "theme.bar.menus.menu.dashboard.powermenu.shutdown" = "#${config.lib.stylix.colors.base08}";
      "theme.bar.menus.menu.dashboard.powermenu.sleep" = "#${config.lib.stylix.colors.base0D}";
      "theme.bar.menus.menu.dashboard.powermenu.logout" = "#${config.lib.stylix.colors.base0B}";
      "theme.bar.menus.menu.dashboard.powermenu.restart" = "#${config.lib.stylix.colors.base0A}";
      "theme.bar.menus.menu.dashboard.profile.name" = "#${config.lib.stylix.colors.base0E}";
      "theme.bar.menus.menu.dashboard.border.color" = "#${config.lib.stylix.colors.base0D}";
      "theme.bar.menus.menu.dashboard.background.color" = "#${config.lib.stylix.colors.base00}";
      "theme.bar.menus.menu.dashboard.card.color" = "#${config.lib.stylix.colors.base01}";
      "theme.bar.buttons.media.icon" = "#${config.lib.stylix.colors.base05}";
      "theme.bar.buttons.media.text" = "#${config.lib.stylix.colors.base05}";
      "theme.bar.buttons.media.background" = "#${config.lib.stylix.colors.base00}";
      "theme.bar.menus.menu.media.slider.puck" = "#${config.lib.stylix.colors.base04}";
      "theme.bar.menus.menu.media.slider.backgroundhover" = "#${config.lib.stylix.colors.base03}";
      "theme.bar.menus.menu.media.slider.background" = "#${config.lib.stylix.colors.base02}";
      "theme.bar.menus.menu.media.slider.primary" = "#${config.lib.stylix.colors.base0E}";
      "theme.bar.menus.menu.media.buttons.text" = "#${config.lib.stylix.colors.base00}";
      "theme.bar.menus.menu.media.buttons.background" = "#${config.lib.stylix.colors.base05}";
      "theme.bar.menus.menu.media.buttons.enabled" = "#${config.lib.stylix.colors.base0B}";
      "theme.bar.menus.menu.media.buttons.inactive" = "#${config.lib.stylix.colors.base03}";
      "theme.bar.menus.menu.media.border.color" = "#${config.lib.stylix.colors.base0D}";
      "theme.bar.menus.menu.media.background.color" = "#${config.lib.stylix.colors.base00}";
      "theme.bar.menus.menu.media.album" = "#${config.lib.stylix.colors.base0E}";
      "theme.bar.menus.menu.media.artist" = "#${config.lib.stylix.colors.base0B}";
      "theme.bar.menus.menu.media.song" = "#${config.lib.stylix.colors.base05}";
      "theme.bar.menus.menu.media.card.color" = "#${config.lib.stylix.colors.base01}";

      "theme.bar.menus.menu.bluetooth.text" = "#${config.lib.stylix.colors.base05}";
      "theme.bar.menus.menu.bluetooth.card.color" = "#${config.lib.stylix.colors.base01}";
      "theme.bar.menus.menu.bluetooth.background.color" = "#${config.lib.stylix.colors.base00}";
      "theme.bar.menus.menu.bluetooth.border.color" = "#${config.lib.stylix.colors.base0D}";
      "theme.bar.menus.menu.bluetooth.label.color" = "#${config.lib.stylix.colors.base0C}";
      "theme.bar.menus.menu.bluetooth.switch.enabled" = "#${config.lib.stylix.colors.base0C}";

      "theme.bar.buttons.media.icon_background" = "#${config.lib.stylix.colors.base05}";
      "theme.bar.buttons.media.border" = "#${config.lib.stylix.colors.base05}";
      "theme.bar.menus.menu.media.timestamp" = "#${config.lib.stylix.colors.base06}";
      "theme.bar.buttons.notifications.background" = "#${config.lib.stylix.colors.base00}";
      "theme.bar.buttons.clock.background" = "#${config.lib.stylix.colors.base00}";
      "theme.bar.buttons.battery.background" = "#${config.lib.stylix.colors.base00}";
      "theme.bar.buttons.systray.background" = "#${config.lib.stylix.colors.base00}";
      "theme.bar.buttons.bluetooth.background" = "#${config.lib.stylix.colors.base00}";
      "theme.bar.buttons.bluetooth.icon" = "#${config.lib.stylix.colors.base0C}";
      "theme.bar.buttons.bluetooth.text" = "#${config.lib.stylix.colors.base0C}";
      "theme.bar.buttons.network.background" = "#${config.lib.stylix.colors.base00}";
      "theme.bar.buttons.volume.background" = "#${config.lib.stylix.colors.base00}";
      "theme.bar.buttons.windowtitle.background" = "#${config.lib.stylix.colors.base00}";
      "theme.bar.buttons.workspaces.background" = "#${config.lib.stylix.colors.base00}";
      "theme.bar.buttons.dashboard.background" = "#${config.lib.stylix.colors.base00}";
      "theme.bar.buttons.modules.hyprsunset.background" = "#${config.lib.stylix.colors.base00}";
      "theme.bar.menus.menu.battery.background.color" = "#${config.lib.stylix.colors.base00}";
      "theme.bar.menus.menu.battery.card.color" = "#${config.lib.stylix.colors.base01}";
      "theme.bar.menus.menu.volume.background.color" = "#${config.lib.stylix.colors.base00}";
      "theme.bar.menus.menu.volume.card.color" = "#${config.lib.stylix.colors.base01}";
      "theme.bar.menus.menu.volume.border.color" = "#${config.lib.stylix.colors.base0D}";
      "theme.bar.menus.menu.network.background.color" = "#${config.lib.stylix.colors.base00}";
      "theme.bar.menus.menu.network.card.color" = "#${config.lib.stylix.colors.base01}";
      "theme.bar.menus.menu.clock.background.color" = "#${config.lib.stylix.colors.base00}";
      "theme.bar.menus.menu.clock.card.color" = "#${config.lib.stylix.colors.base01}";
      "theme.bar.menus.menu.notifications.background" = "#${config.lib.stylix.colors.base00}";
      "theme.notification.close_button.label" = "#${config.lib.stylix.colors.base07}";
      "theme.notification.close_button.background" = "#${config.lib.stylix.colors.base08}";
      "theme.bar.buttons.modules.cava.text" = "#${config.lib.stylix.colors.base0F}";
      "theme.bar.buttons.modules.cava.icon" = "#${config.lib.stylix.colors.base0F}";
    };
  };
}

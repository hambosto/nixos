{ lib, pkgs, ... }:
let
  yazi-plugins = pkgs.fetchFromGitHub {
    owner = "yazi-rs";
    repo = "plugins";
    rev = "8f1d9711bcd0e48af1fcb4153c16d24da76e732d";
    hash = "sha256-7vsqHvdNimH/YVWegfAo7DfJ+InDr3a1aNU0f+gjcdw=";
  };
in
{
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;

    plugins = {
      chmod = "${yazi-plugins}/chmod.yazi";
      full-border = "${yazi-plugins}/full-border.yazi";
      toggle-pane = "${yazi-plugins}/toggle-pane.yazi";
      smart-filter = "${yazi-plugins}/smart-filter.yazi";
      mount = "${yazi-plugins}/mount.yazi";
    };

    initLua = ''
      require("full-border"):setup()
    '';

    settings = {
      opener = {
        edit = [
          {
            run = ''${lib.getExe pkgs.helix} "$@"'';
            block = true;
            for = "unix";
          }
        ];
      };
      log = {
        enabled = false;
      };
      mgr = {
        show_hidden = true;
        sort_by = "natural";
        sort_dir_first = true;
        sort_reverse = false;
      };
    };

    keymap = {
      mgr.prepend_keymap = [
        {
          on = "T";
          run = "plugin toggle-pane max-preview";
          desc = "Maximize or restore the preview pane";
        }
        {
          on = [
            "c"
            "m"
          ];
          run = "plugin chmod";
          desc = "Chmod on selected files";
        }
        {
          on = "M";
          run = "plugin mount";
          desc = "Mount Disk";
        }
        {
          on = "F";
          run = "plugin smart-filter";
          desc = "Smart filter";
        }
      ];
    };
  };
}

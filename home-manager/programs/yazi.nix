{ lib, pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;

    shellWrapperName = "y";

    plugins = {
      chmod = pkgs.yaziPlugins.chmod;
      compress = pkgs.yaziPlugins.compress;
      full-border = pkgs.yaziPlugins.full-border;
      toggle-pane = pkgs.yaziPlugins.toggle-pane;
      smart-filter = pkgs.yaziPlugins.smart-filter;
      mount = pkgs.yaziPlugins.mount;
      starship = pkgs.yaziPlugins.starship;
    };

    initLua = ''
      require("full-border"):setup()
      require("starship"):setup()
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
        {
          on = [
            "c"
            "a"
            "a"
          ];
          run = "plugin compress";
          desc = "Archive selected files";
        }
        {
          on = [
            "c"
            "a"
            "p"
          ];
          run = "plugin compress -p";
          desc = "Archive selected files (password)";
        }
        {
          on = [
            "c"
            "a"
            "h"
          ];
          run = "plugin compress -ph";
          desc = "Archive selected files (password+header)";
        }
        {
          on = [
            "c"
            "a"
            "l"
          ];
          run = "plugin compress -l";
          desc = "Archive selected files (compression level)";
        }
        {
          on = [
            "c"
            "a"
            "u"
          ];
          run = "plugin compress -phl";
          desc = "Archive selected files (password+header+level)";
        }
      ];
    };
  };
}

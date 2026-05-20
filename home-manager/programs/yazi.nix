{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;

    shellWrapperName = "y";

    plugins = {
      chmod = pkgs.yaziPlugins.chmod;
      compress = pkgs.yaziPlugins.compress;
      full-border = {
        package = pkgs.yaziPlugins.full-border;
        setup = true;
      };
      toggle-pane = pkgs.yaziPlugins.toggle-pane;
      smart-filter = pkgs.yaziPlugins.smart-filter;
      mount = pkgs.yaziPlugins.mount;
      starship = {
        package = pkgs.yaziPlugins.starship;
        setup = true;
      };
    };

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

    # https://github.com/nix-community/stylix/pull/2167
    theme = with config.lib.stylix.colors.withHashtag; {
      icon =
        let
          mkIcon = text: fg: { inherit text fg; };
        in
        {
          dirs =
            let
              mkDirIcon =
                name: text: fg:
                ((mkIcon text fg) // { inherit name; });
            in
            [
              (mkDirIcon ".config" "" orange)
              (mkDirIcon ".git" "" cyan)
              (mkDirIcon ".github" "" blue)
              (mkDirIcon ".npm" "" blue)
              (mkDirIcon "Desktop" "" cyan)
              (mkDirIcon "Development" "" cyan)
              (mkDirIcon "Documents" "" cyan)
              (mkDirIcon "Downloads" "" cyan)
              (mkDirIcon "Library" "" cyan)
              (mkDirIcon "Movies" "" cyan)
              (mkDirIcon "Music" "" cyan)
              (mkDirIcon "Pictures" "" cyan)
              (mkDirIcon "Public" "" cyan)
              (mkDirIcon "Videos" "" cyan)
            ];

          conds =
            let
              mkCondsIcon =
                cond: text: fg:
                ((mkIcon text fg) // { "if" = cond; });
            in
            [
              # Special files
              (mkCondsIcon "orphan" "" base05)
              (mkCondsIcon "link" "" base04)
              (mkCondsIcon "block" "" yellow)
              (mkCondsIcon "char" "" yellow)
              (mkCondsIcon "fifo" "" yellow)
              (mkCondsIcon "sock" "" yellow)
              (mkCondsIcon "sticky" "" yellow)
              (mkCondsIcon "dummy" "" red)

              # Fallback
              (mkCondsIcon "dir & hovered" "" blue)
              (mkCondsIcon "dir" "" blue)
              (mkCondsIcon "exec" "" green)
              (mkCondsIcon "!dir" "" base05)
            ];
        };
    };
  };
}

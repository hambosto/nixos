{
  lib,
  pkgs,
  ...
}:
{
  programs.helix = {
    enable = true;
    defaultEditor = true;

    languages = {
      language = [
        {
          auto-format = true;
          formatter.command = lib.getExe pkgs.gosimports;
          language-servers = [ "gopls" ];
          name = "go";
        }
        {
          auto-format = true;
          formatter.command = lib.getExe pkgs.nixfmt-rfc-style;
          language-servers = [ "nixd" ];
          name = "nix";
        }
        # {
        #   auto-format = true;
        #   formatter = {
        #     command = lib.getExe pkgs.zig;
        #     args = [
        #       "fmt"
        #       "--stdin"
        #     ];
        #   };
        #   language-servers = [ "zls" ];
        #   name = "zig";
        # }
        # {
        #   auto-format = true;
        #   formatter.command = lib.getExe pkgs.rustfmt;
        #   name = "rust";
        # }
      ];

      language-server = {
        gopls.command = lib.getExe pkgs.gopls;
        nixd.command = lib.getExe pkgs.nixd;
        # zls.command = lib.getExe pkgs.zls;
        # rust-analyzer.command = lib.getExe pkgs.rust-analyzer;
      };
    };

    settings = {
      theme = lib.mkForce "tokyonight";
      editor = {
        color-modes = true;
        completion-replace = true;
        completion-timeout = 1;
        cursorline = true;
        end-of-line-diagnostics = "hint";
        file-picker.hidden = false;
        gutters = [
          "diff"
          "diagnostics"
          "line-numbers"
          "spacer"
        ];
        idle-timeout = 1;
        indent-guides = {
          character = "┆";
          rainbow = "dim";
          render = true;
        };
        lsp = {
          auto-signature-help = true;
          display-inlay-hints = true;
          display-messages = true;
          display-progress-messages = true;
          display-signature-help-docs = true;
          enable = true;
          goto-reference-include-declaration = true;
          snippets = true;
        };
        soft-wrap.enable = true;
        statusline = {
          center = [ "file-name" ];
          left = [
            "mode"
            "spinner"
          ];
          mode = {
            insert = "INSERT";
            normal = "NORMAL";
            select = "SELECT";
          };
          right = [
            "diagnostics"
            "selections"
            "position"
            "file-line-ending"
            "file-type"
            "version-control"
          ];
          separator = "|";
        };
        true-color = true;
        whitespace = {
          characters = {
            nbsp = "⍽";
            newline = "⏎";
            space = "·";
            tab = "→";
            tabpad = "·";
          };
        };
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
      };
    };
  };
}

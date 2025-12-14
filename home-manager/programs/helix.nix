{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.helix = {
    defaultEditor = true;
    enable = true;
    languages = {
      language = [
        {
          auto-format = true;
          formatter.command = lib.getExe pkgs.nixfmt-rfc-style;
          language-servers = [ "nixd" ];
          name = "nix";
        }
      ]
      ++ lib.optionals (config.programs.go.enable or false) [
        {
          auto-format = true;
          formatter.command = lib.getExe pkgs.gosimports;
          language-servers = [ "gopls" ];
          name = "go";
        }
      ]
      ++ lib.optionals (config.programs.uv.enable or false) [
        {
          auto-format = true;
          formatter.args = [
            "-"
            "--quiet"
          ];
          formatter.command = lib.getExe pkgs.black;
          language-servers = [ "pyright" ];
          name = "python";
        }
      ]
      ++ lib.optionals (config.programs.rust.enable or false) [
        {
          auto-format = true;
          formatter.command = lib.getExe pkgs.rustfmt;
          name = "rust";
        }
      ]
      ++ lib.optionals (config.programs.zig.enable or false) [
        {
          auto-format = true;
          formatter = {
            args = [
              "fmt"
              "--stdin"
            ];
            command = lib.getExe pkgs.zig;
          };
          language-servers = [ "zls" ];
          name = "zig";
        }
      ];

      language-server = {
        nixd.command = lib.getExe pkgs.nixd;
      }
      // lib.optionalAttrs (config.programs.go.enable or false) {
        gopls.command = lib.getExe pkgs.gopls;
      }
      // lib.optionalAttrs (config.programs.uv.enable or false) {
        pyright.command = "${lib.getExe' pkgs.pyright "pyright-langserver"}";
      }
      // lib.optionalAttrs (config.programs.rust.enable or false) {
        rust-analyzer.command = lib.getExe pkgs.rust-analyzer;
      }
      // lib.optionalAttrs (config.programs.zig.enable or false) {
        zls.command = lib.getExe pkgs.zls;
      };

    };
    settings = {
      editor = {
        color-modes = true;
        completion-replace = true;
        completion-timeout = 1;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
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
      };
      theme = "tokyonight";
    };
  };
}

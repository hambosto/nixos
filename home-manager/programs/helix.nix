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
      language = lib.mkMerge [
        [
          {
            auto-format = true;
            formatter.command = lib.getExe pkgs.nixfmt;
            language-servers = [ "nixd" ];
            name = "nix";
          }
        ]
        (lib.mkIf config.programs.go.enable [
          {
            auto-format = true;
            formatter.command = lib.getExe pkgs.gosimports;
            language-servers = [ "gopls" ];
            name = "go";
          }
        ])
        (lib.mkIf config.programs.uv.enable [
          {
            auto-format = true;
            formatter = {
              args = [
                "-"
                "--quiet"
              ];
              command = lib.getExe pkgs.black;
            };
            language-servers = [ "pyright" ];
            name = "python";
          }
        ])
        (lib.mkIf config.programs.rust.enable [
          {
            auto-format = true;
            formatter = {
              args = [
                "--emit"
                "stdout"
              ];
              command = lib.getExe pkgs.rustfmt;
            };
            name = "rust";
          }
        ])
        (lib.mkIf config.programs.zig.enable [
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
        ])
      ];

      language-server = lib.mkMerge [
        { nixd.command = lib.getExe pkgs.nixd; }
        (lib.mkIf config.programs.go.enable {
          gopls.command = lib.getExe pkgs.gopls;
        })
        (lib.mkIf config.programs.uv.enable {
          pyright.command = lib.getExe' pkgs.pyright "pyright-langserver";
        })
        (lib.mkIf config.programs.rust.enable {
          rust-analyzer.command = lib.getExe pkgs.rust-analyzer;
        })
        (lib.mkIf config.programs.zig.enable {
          zls.command = lib.getExe pkgs.zls;
        })
      ];
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
    };
  };
}

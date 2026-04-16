{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:
{
  imports = [ inputs.nix-zed-extensions.homeManagerModules.default ];

  programs.zed-editor = {
    enable = true;
    mutableUserSettings = false;
    mutableUserKeymaps = false;
    mutableUserTasks = false;
    mutableUserDebug = false;
    userSettings = {
      base_keymap = "VSCode";
      buffer_font_family = "GeistMono Nerd Font";
      buffer_font_size = 15;
      buffer_font_weight = 500;
      buffer_line_height = {
        custom = 1.4;
      };
      current_line_highlight = "none";
      disable_ai = true;
      git = {
        inline_blame = {
          enabled = false;
        };
      };
      icon_theme = "Material Icon Theme";
      inlay_hints = {
        edit_debounce_ms = 700;
        enabled = true;
        scroll_debounce_ms = 50;
        show_background = false;
        show_other_hints = true;
        show_parameter_hints = true;
        show_type_hints = true;
      };
      languages = {
        Nix = {
          format_on_save = "on";
          formatter.external.command = lib.getExe pkgs.nixfmt;
          language_servers = [ "nixd" ];
        };
      }
      // lib.optionalAttrs (config.programs.go.enable or false) {
        Go = {
          format_on_save = "on";
          formatter.external.command = lib.getExe pkgs.gosimports;
          language_servers = [ "gopls" ];
        };
      }
      // lib.optionalAttrs (config.programs.rust.enable or false) {
        Rust = {
          format_on_save = "on";
          formatter.external.command = lib.getExe pkgs.rustfmt;
          language_servers = [ "rust-analyzer" ];
        };
      }
      // lib.optionalAttrs (config.programs.uv.enable or false) {
        Python = {
          format_on_save = "on";
          formatter.external = {
            arguments = [
              "-"
              "--quiet"
            ];
            command = lib.getExe pkgs.black;
          };
          language_servers = [ "pyright" ];
        };
      }
      // lib.optionalAttrs config.programs.zig.enable {
        Zig = {
          format_on_save = true;
          formatter.external = {
            arguments = [
              "fmt"
              "--stdin"
            ];
            command = lib.getExe pkgs.zig;
          };
          language_servers = [ "zls" ];
        };
      };
      lsp = {
        json-language-server = {
          binary = {
            path = lib.getExe pkgs.vscode-json-languageserver;
            arguments = [ "--stdio" ];
          };
        };
        nixd = {
          binary.path = lib.getExe pkgs.nixd;
        };
        package-version-server = {
          binary.path = lib.getExe pkgs.package-version-server;
        };
      }
      // lib.optionalAttrs (config.programs.go.enable or false) {
        gopls = {
          binary.path = lib.getExe pkgs.gopls;
        };
      }
      // lib.optionalAttrs (config.programs.rust.enable or false) {
        rust-analyzer = {
          binary.path = lib.getExe pkgs.rust-analyzer;
        };
        crates-lsp = {
          binary.path = lib.getExe pkgs.crates-lsp;
        };
      }
      // lib.optionalAttrs (config.programs.uv.enable or false) {
        pyright = {
          binary.path = lib.getExe pkgs.pyright;
        };
      }
      // lib.optionalAttrs config.programs.zig.enable {
        zls = {
          binary.path = lib.getExe pkgs.zls;
        };
      };
      project_panel = {
        entry_spacing = "standard";
      };
      tabs = {
        file_icons = true;
      };
      telemetry = {
        diagnostics = false;
        metrics = false;
      };
      terminal = {
        blinking = "on";
        cursor_shape = "bar";
        font_family = "GeistMono Nerd Font";
        font_size = 15;
        font_weight = 500;
      };
      theme = "Catppuccin Mocha - No Italics";
      toolbar = {
        breadcrumbs = false;
        quick_actions = false;
      };
      ui_font_family = "GeistMono Nerd Font";
      ui_font_size = 15;
      ui_font_weight = 500;
    };
  };

  programs.zed-editor-extensions = {
    enable = config.programs.zed-editor.enable;
    packages =
      with pkgs.zed-extensions;
      (
        [
          html
          material-icon-theme
          nix
          catppuccin
        ]
        ++ lib.optionals (config.programs.rust.enable or false) [
          crates-lsp
          toml
        ]
        ++ lib.optionals (config.programs.zig.enable or false) [ zig ]
      );
  };
}

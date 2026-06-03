{
  config,
  lib,
  pkgs,
  ...
}:
let
  zedLsp = path: arguments: {
    binary = {
      inherit path arguments;
    };
  };
  vscodeLangServer =
    name: zedLsp "${lib.getExe' pkgs.vscode-langservers-extracted name}" [ "--stdio" ];
  nodeLangServer = package: arguments: zedLsp "${lib.getExe package}" arguments;
  mkLsp = pkg: { binary.path = lib.getExe pkg; };
in
{
  programs.zed-editor = {
    enable = true;
    mutableUserSettings = false;
    mutableUserKeymaps = false;
    mutableUserTasks = false;
    mutableUserDebug = false;
    userKeymaps = [
      {
        bindings = {
          "shift shift" = "file_finder::Toggle";
        };
      }
      {
        bindings = {
          ctrl-b = "project_panel::Toggle";
        };
      }
    ];
    userSettings = {
      base_keymap = "VSCode";
      buffer_font_family = "JetBrainsMono Nerd Font";
      buffer_font_size = 15;
      buffer_font_weight = 500;
      buffer_line_height = {
        custom = 1.4;
      };
      current_line_highlight = "none";
      diagnostics = {
        inline = {
          enabled = true;
        };
      };
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
          format_on_save = "on";
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
        json-language-server = vscodeLangServer "vscode-json-language-server";
        vscode-css-language-server = vscodeLangServer "vscode-css-language-server";
        vscode-html-language-server = vscodeLangServer "vscode-html-language-server";
        yaml-language-server = nodeLangServer pkgs.yaml-language-server [ "--stdio" ];
        typescript-language-server = nodeLangServer pkgs.typescript-language-server [ "--stdio" ];
        nixd = mkLsp pkgs.nixd;
        package-version-server = mkLsp pkgs.package-version-server;
      }
      // lib.optionalAttrs (config.programs.go.enable or false) {
        gopls = {
          binary.path = lib.getExe pkgs.gopls;
        };
      }
      // lib.optionalAttrs (config.programs.go.enable or false) {
        gopls = mkLsp pkgs.gopls;
      }
      // lib.optionalAttrs (config.programs.rust.enable or false) {
        rust-analyzer = mkLsp pkgs.rust-analyzer;
        crates-lsp = mkLsp pkgs.crates-lsp;
      }
      // lib.optionalAttrs (config.programs.uv.enable or false) {
        pyright = mkLsp pkgs.pyright;
      }
      // lib.optionalAttrs config.programs.zig.enable {
        zls = mkLsp pkgs.zls;
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
        font_family = "JetBrainsMono Nerd Font";
        font_size = 15;
        font_weight = 500;
      };
      theme = "Catppuccin Mocha - No Italics";
      toolbar = {
        breadcrumbs = false;
        quick_actions = false;
      };
      ui_font_family = "JetBrainsMono Nerd Font";
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
          catppuccin
          html
          material-icon-theme
          nix
        ]
        ++ lib.optionals (config.programs.rust.enable or false) [
          crates-lsp
          toml
        ]
        ++ lib.optionals (config.programs.zig.enable or false) [ zig ]
      );
  };
}

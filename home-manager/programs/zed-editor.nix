{
  config,
  lib,
  pkgs,
  ...
}:
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
      buffer_font_family = config.stylix.fonts.monospace.name;
      buffer_font_size = config.stylix.fonts.sizes.applications;
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
      format_on_save = "on";
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
          formatter.external = {
            arguments = [
              "--emit"
              "stdout"
            ];
            command = lib.getExe pkgs.rustfmt;
          };
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
        json-language-server = {
          binary = {
            arguments = [ "--stdio" ];
            path = lib.getExe pkgs.vscode-json-languageserver;
          };
        };
        nixd = {
          binary.path = lib.getExe pkgs.nixd;
        };
        package-version-server = {
          binary.path = lib.getExe pkgs.package-version-server;
        };
        typescript-language-server = {
          binary = {
            path = lib.getExe pkgs.typescript-language-server;
            arguments = [ "--stdio" ];
          };
        };
        vscode-css-language-server = {
          binary = {
            arguments = [ "--stdio" ];
            path = lib.getExe pkgs.vscode-css-languageserver;
          };
        };
        vscode-html-language-server = {
          binary = {
            arguments = [ "--stdio" ];
            path = lib.getExe' pkgs.vscode-langservers-extracted "vscode-html-language-server";
          };
        };
        yaml-language-server = {
          binary = {
            arguments = [ "--stdio" ];
            path = lib.getExe pkgs.yaml-language-server;
          };
        };
      }
      // lib.optionalAttrs (config.programs.go.enable or false) {
        gopls = {
          binary.path = lib.getExe pkgs.gopls;
        };
      }
      // lib.optionalAttrs (config.programs.rust.enable or false) {
        crates-lsp = {
          binary.path = lib.getExe pkgs.crates-lsp;
        };
        rust-analyzer = {
          binary.path = lib.getExe pkgs.rust-analyzer;
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
      semantic_tokens = "combined";
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
        font_family = config.stylix.fonts.monospace.name;
        font_size = config.stylix.fonts.sizes.applications;
        font_weight = 500;
      };
      theme = "Rosé Pine";
      theme_overrides = {
        "Rosé Pine" = {
          syntax = {
            hint = {
              color = "#908caa";
            };
          };
        };
      };
      toolbar = {
        breadcrumbs = false;
        quick_actions = false;
      };
      ui_font_family = config.stylix.fonts.monospace.name;
      ui_font_size = config.stylix.fonts.sizes.applications;
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
          rose-pine-theme
        ]
        ++ lib.optionals (config.programs.rust.enable or false) [
          crates-lsp
          toml
        ]
        ++ lib.optionals (config.programs.zig.enable or false) [ zig ]
      );
  };
}

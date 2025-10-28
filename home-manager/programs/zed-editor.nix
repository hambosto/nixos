{ lib, pkgs, ... }:
{
  programs.zed-editor = {
    enable = false;
    extensions = [
      "material-icon-theme"
      "nix"
      "tokyo-night"
      # "toml"
      # "dockerfile"
      # "docker-compose"
      # "crates-lsp"
    ];
    userSettings = {
      base_keymap = "VSCode";
      buffer_font_family = "JetBrainsMono Nerd Font";
      buffer_font_size = 13;
      buffer_line_height = {
        custom = 1.4;
      };
      current_line_highlight = "none";
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
        Go = {
          format_on_save = "on";
          formatter.external.command = lib.getExe pkgs.gosimports;
          language_servers = [ "gopls" ];
        };
        Nix = {
          format_on_save = "on";
          formatter.external.command = lib.getExe pkgs.nixfmt-rfc-style;
          language_servers = [ "nixd" ];
        };
        # Python = {
        #   format_on_save = "on";
        #   formatter.external = {
        #     arguments = [
        #       "-"
        #       "--quiet"
        #     ];
        #     command = lib.getExe pkgs.black;
        #   };
        #   language_servers = [ "pyright" ];
        # };
        # Rust = {
        #   format_on_save = "on";
        #   formatter.external.command = lib.getExe pkgs.rustfmt;
        #   language_servers = [ "rust-analyzer" ];
        # };
      };
      lsp = {
        gopls = {
          binary.path = lib.getExe pkgs.gopls;
        };
        nixd = {
          binary.path = lib.getExe pkgs.nixd;
        };
        # pyright = {
        #   binary.path = lib.getExe pkgs.pyright;
        # };
        # rust-analyzer = {
        #   binary.path = lib.getExe pkgs.rust-analyzer;
        # };
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
        font_size = 13;
      };
      theme = "Tokyo Night";
      toolbar = {
        breadcrumbs = false;
        quick_actions = false;
      };
      ui_font_family = "JetBrainsMono Nerd Font";
      ui_font_size = 14;
    };
  };
}

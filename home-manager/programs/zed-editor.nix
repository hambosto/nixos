{ lib, ... }:
{
  programs.zed-editor = {
    enable = false;
    installRemoteServer = true;
    userSettings = {
      theme = lib.mkForce "Tokyo Night";
      ui_font_size = lib.mkForce 18;
      ui_font_family = lib.mkForce "JetBrainsMono Nerd Font";
      buffer_font_size = lib.mkForce 14;
      buffer_font_family = lib.mkForce "JetBrainsMono Nerd Font";

      inlay_hints.enabled = true;

      lsp = {
        rust-analyzer = {
          binary = {
            path_lookup = true;
          };
          settings = {
            diagnostics = {
              enable = true;
              styleLints = {
                enable = true;
              };
            };

            checkOnSave = true;
            check = {
              command = "clippy";
              features = "all";
            };
            cargo = {
              buildScripts = {
                enable = true;
              };
              features = "all";
            };
            inlayHints = {
              bindingModeHints = {
                enable = true;
              };
              closureStyle = "rust_analyzer";
              closureReturnTypeHints = {
                enable = "always";
              };
              discriminantHints = {
                enable = "always";
              };
              expressionAdjustmentHints = {
                enable = "always";
              };
              implicitDrops = {
                enable = true;
              };
              lifetimeElisionHints = {
                enable = "always";
              };
              rangeExclusiveHints = {
                enable = true;
              };
            };
            procMacro = {
              enable = true;
            };
            rustc = {
              source = "discover";
            };
            files = {
              excludeDirs = [
                ".cargo"
                ".direnv"
                ".git"
                "node_modules"
                "target"
              ];
            };
          };
        };
      };

      telemetry = {
        diagnostics = false;
        metrics = false;
      };
    };

    extensions = [ "tokyo-night" ];
  };
}

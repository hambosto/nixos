{
  config,
  lib,
  osConfig,
  pkgs,
  ...
}:
{
  programs.vscode = {
    enable = true;
    profiles.default = {
      enableUpdateCheck = false;
      enableExtensionUpdateCheck = false;
      userSettings = {
        "breadcrumbs.enabled" = false;
        "chat.agent.enabled" = false;
        "chat.commandCenter.enabled" = false;
        "chat.disableAIFeatures" = true;
        "chat.editor.fontFamily" = "Maple Mono NF";
        "chat.editor.fontSize" = 14;
        "chat.fontFamily" = "Maple Mono NF";
        "debug.console.fontFamily" = "Maple Mono NF";
        "debug.console.fontSize" = 14;
        "editor.acceptSuggestionOnCommitCharacter" = true;
        "editor.acceptSuggestionOnEnter" = "on";
        "editor.autoClosingBrackets" = "always";
        "editor.cursorBlinking" = "expand";
        "editor.cursorSmoothCaretAnimation" = "on";
        "editor.fontFamily" = "Maple Mono NF";
        "editor.fontLigatures" = true;
        "editor.fontSize" = 14;
        "editor.fontWeight" = "500";
        "editor.formatOnSave" = true;
        "editor.inlayHints.fontFamily" = "Maple Mono NF";
        "editor.inlineSuggest.fontFamily" = "Maple Mono NF";
        "editor.minimap.enabled" = false;
        "editor.minimap.sectionHeaderFontSize" = 14;
        "editor.semanticHighlighting.enabled" = true;
        "editor.stickyScroll.enabled" = false;
        "editor.suggestSelection" = "first";
        "explorer.compactFolders" = false;
        "explorer.confirmDelete" = false;
        "explorer.confirmDragAndDrop" = false;
        "explorer.decorations.badges" = false;
        "extensions.autoCheckUpdates" = false;
        "extensions.autoUpdate" = false;
        "extensions.ignoreRecommendations" = true;
        "files.enableTrash" = false;
        "git.decorations.enabled" = false;
        "github.copilot.editor.enableAutoCompletions" = false;
        "github.copilot.enable" = false;
        "go.alternateTools" = {
          "delve" = "${lib.getExe pkgs.delve}";
          "gofumpt" = "${lib.getExe pkgs.gofumpt}";
          "golangci-lint" = "${lib.getExe pkgs.golangci-lint}";
          "gomodifytags" = "${lib.getExe pkgs.gomodifytags}";
          "gopls" = "${lib.getExe pkgs.gopls}";
          "impl" = "${lib.getExe pkgs.impl}";
          "staticcheck" = "${lib.getExe' pkgs.go-tools "staticcheck"}";
        };
        "go.inlayHints.assignVariableTypes" = true;
        "go.inlayHints.constantValues" = true;
        "go.inlayHints.parameterNames" = true;
        "go.inlayHints.rangeVariableTypes" = true;
        "go.lintTool" = "golangci-lint";
        "gopls" = {
          "formatting.gofumpt" = true;
          "ui.semanticTokens" = true;
        };
        "inlineChat.accessibleDiffView" = "off";
        "markdown.preview.fontFamily" = "Maple Mono NF";
        "markdown.preview.fontSize" = 14;
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "${lib.getExe pkgs.nixd}";
        "nix.serverSettings" = {
          "nixd" = {
            "formatting" = {
              "command" = [ "${lib.getExe pkgs.nixfmt-rfc-style}" ];
            };
            "options" = {
              "home-manager" = {
                "expr" =
                  "(builtins.getFlake \"${config.programs.nh.flake}\").nixosConfigurations.${osConfig.networking.hostName}.options.home-manager.users.type.getSubOptions []";
              };
              "nixos" = {
                "expr" =
                  "(builtins.getFlake \"${config.programs.nh.flake}\").nixosConfigurations.${osConfig.networking.hostName}.options";
              };
            };
          };
        };
        "notebook.markup.fontFamily" = "Maple Mono NF";
        "scm.inputFontFamily" = "Maple Mono NF";
        "scm.inputFontSize" = 14;
        "screencastMode.fontSize" = 14 * 4.0 / 3.0 * 56.0 / 14.0;
        "telemetry.editStats.enabled" = false;
        "telemetry.feedback.enabled" = false;
        "telemetry.telemetryLevel" = "off";
        "terminal.integrated.fontFamily" = "Maple Mono NF";
        "terminal.integrated.fontSize" = 14;
        "terminal.integrated.fontWeight" = "500";
        "terminal.integrated.initialHint" = false;
        "terminal.integrated.minimumContrastRatio" = 1;
        "window.customTitleBarVisibility" = "never";
        "window.menuBarVisibility" = "toggle";
        "window.titleBarStyle" = "native";
        "window.zoomLevel" = 0.7;
        "workbench.activityBar.location" = "hidden";
        "workbench.colorTheme" = "Monospace Dark";
        "workbench.editor.showTabs" = "single";
        "workbench.iconTheme" = "monospace-studio-icons";
        "workbench.sideBar.location" = "right";
        "workbench.startupEditor" = "none";
        "workbench.statusBar.visible" = false;
        "workbench.tips.enabled" = false;
        "workbench.tree.enableStickyScroll" = false;
        "workbench.tree.indent" = 8;
        "workbench.tree.renderIndentGuides" = "none";

        # "zig.path" = "${lib.getExe pkgs.zig}";
        # "zig.zls.path" = "${lib.getExe pkgs.zls}";
      };
      extensions = pkgs.nix4vscode.forVscode [
        "golang.go"
        "jnoortheen.nix-ide"

        "flaviodelgrosso.vscode-monospace-theme"
        # "pkief.material-icon-theme"
        # "supermaven.supermaven"
        # "oven.bun-vscode"
        # "ziglang.vscode-zig"
        # "rust-lang.rust-analyzer"
        # "tamasfe.even-better-toml"
        # "fill-labs.dependi"
      ];
    };
  };
}

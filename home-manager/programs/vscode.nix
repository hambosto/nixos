{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;
    profiles.default = {
      enableExtensionUpdateCheck = false;
      enableUpdateCheck = false;

      userSettings = lib.mkMerge [
        {
          "breadcrumbs.enabled" = false;
          "chat.agent.enabled" = false;
          "chat.disableAIFeatures" = true;
          "chat.editor.fontFamily" = config.stylix.fonts.monospace.name;
          "chat.editor.fontSize" = config.stylix.fonts.sizes.applications;
          "chat.fontFamily" = config.stylix.fonts.sansSerif.name;
          "debug.console.fontFamily" = config.stylix.fonts.monospace.name;
          "debug.console.fontSize" = config.stylix.fonts.sizes.applications;
          "editor.acceptSuggestionOnCommitCharacter" = true;
          "editor.acceptSuggestionOnEnter" = "on";
          "editor.autoClosingBrackets" = "always";
          "editor.bracketPairColorization.enabled" = true;
          "editor.cursorBlinking" = "expand";
          "editor.cursorSmoothCaretAnimation" = "on";
          "editor.fontFamily" = config.stylix.fonts.monospace.name;
          "editor.fontLigatures" = true;
          "editor.fontSize" = config.stylix.fonts.sizes.applications;
          "editor.fontWeight" = "500";
          "editor.formatOnSave" = true;
          "editor.inlayHints.fontFamily" = config.stylix.fonts.monospace.name;
          "editor.inlineSuggest.fontFamily" = config.stylix.fonts.monospace.name;
          "editor.minimap.enabled" = false;
          "editor.minimap.sectionHeaderFontSize" = config.stylix.fonts.sizes.applications;
          "editor.semanticHighlighting.enabled" = true;
          "editor.semanticTokenColorCustomizations" = {
            enabled = true;
            rules = {
              "*.mutable" = {
                underline = false;
              };
            };
          };
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
          "git.decorations.enabled" = true;
          "markdown.preview.fontFamily" = config.stylix.fonts.sansSerif.name;
          "markdown.preview.fontSize" = config.stylix.fonts.sizes.applications;
          "nix.enableLanguageServer" = true;
          "nix.serverPath" = lib.getExe pkgs.nixd;
          "nix.serverSettings" = {
            "nixd" = {
              "formatting" = {
                "command" = [ (lib.getExe pkgs.nixfmt) ];
              };
            };
          };
          "notebook.markup.fontFamily" = config.stylix.fonts.sansSerif.name;
          "scm.inputFontFamily" = config.stylix.fonts.monospace.name;
          "scm.inputFontSize" = config.stylix.fonts.sizes.applications;
          "screencastMode.fontSize" = config.stylix.fonts.sizes.applications * 4.0 / 3.0 * 56.0 / 14.0;
          "telemetry.editStats.enabled" = false;
          "telemetry.feedback.enabled" = false;
          "telemetry.telemetryLevel" = "off";
          "terminal.integrated.fontFamily" = config.stylix.fonts.monospace.name;
          "terminal.integrated.fontSize" = config.stylix.fonts.sizes.applications;
          "terminal.integrated.fontWeight" = "500";
          "terminal.integrated.initialHint" = false;
          "terminal.integrated.minimumContrastRatio" = 1;
          "update.mode" = "none";
          "window.customTitleBarVisibility" = "never";
          "window.menuBarVisibility" = "toggle";
          "window.titleBarStyle" = "native";
          "window.zoomLevel" = 0.5;
          "workbench.activityBar.location" = "hidden";
          "workbench.editor.showTabs" = "single";

          # "workbench.colorTheme" = "Monospace Dark";
          # "workbench.colorTheme" = "Tokyo Night Light";
          # "workbench.colorTheme" = "Tokyo Night";
          # "workbench.colorTheme" = "Gruvbox Dark Hard";
          # "workbench.colorTheme" = "One Dark Pro Night Flat";
          # "workbench.colorTheme" = "One Candy";
          # "workbench.colorTheme" = "Catppuccin Mocha";
          "workbench.colorTheme" = "Dark 2026";
          # "workbench.colorTheme" = "Maple Dark";

          # "workbench.iconTheme" = "monospace-studio-icons";
          "workbench.iconTheme" = "material-icon-theme";
          # "workbench.iconTheme" = "gruvbox-material-icon-theme";
          # "workbench.iconTheme" = "catppuccin-mocha";

          "workbench.secondarySideBar.defaultVisibility" = "hidden";
          "workbench.sideBar.location" = "right";
          "workbench.startupEditor" = "none";
          "workbench.statusBar.visible" = false;
          "workbench.tips.enabled" = false;
          "workbench.tree.enableStickyScroll" = false;
          "workbench.tree.indent" = 8;
          "workbench.tree.renderIndentGuides" = "none";
          "workbench.welcomePage.experimentalOnboarding" = false;
          "workbench.welcomePage.walkthroughs.openOnInstall" = false;
        }

        (lib.mkIf (config.programs.bun.enable or false) {
          "bun.runtime" = lib.getExe pkgs.bun;
          "bun.debugTerminal.enabled" = true;
          "bun.debugTerminal.stopOnEntry" = false;
          "bun.test.filePattern" = "**/*{.test.,.spec.,_test_,_spec_}{js,ts,tsx,jsx,mts,cts}";
          "bun.test.customScript" = "bun test";
        })

        (lib.mkIf (config.programs.go.enable or false) {
          "go.alternateTools" = {
            "delve" = lib.getExe pkgs.delve;
            "gofumpt" = lib.getExe pkgs.gofumpt;
            "golangci-lint" = lib.getExe pkgs.golangci-lint;
            "gomodifytags" = lib.getExe pkgs.gomodifytags;
            "gopls" = lib.getExe pkgs.gopls;
            "impl" = lib.getExe pkgs.impl;
            "staticcheck" = lib.getExe' pkgs.go-tools "staticcheck";
          };
          "go.diagnostic.vulncheck" = "Imports";
          "go.inlayHints.assignVariableTypes" = true;
          "go.inlayHints.compositeLiteralFields" = true;
          "go.inlayHints.compositeLiteralTypes" = true;
          "go.inlayHints.constantValues" = true;
          "go.inlayHints.functionTypeParameters" = true;
          "go.inlayHints.parameterNames" = true;
          "go.inlayHints.rangeVariableTypes" = true;
          "go.lintTool" = "golangci-lint";
          "go.showWelcome" = false;
          "go.survey.prompt" = false;
          "go.useLanguageServer" = true;
          "gopls" = {
            "formatting.gofumpt" = true;
            "ui.semanticTokens" = true;
          };
        })

        (lib.mkIf (config.programs.npm.enable or false) {
          "js/ts.experimental.useTsgo" = true;
        })

        (lib.mkIf (config.programs.rust.enable or false) {
          "rust-analyzer.restartServerOnConfigChange" = true;
          "rust-analyzer.server.path" = lib.getExe pkgs.rust-analyzer;
        })

        (lib.mkIf (config.programs.uv.enable or false) {
          "[python]" = {
            "editor.codeActionsOnSave" = {
              "source.fixAll" = "explicit";
              "source.organizeImports" = "explicit";
            };
            "editor.defaultFormatter" = "ms-python.black-formatter";
            "editor.formatOnSave" = true;
          };
          "python.analysis.autoFormatStrings" = true;
          "python.analysis.autoImportCompletions" = true;
          "python.analysis.completeFunctionParens" = true;
          "python.analysis.inlayHints.callArgumentNames" = "all";
          "python.analysis.inlayHints.functionReturnTypes" = true;
          "python.analysis.inlayHints.pytestParameters" = true;
          "python.analysis.inlayHints.variableTypes" = true;
          "python.analysis.typeCheckingMode" = "strict";
          "python.defaultInterpreterPath" = ".venv/bin/python";
          "python.experiments.enabled" = false;
          "python.languageServer" = "Pylance";
          "python.terminal.activateEnvInCurrentTerminal" = true;
          "python.terminal.activateEnvironment" = true;
          "python.testing.pytestEnabled" = true;
          "python.venvPath" = ".venv";
        })

        (lib.mkIf (config.programs.zig.enable or false) {
          "zig.path" = lib.getExe pkgs.zig;
          "zig.zls.path" = lib.getExe pkgs.zls;
        })
      ];

      extensions =
        with pkgs.vscode-marketplace;
        lib.flatten [
          [
            jnoortheen.nix-ide
            pkief.material-icon-theme
            # mvllow.rose-pine
            # jonathanharty.gruvbox-material-icon-theme
            # enkia.tokyo-night
            # flaviodelgrosso.vscode-monospace-theme
            # jdinhlife.gruvbox
            # catppuccin.catppuccin-vsc
            # catppuccin.catppuccin-vsc-icons
            # zhuangtongfa.material-theme
            # kacperbiedka.one-candy-dark
            # subframe7536.theme-maple
          ]
          (lib.optionals (config.programs.bun.enable or false) [ oven.bun-vscode ])
          (lib.optionals (config.programs.go.enable or false) [ golang.go ])
          (lib.optionals (config.programs.npm.enable or false) [ typescriptteam.native-preview ])
          (lib.optionals (config.programs.rust.enable or false) [
            fill-labs.dependi
            rust-lang.rust-analyzer
            tamasfe.even-better-toml
          ])
          (lib.optionals (config.programs.uv.enable or false) [
            ms-python.black-formatter
            ms-python.debugpy
            ms-python.isort
            ms-python.python
            ms-python.vscode-pylance
          ])
          (lib.optionals (config.programs.zig.enable or false) [ ziglang.vscode-zig ])
        ];
    };
  };
}

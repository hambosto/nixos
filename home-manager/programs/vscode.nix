{
  config,
  lib,
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
        "editor.bracketPairColorization.enabled" = true;
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
      }
      // lib.optionalAttrs (config.programs.go.enable or false) {
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
        "go.inlayHints.compositeLiteralFields" = true;
        "go.inlayHints.compositeLiteralTypes" = true;
        "go.inlayHints.functionTypeParameters" = true;
        "go.inlayHints.rangeVariableTypes" = true;
        "go.diagnostic.vulncheck" = "Imports";
        "go.showWelcome" = false;
        "go.survey.prompt" = false;
        "go.lintTool" = "golangci-lint";
        "go.useLanguageServer" = true;
        "gopls" = {
          "formatting.gofumpt" = true;
          "ui.semanticTokens" = true;
        };
      }
      // lib.optionalAttrs (config.programs.zig.enable or false) {
        "zig.path" = "${lib.getExe pkgs.zig}";
        "zig.zls.path" = "${lib.getExe pkgs.zls}";
      }
      // lib.optionalAttrs (config.programs.uv.enable or false) {
        "python.defaultInterpreterPath" = ".venv/bin/python";
        "python.terminal.activateEnvironment" = true;
        "python.venvPath" = ".venv";
        "python.terminal.activateEnvInCurrentTerminal" = true;
        "python.analysis.autoFormatStrings" = true;
        "python.analysis.autoImportCompletions" = true;
        "python.analysis.completeFunctionParens" = true;
        "python.analysis.typeCheckingMode" = "strict";
        "python.analysis.inlayHints.callArgumentNames" = "all";
        "python.analysis.inlayHints.pytestParameters" = true;
        "python.analysis.inlayHints.variableTypes" = true;
        "python.analysis.inlayHints.functionReturnTypes" = true;
        "python.experiments.enabled" = false;
        "python.languageServer" = "Pylance";
        "python.testing.pytestEnabled" = true;

        "[python]" = {
          "editor.defaultFormatter" = "ms-python.black-formatter";
          "editor.formatOnSave" = true;
          "editor.codeActionsOnSave" = {
            "source.fixAll" = "explicit";
            "source.organizeImports" = "explicit";
          };
        };
      };

      extensions = pkgs.nix4vscode.forVscode (
        [
          "jnoortheen.nix-ide"
          "flaviodelgrosso.vscode-monospace-theme"
        ]
        ++ lib.optionals (config.programs.rust-lang.enable or false) [
          "rust-lang.rust-analyzer"
          "tamasfe.even-better-toml"
          "fill-labs.dependi"
        ]
        ++ lib.optionals (config.programs.go.enable or false) [ "golang.go" ]
        ++ lib.optionals (config.programs.bun.enable or false) [ "oven.bun-vscode" ]
        ++ lib.optionals (config.programs.zig.enable or false) [ "ziglang.vscode-zig" ]
        ++ lib.optionals (config.programs.uv.enable or false) [
          "ms-python.python"
          "ms-python.debugpy"
          "ms-python.vscode-pylance"
          "ms-python.black-formatter"
          "ms-python.isort"
        ]
      );
    };
  };
}

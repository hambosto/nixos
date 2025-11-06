{ lib, pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    profiles.default = {
      enableUpdateCheck = false;
      enableExtensionUpdateCheck = false;
      userSettings = {
        "breadcrumbs.enabled" = false;
        "chat.editor.fontFamily" = "JetBrainsMono Nerd Font";
        "chat.editor.fontSize" = 14;
        "debug.console.fontFamily" = "JetBrainsMono Nerd Font";
        "debug.console.fontSize" = 14;
        "editor.acceptSuggestionOnCommitCharacter" = true;
        "editor.acceptSuggestionOnEnter" = "on";
        "editor.autoClosingBrackets" = "always";
        "editor.cursorBlinking" = "expand";
        "editor.cursorSmoothCaretAnimation" = "on";
        "editor.fontFamily" = "JetBrainsMono Nerd Font";
        "editor.fontLigatures" = true;
        "editor.fontSize" = 14;
        "editor.fontWeight" = "500";
        "editor.formatOnSave" = true;
        "editor.inlayHints.fontFamily" = "JetBrainsMono Nerd Font";
        "editor.inlineSuggest.fontFamily" = "JetBrainsMono Nerd Font";
        "editor.minimap.enabled" = false;
        "editor.minimap.sectionHeaderFontSize" = 14;
        "editor.semanticHighlighting.enabled" = true;
        "editor.stickyScroll.enabled" = false;
        "editor.suggestSelection" = "first";
        "explorer.compactFolders" = false;
        "explorer.confirmDelete" = false;
        "explorer.confirmDragAndDrop" = false;
        "explorer.decorations.badges" = false;
        "files.enableTrash" = false;
        "git.decorations.enabled" = false;
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
        "markdown.preview.fontFamily" = "JetBrainsMono Nerd Font";
        "markdown.preview.fontSize" = 14;
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "${pkgs.nixd}/bin/nixd";
        "nix.serverSettings" = {
          "nixd" = {
            "formatting" = {
              "command" = [ "${lib.getExe pkgs.nixfmt-rfc-style}" ];
            };
          };
        };
        "scm.inputFontFamily" = "JetBrainsMono Nerd Font";
        "scm.inputFontSize" = 14;
        "screencastMode.fontSize" = 14 * 4.0 / 3.0 * 56.0 / 14.0;
        "telemetry.telemetryLevel" = "off";
        "terminal.integrated.fontFamily" = "JetBrainsMono Nerd Font";
        "terminal.integrated.fontSize" = 14;
        "terminal.integrated.fontWeight" = "600";
        "terminal.integrated.minimumContrastRatio" = 1;
        "window.customTitleBarVisibility" = "never";
        "window.menuBarVisibility" = "toggle";
        "window.titleBarStyle" = "native";
        "workbench.activityBar.location" = "hidden";
        "workbench.colorTheme" = "Monospace Studio Dark";
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

        # "spacebox.monospace-idx-theme"
        # "miguelsolorio.symbols"
        # "enkia.tokyo-night"
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

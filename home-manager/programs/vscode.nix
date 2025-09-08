{
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
        "editor.fontSize" = 14;
        "editor.fontFamily" = "Maple Mono NF";
        "editor.fontLigatures" = true;
        "editor.fontWeight" = "500";
        "editor.formatOnSave" = true;
        "editor.minimap.enabled" = false;
        "editor.cursorBlinking" = "expand";
        "editor.cursorSmoothCaretAnimation" = "on";
        "editor.suggestSelection" = "first";
        "editor.acceptSuggestionOnCommitCharacter" = true;
        "editor.acceptSuggestionOnEnter" = "on";
        "editor.autoClosingBrackets" = "always";
        "editor.semanticHighlighting.enabled" = true;
        "editor.stickyScroll.enabled" = false;

        "workbench.colorTheme" = "Monospace IDX Dark";
        "workbench.iconTheme" = "monospace-idx-file-icon-theme";
        "workbench.activityBar.location" = "hidden";
        "workbench.editor.showTabs" = "single";
        "workbench.statusBar.visible" = false;
        "workbench.startupEditor" = "none";
        "workbench.sideBar.location" = "right";
        "workbench.tips.enabled" = false;
        "workbench.tree.enableStickyScroll" = false;
        "workbench.tree.renderIndentGuides" = "none";
        "workbench.tree.indent" = 8;

        "explorer.compactFolders" = false;
        "explorer.confirmDragAndDrop" = false;
        "explorer.confirmDelete" = false;
        "explorer.decorations.badges" = false;
        "git.decorations.enabled" = false;
        "breadcrumbs.enabled" = false;

        "terminal.integrated.fontSize" = 14;
        "terminal.integrated.fontFamily" = "Maple Mono NF";
        "terminal.integrated.fontWeight" = "600";
        "terminal.integrated.minimumContrastRatio" = 1;

        "telemetry.telemetryLevel" = "off";
        "window.menuBarVisibility" = "toggle";
        "window.titleBarStyle" = "native";
        "window.customTitleBarVisibility" = "never";

        "go.inlayHints.assignVariableTypes" = true;
        "go.inlayHints.constantValues" = true;
        "go.inlayHints.parameterNames" = true;
        "go.inlayHints.rangeVariableTypes" = true;
        "go.alternateTools" = {
          "gofumpt" = "${lib.getExe pkgs.gofumpt}";
          "golangci-lint" = "${lib.getExe pkgs.golangci-lint}";
          "gomodifytags" = "${lib.getExe pkgs.gomodifytags}";
          "gopls" = "${lib.getExe pkgs.gopls}";
          "impl" = "${lib.getExe pkgs.impl}";
          "staticcheck" = "${lib.getExe' pkgs.go-tools "staticcheck"}";
          "delve" = "${lib.getExe pkgs.delve}";
        };
        "go.lintTool" = "golangci-lint";
        "gopls" = {
          "formatting.gofumpt" = true;
          "ui.semanticTokens" = true;
        };

        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "${pkgs.nixd}/bin/nixd";
        "nix.serverSettings" = {
          "nixd" = {
            "formatting" = {
              "command" = [ "${lib.getExe pkgs.nixfmt-rfc-style}" ];
            };
          };
        };

        # "zig.path" = "${lib.getExe pkgs.zig}";
        # "zig.zls.path" = "${lib.getExe pkgs.zls}";

      };
      extensions = pkgs.nix4vscode.forVscode [
        "golang.go"
        "jnoortheen.nix-ide"
        "spacebox.monospace-idx-theme"

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

{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.helix = {
    defaultEditor = true;
    enable = true;
    languages = {
      language = [
        # {
        #   auto-format = true;
        #   formatter.command = "${lib.getExe' pkgs.clang-tools "clang-format"}";
        #   language-servers = [ "clangd" ];
        #   name = "c";
        # }
        {
          auto-format = true;
          formatter.command = lib.getExe pkgs.gosimports;
          language-servers = [ "gopls" ];
          name = "go";
        }
        {
          auto-format = true;
          formatter.command = lib.getExe pkgs.nixfmt-rfc-style;
          language-servers = [ "nixd" ];
          name = "nix";
        }
        # {
        #   auto-format = true;
        #   formatter.args = [
        #     "-"
        #     "--quiet"
        #   ];
        #   formatter.command = lib.getExe pkgs.black;
        #   language-servers = [ "pyright" ];
        #   name = "python";
        # }
        # {
        #   auto-format = true;
        #   formatter.command = lib.getExe pkgs.rustfmt;
        #   name = "rust";
        # }
        # {
        #   auto-format = true;
        #   formatter = {
        #     args = [
        #       "fmt"
        #       "--stdin"
        #     ];
        #     command = lib.getExe pkgs.zig;
        #   };
        #   language-servers = [ "zls" ];
        #   name = "zig";
        # }
      ];
      language-server = {
        # clangd.command = "${lib.getExe' pkgs.clang-tools "clangd"}";
        gopls.command = lib.getExe pkgs.gopls;
        nixd.command = lib.getExe pkgs.nixd;
        # pyright.command = "${lib.getExe' pkgs.pyright "pyright-langserver"}";
        # rust-analyzer.command = lib.getExe pkgs.rust-analyzer;
        # zls.command = lib.getExe pkgs.zls;
      };
    };
    settings = {
      editor = {
        color-modes = true;
        completion-replace = true;
        completion-timeout = 1;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        cursorline = true;
        end-of-line-diagnostics = "hint";
        file-picker.hidden = false;
        gutters = [
          "diff"
          "diagnostics"
          "line-numbers"
          "spacer"
        ];
        idle-timeout = 1;
        indent-guides = {
          character = "┆";
          rainbow = "dim";
          render = true;
        };
        lsp = {
          auto-signature-help = true;
          display-inlay-hints = true;
          display-messages = true;
          display-progress-messages = true;
          display-signature-help-docs = true;
          enable = true;
          goto-reference-include-declaration = true;
          snippets = true;
        };
        soft-wrap.enable = true;
        statusline = {
          center = [ "file-name" ];
          left = [
            "mode"
            "spinner"
          ];
          mode = {
            insert = "INSERT";
            normal = "NORMAL";
            select = "SELECT";
          };
          right = [
            "diagnostics"
            "selections"
            "position"
            "file-line-ending"
            "file-type"
            "version-control"
          ];
          separator = "|";
        };
        true-color = true;
        whitespace = {
          characters = {
            nbsp = "⍽";
            newline = "⏎";
            space = "·";
            tab = "→";
            tabpad = "·";
          };
        };
      };
      theme = "stylix";
    };

    themes = {
      stylix = with config.lib.stylix.colors.withHashtag; {
        attribute = base09;
        comment = {
          fg = base03;
          modifiers = [ "italic" ];
        };
        constant = base09;
        "constant.character.escape" = base0C;
        "constant.numeric" = base09;
        constructor = base0D;
        debug = base03;
        diagnostic = {
          modifiers = [ "underlined" ];
        };
        "diff.delta" = base09;
        "diff.minus" = base08;
        "diff.plus" = base0B;
        error = base08;
        function = base0D;
        hint = base03;
        info = base0D;
        keyword = base0E;
        label = base0E;
        namespace = base0E;
        operator = base05;
        special = base0D;
        string = base0B;
        tag = base08;
        type = base0A;
        variable = base08;
        "variable.other.member" = base0D;
        warning = base09;
        "markup.bold" = {
          fg = base0A;
          modifiers = [ "bold" ];
        };
        "markup.heading.1" = {
          fg = base0D;
          modifiers = [ "bold" ];
        };
        "markup.heading.2" = {
          fg = base08;
          modifiers = [ "bold" ];
        };
        "markup.heading.3" = {
          fg = base09;
          modifiers = [ "bold" ];
        };
        "markup.heading.4" = {
          fg = base0A;
          modifiers = [ "bold" ];
        };
        "markup.heading.5" = {
          fg = base0B;
          modifiers = [ "bold" ];
        };
        "markup.heading.6" = {
          fg = base0C;
          modifiers = [ "bold" ];
        };
        "markup.italic" = {
          fg = base0E;
          modifiers = [ "italic" ];
        };
        "markup.link.text" = base08;
        "markup.link.url" = {
          fg = base09;
          modifiers = [ "underlined" ];
        };
        "markup.list" = base08;
        "markup.quote" = base0C;
        "markup.raw" = base0B;
        "markup.strikethrough" = {
          modifiers = [ "crossed_out" ];
        };
        "diagnostic.hint" = {
          underline = {
            style = "curl";
          };
        };
        "diagnostic.info" = {
          underline = {
            style = "curl";
          };
        };
        "diagnostic.warning" = {
          underline = {
            style = "curl";
          };
        };
        "diagnostic.error" = {
          underline = {
            style = "curl";
          };
        };
        "ui.background" = {
          bg = base00;
        };
        "ui.bufferline.active" = {
          fg = base00;
          bg = base03;
          modifiers = [ "bold" ];
        };
        "ui.bufferline" = {
          fg = base04;
          bg = base00;
        };
        "ui.cursor" = {
          fg = base06;
          modifiers = [ "reversed" ];
        };
        "ui.cursor.primary" = {
          fg = base05;
          modifiers = [ "reversed" ];
        };
        "ui.cursorline.primary" = {
          fg = base05;
          bg = base01;
        };
        "ui.cursor.match" = {
          fg = base05;
          bg = base02;
          modifiers = [ "bold" ];
        };
        "ui.cursor.select" = {
          fg = base05;
          modifiers = [ "reversed" ];
        };
        "ui.gutter" = {
          bg = base00;
        };
        "ui.help" = {
          fg = base06;
          bg = base01;
        };
        "ui.linenr" = {
          fg = base03;
          bg = base00;
        };
        "ui.linenr.selected" = {
          fg = base04;
          bg = base01;
          modifiers = [ "bold" ];
        };
        "ui.menu" = {
          fg = base05;
          bg = base01;
        };
        "ui.menu.scroll" = {
          fg = base03;
          bg = base01;
        };
        "ui.menu.selected" = {
          fg = base01;
          bg = base04;
        };
        "ui.popup" = {
          bg = base01;
        };
        "ui.selection" = {
          bg = base02;
        };
        "ui.selection.primary" = {
          bg = base02;
        };
        "ui.statusline" = {
          fg = base04;
          bg = base01;
        };
        "ui.statusline.inactive" = {
          bg = base01;
          fg = base03;
        };
        "ui.statusline.insert" = {
          fg = base00;
          bg = base0B;
        };
        "ui.statusline.normal" = {
          fg = base00;
          bg = base03;
        };
        "ui.statusline.select" = {
          fg = base00;
          bg = base0F;
        };
        "ui.text" = base05;
        "ui.text.directory" = base0D;
        "ui.text.focus" = base05;
        "ui.virtual.indent-guide" = {
          fg = base03;
        };
        "ui.virtual.inlay-hint" = {
          fg = base03;
        };
        "ui.virtual.ruler" = {
          bg = base01;
        };
        "ui.virtual.jump-label" = {
          fg = base0A;
          modifiers = [ "bold" ];
        };
        "ui.virtual.whitespace" = {
          fg = base03;
        };
        "ui.window" = {
          bg = "base01";
        };
      };
    };
  };
}

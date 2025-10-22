{ pkgs, ... }:
{
  programs.obsidian = {
    enable = false;
    defaultSettings = {
      app = {
        file-explorer = true;
      };
      appearance = {
        cssTheme = "Catppuccin";
        interfaceFontFamily = "JetBrainsMono Nerd Font";
        textFontFamily = "JetBrainsMono Nerd Font";
        monospaceFontFamily = "JetBrainsMono Nerd Font";
        baseFontSize = 12;
        translycency = true;
      };

      communityPlugins = [ ];
      corePlugins = [
        "audio-recorder"
        "backlink"
        "bookmarks"
        "canvas"
        "command-palette"
        "daily-notes"
        "editor-status"
        "file-explorer"
        "file-recovery"
        "global-search"
        "graph"
        "markdown-importer"
        "note-composer"
        "outgoing-link"
        "outline"
        "page-preview"
        "properties"
        "publish"
        "random-note"
        "slash-command"
        "slides"
        "switcher"
        "sync"
        "tag-pane"
        "templates"
        "word-count"
        "workspaces"
        "zk-prefixer"
      ];
      hotkeys = { };
      themes = [
        {
          pkg = pkgs.obsidian-catppuccin;
          enable = true;
        }
      ];
    };
    vaults = {
      Work = {
        target = "Documents/Obsidian/Work";
      };
      Personal = {
        target = "Documents/Obsidian/Personal";
      };
    };
  };
}

{ lib, ... }:

let
  inherit (lib)
    listToAttrs
    flatten
    mapAttrsToList
    nameValuePair
    ;

  # Application configurations
  apps = {
    browser = "brave-browser.desktop";
    editor = "code.desktop";
    imageViewer = "imv-dir.desktop";
    audioPlayer = "mpv.desktop";
    videoPlayer = "mpv.desktop";
    fileManager = "yazi.desktop";
    officeSuite = "libreoffice.desktop";
    pdfViewer = "org.pwmt.zathura-pdf-mupdf.desktop";
    terminal = "kitty.desktop";
    discord = "vesktop.desktop";
  };

  # MIME type mappings
  mimeTypes = {
    text = [ "text/plain" ];

    image = [
      "image/bmp"
      "image/gif"
      "image/jpeg"
      "image/jpg"
      "image/png"
      "image/svg+xml"
      "image/tiff"
      "image/vnd.microsoft.icon"
      "image/webp"
    ];

    audio = [
      "audio/aac"
      "audio/mpeg"
      "audio/ogg"
      "audio/opus"
      "audio/wav"
      "audio/webm"
      "audio/x-matroska"
    ];

    video = [
      "video/mp2t"
      "video/mp4"
      "video/mpeg"
      "video/ogg"
      "video/webm"
      "video/x-flv"
      "video/x-matroska"
      "video/x-msvideo"
    ];

    directory = [ "inode/directory" ];

    browser = [
      "text/html"
      "x-scheme-handler/about"
      "x-scheme-handler/http"
      "x-scheme-handler/https"
      "x-scheme-handler/unknown"
    ];

    office = [
      # OpenDocument formats
      "application/vnd.oasis.opendocument.text"
      "application/vnd.oasis.opendocument.spreadsheet"
      "application/vnd.oasis.opendocument.presentation"
      # Microsoft Office XML formats
      "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
      "application/vnd.openxmlformats-officedocument.presentationml.presentation"
      # Legacy Microsoft formats
      "application/msword"
      "application/vnd.ms-excel"
      "application/vnd.ms-powerpoint"
      "application/rtf"
    ];

    pdf = [ "application/pdf" ];
    terminal = [ "terminal" ];
    discord = [ "x-scheme-handler/discord" ];
  };

  # Map category names to their apps
  categoryToApp = {
    text = apps.editor;
    image = apps.imageViewer;
    audio = apps.audioPlayer;
    video = apps.videoPlayer;
    directory = apps.fileManager;
    browser = apps.browser;
    office = apps.officeSuite;
    pdf = apps.pdfViewer;
    terminal = apps.terminal;
    discord = apps.discord;
  };

  # Build associations: MIME type -> [app]
  buildAssociations = listToAttrs (
    flatten (
      mapAttrsToList (
        category: mimes: map (mime: nameValuePair mime [ categoryToApp.${category} ]) mimes
      ) mimeTypes
    )
  );

in
{
  xdg = {
    enable = true;

    configFile."mimeapps.list".force = true;

    mimeApps = {
      enable = true;
      associations.added = buildAssociations;
      defaultApplications = buildAssociations;
    };

    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };
}

{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.chromium = {
    enable = true;
    package = lib.mkForce (
      pkgs.chromium.override {
        commandLineArgs = lib.concatStringsSep " " config.programs.chromium.commandLineArgs;
      }
    );
    commandLineArgs = [
      "--ozone-platform=wayland"
      "--ozone-platform-hint=auto"
      "--enable-features=WebRTCPipeWireCapturer"
      "--ignore-gpu-blocklist"
      "--enable-gpu-rasterization"
    ];
    extensions = [
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # ublock origin
      { id = "mnjggcdmjocbbbhaepdhchncahnbgone"; } # SponsorBlock
      { id = "nngceckbapebfimnlniiiahkandclblb"; } # Bitwarden
      # { id = "bfnaelmomeimhlpmgjnjophhpkkoljpa"; } # Phantom Wallet
      # { id = "nkbihfbeogaeaoehlefnkodbefgpgknn"; } # MetaMask
      { id = "bggfcpfjbdkhfhfmkjpbhnkhmpgjnjph"; } # Material Icons for GitHub
    ];
  };
}

{ pkgs, ... }:
{
  programs.chromium = {
    enable = true;
    package = pkgs.chromium.override { enableWideVine = true; };
    commandLineArgs = [
      "--ozone-platform=wayland"
      "--ozone-platform-hint=auto"
    ];
    extensions = [
      { id = "ddkjiahejlhfcafbddmgiahcphecmpfh"; } # ublock origin lite
      { id = "mnjggcdmjocbbbhaepdhchncahnbgone"; } # SponsorBlock
      { id = "nngceckbapebfimnlniiiahkandclblb"; } # Bitwarden
      # { id = "bfnaelmomeimhlpmgjnjophhpkkoljpa"; } # Phantom Wallet
      # { id = "nkbihfbeogaeaoehlefnkodbefgpgknn"; } # MetaMask
      { id = "bggfcpfjbdkhfhfmkjpbhnkhnpjjeomc"; } # Material Icon for GitHub
    ];
  };
}

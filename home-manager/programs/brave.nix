{ pkgs, ... }: {
  programs.brave = {
    enable = true;
    package = pkgs.brave.overrideAttrs {
      commandLineArgs = [
        "--ozone-platform=wayland"
        "--ozone-platform-hint=auto"
      ];
      enableWideVine = true;
    };
    extensions = [
      # { id = "ddkjiahejlhfcafbddmgiahcphecmpfh"; } # ublock origin lite
      { id = "mnjggcdmjocbbbhaepdhchncahnbgone"; } # SponsorBlock
      { id = "nngceckbapebfimnlniiiahkandclblb"; } # Bitwarden
      # { id = "bfnaelmomeimhlpmgjnjophhpkkoljpa"; } # Phantom Wallet
      # { id = "nkbihfbeogaeaoehlefnkodbefgpgknn"; } # MetaMask
      { id = "bggfcpfjbdkhfhfmkjpbhnkhnpjjeomc"; } # Material Icon for GitHub
    ];
  };
}

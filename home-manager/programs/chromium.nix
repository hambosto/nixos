{
  programs.chromium = {
    enable = true;
    commandLineArgs = [
      "--ozone-platform=wayland"
      "--ozone-platform-hint=auto"
    ];
    extensions = [
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # ublock origin
      { id = "mnjggcdmjocbbbhaepdhchncahnbgone"; } # SponsorBlock
      { id = "nngceckbapebfimnlniiiahkandclblb"; } # Bitwarden
      # { id = "bfnaelmomeimhlpmgjnjophhpkkoljpa"; } # Phantom Wallet
      # { id = "nkbihfbeogaeaoehlefnkodbefgpgknn"; } # MetaMask
      { id = "bggfcpfjbdkhfhfmkjpbhnkhnpjjeomc"; } # Material Icon for GitHub
    ];
  };
}

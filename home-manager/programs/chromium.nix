{
  programs.chromium = {
    enable = true;
    # package = pkgs.ungoogled-chromium;
    # commandLineArgs = [
    #   "--ignore-gpu-blocklist"
    #   "--enable-gpu-rasterization"
    #   "--enable-zero-copy"
    #   "--disable-features=UseChromeOSDirectVideoDecoder"
    #   "--ozone-platform=wayland"
    #   "--enable-media-router"
    #   "--enable-smooth-scrolling"
    #   "--disable-search-engine-collection"
    #   "--extension-mime-request-handling=always-prompt-for-install"
    #   "--fingerprinting-canvas-image-data-noise"
    #   "--fingerprinting-canvas-measuretext-noise"
    #   "--fingerprinting-client-rects-noise"
    #   "--popups-to-tabs"
    #   "--force-punycode-hostnames"
    #   "--show-avatar-button=incognito-and-guest"
    #   "--no-default-browser-check"
    #   "--no-pings"
    # ];
    extensions = [
      "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
      "mnjggcdmjocbbbhaepdhchncahnbgone" # SponsorBlock
      "nngceckbapebfimnlniiiahkandclblb" # Bitwarden
      # "bfnaelmomeimhlpmgjnjophhpkkoljpa" # Phantom Wallet
      # "nkbihfbeogaeaoehlefnkodbefgpgknn" # MetaMask
      "bggfcpfjbdkhfhfmkjpbhnkhnpjjeomc" # Material Icons for GitHub
    ];
  };
}

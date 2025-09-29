{
  virtualisation.docker = {
    enable = false;
    enableOnBoot = true;
    daemon.settings = {
      data-root = "/home/ilham/.docker";
      features = {
        buildkit = true;
      };
      registry-mirrors = [ "https://mirror.gcr.io" ];
    };

    autoPrune = {
      enable = true;
      dates = "weekly";
      flags = [ "--all" ];
    };

    storageDriver = "btrfs";
  };
}

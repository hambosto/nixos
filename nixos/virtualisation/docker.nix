{
  virtualisation.docker.rootless = {
    enable = false;
    setSocketVariable = true;
    daemon.settings = {
      registry-mirrors = [ "https://mirror.gcr.io" ];
    };
  };
}

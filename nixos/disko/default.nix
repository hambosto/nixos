{
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/nvme0n1";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              priority = 1;
              name = "ESP";
              start = "1M";
              end = "512M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };
            luks = {
              size = "100%";
              content = {
                type = "luks";
                name = "crypted";
                # Interactive password entry during installation and boot
                settings = {
                  allowDiscards = true;
                };
                content = {
                  type = "btrfs";
                  extraArgs = [ "-f" ];
                  subvolumes = {
                    "/root" = {
                      mountpoint = "/";
                      mountOptions = [
                        "subvol=root"
                        "compress=zstd"
                        "noatime"
                      ];
                    };
                    "/home" = {
                      mountOptions = [
                        "subvol=home"
                        "compress=zstd"
                        "noatime"
                      ];
                      mountpoint = "/home";
                    };
                    "/nix" = {
                      mountOptions = [
                        "subvol=nix"
                        "compress=zstd"
                        "noatime"
                      ];
                      mountpoint = "/nix";
                    };
                    "/var" = {
                      mountOptions = [
                        "subvol=var"
                        "compress=zstd"
                        "noatime"
                      ];
                      mountpoint = "/var";
                    };
                    "/tmp" = {
                      mountOptions = [
                        "subvol=tmp"
                        "compress=zstd"
                        "noatime"
                      ];
                      mountpoint = "/tmp";
                    };
                  };
                };
              };
            };
          };
        };
      };
    };
  };
}

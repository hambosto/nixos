{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.fish = {
    enable = true;
    plugins = [
      {
        name = "z";
        src = pkgs.fishPlugins.z.src;
      }
      {
        name = "sponge";
        src = pkgs.fishPlugins.sponge.src;
      }
      {
        name = "plugin-git";
        src = pkgs.fishPlugins.plugin-git.src;
      }
      {
        name = "fzf-fish";
        src = pkgs.fishPlugins.fzf-fish.src;
      }
      {
        name = "autopair";
        src = pkgs.fishPlugins.autopair.src;
      }
      {
        name = "hydro";
        src = pkgs.fishPlugins.hydro.src;
      }
    ];
    shellAliases = {
      cat = "${lib.getExe pkgs.bat} --paging=never";
      tree = "${lib.getExe pkgs.eza} --icons=always --tree --no-quotes";
      ssh = "${lib.getExe pkgs.kitty} +kitten ssh";

      # nix specific aliases
      nix-rebuild = "sudo nixos-rebuild switch --flake ${config.xdg.configHome}/nixos#vivobook-m1403qa";
      nix-update = "nix flake update --flake ${config.xdg.configHome}/nixos";
      nix-clean = "nh clean all";
      nix-optimise = "nix store optimise";
      nix-boot = "sudo /run/current-system/bin/switch-to-configuration boot";
      nix-generation = "sudo nix-env -p /nix/var/nix/profiles/system --list-generations";

    };
    interactiveShellInit = ''
      set fish_greeting
      if [ -z "$NVIM" ]; and [ "$TERM_PROGRAM" != "vscode" ]
          ${lib.getExe pkgs.fastfetch}
      end
    '';
  };
}

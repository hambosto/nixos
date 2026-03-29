{ lib, pkgs, ... }:
let
  nixos-toolbox = pkgs.writeShellScriptBin "nixos-toolbox" ''
    set -e

    CONFIG_DIR="$HOME/.config/nixos"

    cmd_rebuild() {
      cd "$CONFIG_DIR"
      ${lib.getExe pkgs.git} add .
      ${lib.getExe pkgs.nh} os switch
    }

    cmd_test() {
      cd "$CONFIG_DIR"
      ${lib.getExe pkgs.git} add .
      ${lib.getExe pkgs.nh} os test
    }

    cmd_update() {
      cd "$CONFIG_DIR"
      ${lib.getExe pkgs.nix} flake update
    }

    cmd_rollback() {
      cd "$CONFIG_DIR"
      ${lib.getExe pkgs.nh} os rollback
    }

    cmd_garbage_collection() {
      cd "$CONFIG_DIR"
      ${lib.getExe pkgs.nh} clean all
      sudo /run/current-system/bin/switch-to-configuration boot
    }

    cmd_optimise_store() {
      ${lib.getExe pkgs.nix} store optimise
    }

    cmd_list_generations() {
      ${lib.getExe pkgs.nh} os info
    }

    cmd_edit_config() {
      ${lib.getExe pkgs.helix} "$CONFIG_DIR"
    }

    cmd_enter_bios() {
      if ${lib.getExe pkgs.gum} confirm "Are you sure you want to reboot into BIOS?"; then
        sudo ${lib.getExe' pkgs.systemd "systemctl"} reboot --firmware-setup
      fi
    }

    show_ui() {
      local menu_items=(
        "󱌢 Rebuild"
        "󰙨 Test"
        "󰚰 Update"
        "󰑓 Rollback"
        " Garbage Collection"
        "󰃢 Optimise Store"
        " List Generations"
        " Edit Configuration"
        " Enter BIOS"
      )

      local choice
      choice=$(printf '%s\n' "''${menu_items[@]}" | ${lib.getExe pkgs.gum} choose --height=11) || return

      case "$choice" in
        "󱌢 Rebuild")            cmd_rebuild ;;
        "󰙨 Test")               cmd_test ;;
        "󰚰 Update")             cmd_update ;;
        "󰑓 Rollback")           cmd_rollback ;;
        " Garbage Collection") cmd_garbage_collection ;;
        "󰃢 Optimise Store")     cmd_optimise_store ;;
        " List Generations")   cmd_list_generations ;;
        " Edit Configuration") cmd_edit_config ;;
        " Enter BIOS")         cmd_enter_bios ;;
      esac
    }

    main() {
      clear

      if [ $# -lt 1 ]; then
        show_ui
        return
      fi

      case "$1" in
        rebuild)            cmd_rebuild ;;
        test)               cmd_test ;;
        update)             cmd_update ;;
        rollback)           cmd_rollback ;;
        garbage-collection) cmd_garbage_collection ;;
        optimise-store)     cmd_optimise_store ;;
        list-generations)   cmd_list_generations ;;
        edit)               cmd_edit_config ;;
        bios)               cmd_enter_bios ;;
        *)
          echo "Unknown command: $1"
          return 1
          ;;
      esac
    }

    main "$@"
  '';
in
{
  home.packages = [ nixos-toolbox ];
}

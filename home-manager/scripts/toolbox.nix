{
  config,
  hostname,
  pkgs,
  ...
}:
let
  configDirectory = "${config.xdg.configHome}/nixos";
  menuItems = [
    {
      icon = "󰑓";
      name = "Rebuild";
      command = "toolbox rebuild";
    }
    {
      icon = "󰦗";
      name = "Upgrade";
      command = "toolbox upgrade";
    }
    {
      icon = "󰚰";
      name = "Update";
      command = "toolbox update";
    }
    {
      icon = "";
      name = "Optimise Nix Store";
      command = "toolbox optimise";
    }
    {
      icon = "";
      name = "Collect Garbage";
      command = "toolbox gc";
    }
    {
      icon = "󰍜";
      name = "Clean Boot Menu";
      command = "toolbox cb";
    }
  ];
  menuItemsString = builtins.concatStringsSep "\n" (
    map (item: "${if item.icon == "" then "󰘳" else item.icon};${item.name};${item.command}") menuItems
  );

  toolbox = pkgs.writeShellScriptBin "toolbox" ''
    function exec() {
      $@
    }

    function ui() {
      fzf_result=$(printf "%s\n" "${menuItemsString}" | awk -F ';' '{print $1" "$2}' | ${pkgs.fzf}/bin/fzf)
      [[ -z $fzf_result ]] && exit 0

      fzf_result=''${fzf_result/ /;}
      line=$(printf "%s\n" "${menuItemsString}" | grep "$fzf_result")
      command=$(echo "$line" | sed 's/^[^;]*;//;s/^[^;]*;//')
      exec "$command"
      exit 0
    }

    # Command handlers
    function rebuild() {
      sudo nixos-rebuild switch --flake ${configDirectory}#${hostname}
    }

    function upgrade() {
      sudo nixos-rebuild switch --upgrade --flake '${configDirectory}#${hostname}'
    }

    function update() {
      cd ${configDirectory} && nix flake update
    }

    function garbage_collect() {
      cd ${configDirectory} && sudo nix-collect-garbage -d
    }

    function clean_boot() {
      sudo /run/current-system/bin/switch-to-configuration boot
    }

    function store_optimise() {
      nix store optimise
    }

    function loop_mode() {
      while true; do
        toolbox
        echo "Press enter to continue, e to exit"
        read -n 1 REPLY
        clear
        [[ $REPLY == "e" ]] && exit 0
      done
    }

    # Command router
    case $1 in
      "")
        ui
        ;;
      "rebuild")
        rebuild
        ;;
      "upgrade")
        upgrade
        ;;
      "update")
        update
        ;;
      "gc")
        garbage_collect
        ;;
      "cb")
        clean_boot
        ;;
      "optimise")
        store_optimise
        ;;
      "loop")
        loop_mode
        ;;
      *)
        echo "Unknown argument: $1"
        exit 1
        ;;
    esac
  '';
in
{
  home.packages = [ toolbox ];
}

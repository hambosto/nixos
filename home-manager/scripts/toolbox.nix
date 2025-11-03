{ lib, pkgs, ... }:
let
  nixos-toolbox =
    pkgs.writers.writePython3Bin "nixos-toolbox"
      {
        doCheck = false;
        makeWrapperArgs = [
          "--prefix"
          "PATH"
          ":"
          "${lib.makeBinPath [
            pkgs.git
            pkgs.nix
            pkgs.helix
            pkgs.nixos-rebuild
            pkgs.nh
          ]}"
        ];
        libraries = (
          p: [
            p.rich
            p.inquirerpy
          ]
        );
      }
      ''
        from rich.console import Console
        from InquirerPy import inquirer
        import subprocess
        import os
        import sys

        console = Console()
        CONFIG_DIR = os.path.expanduser("~/.config/nixos")

        def log_info(msg):
            console.print(f"[bold green][INFO][/bold green] {msg}")

        def log_warn(msg):
            console.print(f"[bold yellow][WARN][/bold yellow] {msg}")

        def log_error(msg):
            console.print(f"[bold red][ERROR][/bold red] {msg}", file=sys.stderr)

        def execute(cmd, use_doas=False):
            full_cmd = f"doas {cmd}" if use_doas else cmd
            log_info(f"Executing: {full_cmd}")
            try:
                subprocess.run(full_cmd, shell=True, check=True)
                log_info("Command completed successfully")
            except subprocess.CalledProcessError as e:
                log_error(f"Command failed with exit code {e.returncode}")
                sys.exit(e.returncode)

        def cmd_rebuild():
            log_info("Starting NixOS rebuild...")
            os.chdir(CONFIG_DIR)
            execute("git add .")
            execute("nixos-rebuild switch --flake .", use_doas=True)

        def cmd_rebuild_nh():
            log_info("Starting NixOS rebuild with nh...")
            os.chdir(CONFIG_DIR)
            execute("git add .")
            execute("nh os switch")

        def cmd_test():
            log_info("Testing NixOS configuration...")
            os.chdir(CONFIG_DIR)
            execute("git add .")
            execute("nixos-rebuild test --flake .", use_doas=True)

        def cmd_update():
            log_info("Updating flake inputs...")
            os.chdir(CONFIG_DIR)
            execute("nix flake update")

        def cmd_garbage_collection():
            log_info("Starting Nix garbage collection...")
            os.chdir(CONFIG_DIR)
            execute("nix-collect-garbage -d", use_doas=True)
            execute("nix-collect-garbage -d")
            execute("nix store optimise")
            execute("/run/current-system/bin/switch-to-configuration boot", use_doas=True)
            log_info("Garbage collection complete.")

        def cmd_list_generations():
            log_info("Listing system generations...")
            execute("nix-env -p /nix/var/nix/profiles/system --list-generations", use_doas=True)

        def cmd_edit_config():
            log_info(f"Opening config directory in Helix: {CONFIG_DIR}")
            subprocess.run(f"hx {CONFIG_DIR}", shell=True)

        def show_ui():
            menu = [
                ("󰑓  Rebuild", cmd_rebuild),
                ("󰑓  Rebuild (nh)", cmd_rebuild_nh),
                ("󰐊  Test", cmd_test),
                ("󰚰  Update", cmd_update),
                ("  Garbage Collection", cmd_garbage_collection),
                ("  List Generations", cmd_list_generations),
                ("  Edit Configuration", cmd_edit_config),
            ]
            choice = inquirer.select(
                message="Select action:",
                choices=[label for label, _ in menu],
                height=10,
            ).execute()
            for label, func in menu:
                if label == choice:
                    func()
                    break

        def main():
            os.system("clear")
            if len(sys.argv) < 2:
                show_ui()
                return
            cmd = sys.argv[1]
            commands = {
                "rebuild": cmd_rebuild,
                "rebuild-nh": cmd_rebuild_nh,
                "test": cmd_test,
                "update": cmd_update,
                "garbage-collection": cmd_garbage_collection,
                "list-generations": cmd_list_generations,
                "edit": cmd_edit_config,
            }
            func = commands.get(cmd)
            if func:
                func()
            else:
                log_error(f"Unknown command: {cmd}")
                sys.exit(1)

        if __name__ == "__main__":
            main()
      '';
in
{
  home.packages = [ nixos-toolbox ];
}

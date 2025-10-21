{ lib, pkgs, ... }:
let
  nixos-toolbox =
    pkgs.writers.writePython3Bin "nixos-toolbox"
      {
        doCheck = false;
        libraries = (
          p: [
            p.rich
            p.inquirerpy
          ]
        );
        makeWrapperArgs = [
          "--prefix"
          "PATH"
          ":"
          (lib.makeBinPath [
            pkgs.git
            pkgs.nix
            pkgs.nixos-rebuild
          ])
        ];
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

        def execute(cmd, use_sudo=False):
            full_cmd = f"sudo {cmd}" if use_sudo else cmd
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
            execute("nixos-rebuild switch --flake .", use_sudo=True)

        def cmd_test():
            log_info("Testing NixOS configuration...")
            os.chdir(CONFIG_DIR)
            execute("git add .")
            execute("nixos-rebuild test --flake .", use_sudo=True)

        def cmd_update():
            log_info("Updating flake inputs...")
            os.chdir(CONFIG_DIR)
            execute("nix flake update")

        def cmd_garbage_collection():
            log_info("Starting Nix garbage collection...")
            os.chdir(CONFIG_DIR)
            execute("nix-collect-garbage -d", use_sudo=True)
            execute("nix-collect-garbage -d")
            execute("nix-store --gc")
            execute("nix-store --optimise")
            log_info("Garbage collection complete.")

        def cmd_clean_boot():
            log_info("Cleaning boot menu...")
            execute("/run/current-system/bin/switch-to-configuration boot", use_sudo=True)

        def cmd_list_generations():
            log_info("Listing system generations...")
            execute("nix-env -p /nix/var/nix/profiles/system --list-generations", use_sudo=True)

        def cmd_optimise_store():
            log_info("Optimising Nix store...")
            execute("nix store optimise")
            log_info("Store optimisation complete.")

        def show_ui():
            menu = [
                ("󰑓  Rebuild", cmd_rebuild),
                ("󰐊  Test", cmd_test),
                ("󰚰  Update", cmd_update),
                ("󰘳  Garbage Collection", cmd_garbage_collection),
                ("󰍜  Clean Boot Menu", cmd_clean_boot),
                ("󰘳  List Generations", cmd_list_generations),
                ("󰢻  Optimise Store", cmd_optimise_store),
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
                "test": cmd_test,
                "update": cmd_update,
                "garbage-collection": cmd_garbage_collection,
                "clean-boot": cmd_clean_boot,
                "list-generations": cmd_list_generations,
                "optimise-store": cmd_optimise_store,
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

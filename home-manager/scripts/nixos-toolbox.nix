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
      }
      ''
        """NixOS configuration management utility."""

        import os
        import subprocess
        import sys

        from InquirerPy import inquirer
        from rich.console import Console

        console = Console()
        CONFIG_DIR = os.path.expanduser("~/.config/nixos")


        def log_info(msg: str) -> None:
            """Log an informational message."""
            console.print(f"[bold green][INFO][/bold green] {msg}")


        def log_warn(msg: str) -> None:
            """Log a warning message."""
            console.print(f"[bold yellow][WARN][/bold yellow] {msg}")


        def log_error(msg: str) -> None:
            """Log an error message."""
            console.print(f"[bold red][ERROR][/bold red] {msg}", file=sys.stderr)


        def execute(cmd: str, use_sudo: bool = False) -> None:
            """Execute a shell command with optional privilege escalation."""
            full_cmd = f"sudo {cmd}" if use_sudo else cmd
            log_info(f"Executing: {full_cmd}")
            try:
                subprocess.run(full_cmd, shell=True, check=True)
                log_info("Command completed successfully")
            except subprocess.CalledProcessError as e:
                log_error(f"Command failed with exit code {e.returncode}")
                sys.exit(e.returncode)

        def cmd_rebuild() -> None:
            """Rebuild NixOS configuration using nh."""
            log_info("Starting NixOS rebuild...")
            os.chdir(CONFIG_DIR)
            execute("${lib.getExe pkgs.git} add .")
            execute("${lib.getExe pkgs.nh} os switch")


        def cmd_test() -> None:
            """Test NixOS configuration without switching."""
            log_info("Testing NixOS configuration...")
            os.chdir(CONFIG_DIR)
            execute("${lib.getExe pkgs.git} add .")
            execute("${lib.getExe pkgs.nh} os test")


        def cmd_update() -> None:
            """Update flake inputs."""
            log_info("Updating flake inputs...")
            os.chdir(CONFIG_DIR)
            execute("${lib.getExe pkgs.nix} flake update")


        def cmd_rollback() -> None:
            """Rollback to the previous NixOS generation."""
            log_info("Rolling back to previous generation...")
            os.chdir(CONFIG_DIR)
            execute("${lib.getExe pkgs.nh} os rollback")


        def cmd_garbage_collection() -> None:
            """Perform Nix garbage collection."""
            log_info("Starting Nix garbage collection...")
            os.chdir(CONFIG_DIR)
            execute("${lib.getExe pkgs.nh} clean all")
            execute("${lib.getExe pkgs.nix} store optimise")
            execute("/run/current-system/bin/switch-to-configuration boot", use_sudo=True)
            log_info("Garbage collection complete.")


        def cmd_list_generations() -> None:
            """List system generations."""
            log_info("Listing system generations...")
            execute("${lib.getExe pkgs.nh} os info")


        def cmd_edit_config() -> None:
            """Open configuration directory in Helix editor."""
            log_info(f"Opening config directory in Helix: {CONFIG_DIR}")
            subprocess.run(f"${lib.getExe pkgs.helix} {CONFIG_DIR}", shell=True)


        def cmd_enter_bios() -> None:
            """Reboot into UEFI/BIOS firmware settings."""
            log_warn("System will reboot into UEFI/BIOS settings...")
            confirm = inquirer.confirm(
                message="Are you sure you want to reboot into BIOS?",
                default=False,
            ).execute()
            
            if confirm:
                log_info("Rebooting into firmware setup...")
                execute("${lib.getExe' pkgs.systemd "systemctl"} reboot --firmware-setup", use_sudo=True)
            else:
                log_info("BIOS reboot cancelled.")


        def show_ui() -> None:
            """Display interactive menu."""
            menu = [
                ("󱌢 Rebuild", cmd_rebuild),
                ("󰙨 Test", cmd_test),
                ("󰚰 Update", cmd_update),
                ("󰑓 Rollback", cmd_rollback),
                (" Garbage Collection", cmd_garbage_collection),
                (" List Generations", cmd_list_generations),
                (" Edit Configuration", cmd_edit_config),
                (" Enter BIOS", cmd_enter_bios),
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


        def main() -> None:
            """Main entry point."""
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
                "list-generations": cmd_list_generations,
                "edit": cmd_edit_config,
                "bios": cmd_enter_bios,
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

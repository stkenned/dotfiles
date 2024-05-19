# dotfiles

System management using Nix Flakes and Home Manager (as a module).

### MacOS

Uses nix, nix-darwin, and home-manager to manage system configuration and dotfiles.

To bootstrap, first install Nix using https://zero-to-nix.com/start/install.

On first run you have to use: `$ nix run nix-darwin -- switch --flake .#MacBook`

After that you can simply: `$ darwin-rebuild switch --flake .#MacBook`

### NixOS

First, copy `/etc/nixos/hardware-configuration.nix` to a device subfolders (eg `rpi`).

Then you can run: `$ nixos-rebuild switch --flake .#nixos`

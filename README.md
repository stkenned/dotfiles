# dotfiles

Uses nix, nix-darwin, and home-manager to manage system configuration and dotfiles.

To bootstrap, first install Nix using https://zero-to-nix.com/start/install.

On first run you have to use: `$ nix run nix-darwin -- switch --flake .#MacBook`

After that you can simply: `$ darwin-rebuild switch --flake .#MacBook`

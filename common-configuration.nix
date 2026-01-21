{ pkgs, ... }:

{
  nixpkgs.config = {
    allowUnfree = true;
    allowUnsupportedSystem = true;
  };

  environment.systemPackages = with pkgs; [
    git
    neovim
    tailscale
  ];

  # Allow Determinate to manage Nix
  nix.enable = false;

  # Use flakes to manage configs
  nix.settings.experimental-features = "nix-command flakes";

  # Enable tailscaled
  services.tailscale.enable = true;

  # Also set in ./home/zsh.nix but this prevents warnings
  programs.zsh.enable = true;
}

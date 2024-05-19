{ pkgs, ... }:

{
  nixpkgs.config = {
    allowUnfree = true;
    allowUnsupportedSystem = true;
  };

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages =
    [
      pkgs.git
      pkgs.tailscale
      pkgs.vim
    ];

  # Use flakes to manage configs
  nix.settings.experimental-features = "nix-command flakes";

  # With rosetta installed, can run Intel binaries
  nix.extraOptions = ''
    extra-platforms = x86_64-darwin aarch64-darwin
  '';

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;

  services.tailscale.enable = true;

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true;

  # MacOS specific
  system.defaults = {
    dock.autohide = true;
    screencapture.location = "~/Screenshots";
  };

  # sudo with touch ID
  security.pam.enableSudoTouchIdAuth = true;

  # Set Git commit hash for darwin-version.
  # TODO: pass self properly
  #system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  users.users.scott = {
    name = "scott";
    home = "/Users/scott";
    shell = pkgs.zsh;
  }; 
}

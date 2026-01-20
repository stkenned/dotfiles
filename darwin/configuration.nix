{ pkgs, ... }:

{
  users.users.scott = {
    name = "scott";
    home = "/Users/scott";
    shell = pkgs.zsh;
  }; 
  
  # With rosetta installed, can run Intel binaries
  nix.extraOptions = ''
    extra-platforms = x86_64-darwin aarch64-darwin
  '';

  # MacOS specific
  system.defaults = {
    dock.autohide = true;
    screencapture.location = "~/Screenshots";
  };

  # Required to use above system.defaults options
  system.primaryUser = "scott";

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
}

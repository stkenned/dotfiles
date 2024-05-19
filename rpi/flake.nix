{
  description = "NixOS system flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }:  
  {
    # Build flake using:
    # $ nixos-rebuild switch --flake .#nixos
    nixosConfigurations."nixos" = nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";
      modules = [
        ./configuration.nix
	home-manager.nixosModules.home-manager
	{
          home-manager.useGlobalPkgs = true;
	  home-manager.useUserPackages = true;
	  home-manager.users.scott = import ../home.nix;
	}
      ];
    };

    # Expose the package set, including overlays, for convenience.
    nixosPackages = self.nixosConfigurations."nixos".pkgs;
  };
}

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan. Do not edit that file.
      /etc/nixos/hardware-configuration.nix
    ];

  # Use flakes to manage configs
  nix.settings.experimental-features = "nix-command flakes";

  nixpkgs.config = {
    allowUnfree = true;
    allowUnsupportedSystem = true;
  };

  # Auto update
  system.autoUpgrade = {
    enable = true;
    allowReboot = true;
  };

  # Use the extlinux boot loader. (NixOS wants to enable GRUB by default)
  boot.loader.grub.enable = false;
  # Enables the generation of /boot/extlinux/extlinux.conf
  boot.loader.generic-extlinux-compatible.enable = true;

  networking = {
    hostName = "nixos";
    #wireless = {
    #  enable = true;
    #  networks."ENTER NETWORK NAME".psk = "ENTER PASSWORD";
    #  interfaces = [ "wlan0" ];
    #};
  };

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    neovim
    tmux
    vim
  ];

  environment.sessionVariables = {
    EDITOR = "nvim";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    mutableUsers = true;
    users.scott = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      shell = pkgs.zsh;
      packages = with pkgs; [
        fzf
        git
        jq
        ripgrep
        tailscale
      ];
    };
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;

    ohMyZsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "git"
        "sudo"
      ];
    };
  };

  # List services that you want to enable:

  services.tailscale = {
    enable = true;
    useRoutingFeatures = "both";
  };

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    settings.PermitRootLogin = "yes";
  };

  networking.firewall = {
    # enable the firewall
    enable = true;

    # always allow traffic from your Tailscale network
    trustedInterfaces = [ "tailscale0" ];

    # allow the Tailscale UDP port through the firewall
    allowedUDPPorts = [ config.services.tailscale.port ];

    # allow SSH
    allowedTCPPorts = [ 22 ];
  };

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}


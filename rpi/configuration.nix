{ config, pkgs, ... }:

{
  imports = [
      # Include the results of the hardware scan. Do not edit that file.
      ./hardware-configuration.nix
  ];

  environment.sessionVariables = {
    EDITOR = "nvim";
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

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    mutableUsers = true;
    users.scott = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      shell = pkgs.zsh;
    };
  };

  # Networking setup (SSH + Tailscale w/exit node)

  networking = {
    hostName = "nixos";
    #wireless = {
    #  enable = true;
    #  networks."ENTER NETWORK NAME".psk = "ENTER PASSWORD";
    #  interfaces = [ "wlan0" ];
    #};
  };

  # Allow being an exit node
  services.tailscale.useRoutingFeatures = "both";

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

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}


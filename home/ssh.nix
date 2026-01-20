{ config, lib, pkgs, ... }:

{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "github.com" = {
        extraOptions = {
          AddKeysToAgent = "yes";
          IdentityFile = "~/.ssh/id_ed25519";
          UseKeychain = "yes";
        };
      };
    };
  };
}

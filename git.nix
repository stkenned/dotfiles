{ config, lib, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Scott Kennedy";
    userEmail = "stkenned@gmail.com";
    extraConfig = {
      push = {
        default = "current";
        autoSetupRemote = true;
      };
      merge = {
        conflictstyle = "diff3";
      };
    };
  };
}

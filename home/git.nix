{ config, lib, pkgs, ... }:

{
  programs.git = {
    enable = true;
    user = {
      name = "Scott Kennedy";
      email = "stkenned@gmail.com";
    };
    settings = {
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

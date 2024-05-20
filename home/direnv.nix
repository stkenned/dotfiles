{ ... }:

{
  programs.direnv = {
    enable = true;
    enableFlakes = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };
}

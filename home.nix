{ pkgs, ... }: {
  programs.home-manager.enable = true;
  programs.zsh.enable = true;

  imports = [
    ./home/git.nix
    ./home/tmux.nix
    ./home/zsh.nix
  ];

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  home.packages = [
    pkgs.fzf
    pkgs.gh
    pkgs.git
    (pkgs.google-cloud-sdk.withExtraComponents [ pkgs.google-cloud-sdk.components.gke-gcloud-auth-plugin ])
    pkgs.jq
    pkgs.neovim
    pkgs.nixpkgs-fmt
    pkgs.python3
    pkgs.ripgrep
    pkgs.terraform
    pkgs.tmux
    pkgs.vim
    pkgs.wget
    pkgs.xz
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.
}

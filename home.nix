{ pkgs, ... }: {
  programs.home-manager.enable = true;
  programs.zsh.enable = true;

  imports = [
    ./home/git.nix
    ./home/tmux.nix
    ./home/zsh.nix
  ];

  home.packages = [
    pkgs.git
    pkgs.neovim
    pkgs.tmux
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

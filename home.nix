{ pkgs, ... }: {
  programs.home-manager.enable = true;
  programs.zsh.enable = true;

  imports = [
    ./home/direnv.nix
    ./home/git.nix
    ./home/neovim.nix
    ./home/ssh.nix
    ./home/tmux.nix
    ./home/zsh.nix
  ];

  home.packages = [
    pkgs.claude-code
    pkgs.fzf
    pkgs.gh
    pkgs.git
    (pkgs.google-cloud-sdk.withExtraComponents [ pkgs.google-cloud-sdk.components.gke-gcloud-auth-plugin ])
    pkgs.jq
    # Installed in import above to bundle plugins
    #pkgs.neovim
    pkgs.nixpkgs-fmt
    pkgs.nodejs_20
    pkgs.nodePackages.pnpm
    pkgs.nodePackages.prettier
    pkgs.python3
    pkgs.ripgrep
    pkgs.tmux
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

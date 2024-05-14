{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    vimAlias = true;

    extraConfig = (builtins.readFile ./init.vim);

    plugins = with pkgs.vimPlugins; [
      edge

      (nvim-treesitter.withAllGrammars)

      coc-nvim
      plenary-nvim
      popup-nvim
      telescope-nvim
      telescope-fzf-writer-nvim
      vim-fugitive
      vim-gitgutter
    ];
  };
}

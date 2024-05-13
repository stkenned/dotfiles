{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;

    escapeTime = 10;
    prefix = "C-a";

    extraConfig = ''
      set -g mouse on

      # vim like pane controls
      bind v split-window -h
      bind s split-window -v
      unbind '"'
      unbind %
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      # nvim recommendations
      set-option -g focus-events on
      set-option -g default-terminal "screen-256color"
      set-option -sa terminal-overrides ',xterm-256color:RGB'
    '';
  };
}

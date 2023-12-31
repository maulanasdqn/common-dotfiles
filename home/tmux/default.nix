{ pkgs, ... }: {

  programs.tmux.enable = true;
  programs.tmux.clock24 = true;
  programs.tmux.plugins = with pkgs.tmuxPlugins; [
    sensible
    yank
    {
      plugin = yank;
      extraConfig = ''
        set -g status-style 'bg=#333333 fg=#5eacd3'
        set -g default-terminal "xterm-256color"
        set -g mouse on
      '';
    }
  ];

}

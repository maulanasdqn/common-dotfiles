{ pkgs, ... }: {

  programs.tmux.enable = true;
  programs.tmux.clock24 = true;
  programs.tmux.plugins = with pkgs.tmuxPlugins; [
    sensible
    yank
    {
      plugin = yank;
      extraConfig = ''
        set -g default-terminal "xterm-256color"
        set -g mouse on
      '';
    }
  ];

}

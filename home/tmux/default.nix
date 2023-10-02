{ pkgs, ... }: {

  programs.tmux.enable = true;
  programs.tmux.clock24 = true;
  programs.tmux.plugins = with pkgs.tmuxPlugins; [
    sensible
    yank
    {
      plugin = dracula;
      extraConfig = ''
        	set -g @dracula-show-battery true
        	set -g @dracula-show-powerline false
          set -g @dracula-refresh-rate 10
          set -g mouse on
      '';
    }
  ];

}

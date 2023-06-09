{ config, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "intheloop";
    };
    initExtra = ''
      export PATH=~/.npm-packages/bin:$PATH
      export PATH=~/.grader/bin:$PATH
      export NODE_PATH=~/.npm-packages/lib/node_modules
      export XKB_DEFAULT_OPTIONS=caps:escape
      export PATH="$HOME/.local/bin:$PATH"
      export FLYCTL_INSTALL="/home/ms/.fly"
      export PATH="$FLYCTL_INSTALL/bin:$PATH"
      source ~/.config/dotfiles/home/zsh/z.sh
      eval "$(starship init zsh)"
    '';
    shellAliases = {
      update = "nix flake update ~/.config/dotfiles";
      build =
        "nix run ~/.config/dotfiles switch -- --flake ~/.config/dotfiles --impure";
      clean = "sudo nix-collect-garbage -d";
      ls = "lsd";
      lsa = "lsd -a";
      ll = "lsd -l";
      c = "clear";
      v = "nvim";
      t = "tmux";
    };
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
  };
}

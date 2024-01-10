{ config, ... }: {

  programs.zsh.enable = true;
  programs.zsh.enableCompletion = true;
  programs.zsh.enableAutosuggestions = true;
  programs.zsh.syntaxHighlighting.enable = true;
  programs.zsh.oh-my-zsh.enable = true;
  programs.zsh.oh-my-zsh.plugins = [ "git" "ant" ];
  programs.zsh.oh-my-zsh.theme = "intheloop";

  programs.zsh.initExtra = ''
    export PATH=~/.npm-packages/bin:$PATH
    export PATH=~/.grader/bin:$PATH
    export PATH=~/.local/share/gem/ruby/bin:$PATH
    export PATH=~/.nix-profile/bin:/nix/var/nix/profiles/default/bin:$PATH
    export NODE_PATH=~/.npm-packages/lib/node_modules
    export XKB_DEFAULT_OPTIONS=caps:escape
    export PATH="$HOME/.local/bin:$PATH"
    export NIX_REMOTE=daemon
    export NIX_PATH=nixpkgs=/nix/var/nix/profiles/per-user/$USER/channels/nixpkgs:/nix/var/nix/profiles/per-user/$USER/channels
    export NIX_PROFILES=/nix/var/nix/profiles/per-user/$USER/channels
    export NODE_OPTIONS=--max_old_space_size=4096        
    source ~/.config/dotfiles/home/zsh/z.sh
  '';

  programs.zsh.shellAliases.u = "nix flake update ~/.config/dotfiles";
  programs.zsh.shellAliases.b =
    "nix run ~/.config/dotfiles switch -- --flake ~/.config/dotfiles --impure";
  programs.zsh.shellAliases.clean = "sudo nix-collect-garbage -d";
  programs.zsh.shellAliases.ls = "eza";
  programs.zsh.shellAliases.lsa = "eza -a";
  programs.zsh.shellAliases.ll = "eza -l";
  programs.zsh.shellAliases.c = "clear";
  programs.zsh.shellAliases.v = "nvim";
  programs.zsh.shellAliases.t = "tmux";

  programs.zsh.history = {
    size = 10000;
    path = "${config.xdg.dataHome}/zsh/history";
  };

}

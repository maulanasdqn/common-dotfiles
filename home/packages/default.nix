{ pkgs, ... }:

{
  home.packages = with pkgs; [
    docker
    neofetch
    android-tools
    unzip
    wget
    unrar
    lsd
    htop
    bat
    luajit
    jq
    bun
    slack
    iterm2
    flameshot
    prettierd
    zoom-us
  ];
}

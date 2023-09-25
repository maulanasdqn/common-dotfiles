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
    postman
    discord
    slack
    prettierd
    zoom-us
    google-chrome
  ];
}

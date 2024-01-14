{ pkgs, ... }:

{
  home.packages = with pkgs; [
    neofetch
    android-tools
    unzip
    wget
    unrar
    eza
    htop
    bat
    luajit
    nodejs
    nodePackages.pnpm
    nodePackages.yarn
    bun
    jq
    grimblast
    telegram-desktop
    chromium
    rofi
    fpm
  ];
}

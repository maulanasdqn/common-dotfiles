{ pkgs, ... }:

{
  home.file.".config/wofi.css".source = ./wofi.css;
  home.packages = with pkgs; [ wofi ];
}

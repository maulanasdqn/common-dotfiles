{
  programs.homebrew.enable = true;
  programs.homebrew.onActivation.cleanup = "zap";
  programs.homebrew.global.brewfile = true;
  programs.homebrew.casks = [ "firefox" "google-chrome" "raycast" ];
}

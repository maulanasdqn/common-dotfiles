{

  programs.homebrew.enable = true;
  programs.homebrew.onActivation.cleanup = "zap";
  programs.homebrew.global.brewfile = true;

  programs.homebrew.masApps = {
    Vimari = 1480933944;
    WhatsApp = 1147396723;
    "SpeakerAmp:Booster & Equalizer" = 1496955576;
  };

  programs.homebrew.casks = [ "firefox" "google-chrome" "raycast" ];

}

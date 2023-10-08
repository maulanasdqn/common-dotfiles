{ lib, pkgs, ... }: {
  services.nix-daemon.enable = true;
  security.pam.enableSudoTouchIdAuth = false;
  system.defaults.dock.autohide = true;
  system.defaults.dock.mru-spaces = false;
  system.defaults.dock.showhidden = true;
  system.defaults.NSGlobalDomain.AppleKeyboardUIMode = 3;
  system.defaults.finder.AppleShowAllExtensions = true;
  system.defaults.finder.QuitMenuItem = true;
  system.defaults.finder.FXEnableExtensionChangeWarning = false;
  system.defaults.trackpad.Clicking = true;
  system.defaults.trackpad.TrackpadThreeFingerDrag = false;

  nix = {
    configureBuildUsers = true;
    settings = {
      auto-optimise-store = true;
      trusted-users = [ "@admin" "maulanasodiqin" ];
      substituters = [
        "https://cache.komunix.org"
        "https://nix-community.cachix.org"
        "https://r17.cachix.org/"
        "https://efishery.cachix.org"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "r17.cachix.org-1:vz0nG6BCbdgTPn7SEiOwe/3QwvjH1sb/VV9WLcBtkAY="
        "efishery.cachix.org-1:ix7pi358GsGkH7oBTmKGkVj42yBcjxRPi6IQ9AbRc0o="
      ];
    };

    gc = {
      automatic = true;
      options = "--delete-older-than 30d";
    };

    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs = true
      keep-derivations = true
    '' + lib.optionalString (pkgs.system == "aarch64-darwin") ''
      extra-platforms = x86_64-darwin aarch64-darwin
    '';
  };

  system = {
    stateVersion = 4;
    keyboard.enableKeyMapping = true;
    keyboard.remapCapsLockToEscape = true;
  };
}

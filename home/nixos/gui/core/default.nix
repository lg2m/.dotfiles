{ pkgs, ... }: let
  catppuccin-rofi = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "rofi";
    rev = "5350da41a11814f950c3354f090b90d4674a95ce";
    sha256 = "sha256-DNorfyl3C4RBclF2KDgwvQQwixpTwSRu7fIvihPN8JY=";
  };
in {
  imports = [
    ./media.nix
    ./xdg.nix
    ./i3
 ];

  # Home
  home.file.".background-image".source = ../../../../config/background-image;
  home.file.".config/rofi/catppuccin-macchiato.rasi".source = catppuccin-rofi + "/basic/.local/share/rofi/themes/catppuccin-macchiato.rasi";
  
  # Programs
  programs.autorandr = {
    enable = true;
    profiles = {
      default = {
        config = {
          "DP-3" = {
            enable = true;
            dpi = 96;
            mode = "1920x1080";
            primary = true;
            rate = "120";
            position = "0x0";
          };
          "DP-2" = {
            enable = true;
            dpi = 96; # Adjust the DPI to your preference
            mode = "1920x1080";
            primary = false;
            rate = "144";
            position = "1920x0"; # DP-2 is on the right, starts right after the width of DP-3
          };
        };
        fingerprint = {
          "DP-3" = "--CONNECTED-BUT-EDID-UNAVAILABLE--DP-3";
          "DP-2" = "--CONNECTED-BUT-EDID-UNAVAILABLE--DP-2";
        };
      };
    };
  };
  
  programs.rofi = {
    enable = true;
    extraConfig = {
      disable-history = false;
      display-Network = " 󰤨  Network";
      display-drun = "   Apps ";
      display-run = "   Run ";
      display-window = " 﩯  Window";
      drun-display-format = "{icon} {name}";
      hide-scrollbar = true;
      icon-theme = "Oranchelo";
      location = 0;
      modi = "run,drun,window";
      show-icons = true;
      sidebar-mode = true;
      terminal = "alacritty";
    };
    theme = "catppuccin-macchiato";
  };

  # Services
  services.autorandr.enable = true;
}

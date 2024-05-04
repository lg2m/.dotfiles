let
  font = "JetBrainsMono Nerd Font";
in
{
  programs.alacritty = {
    enable = true;
    settings = {
      shell = {
        program = "/bin/sh";
        args = ["-l" "-c" "zellij attach POGGIES 2> /dev/null || zellij -s POGGIES"];
      };
      cursor = {
        style = "Block";
        unfocused_hollow = true;
      };
      window = {
        decorations = "full";
        opacity = 0.80;
        dynamic_padding = true;
        padding = {
          x = 10;
          y = 10;
        };
      };
      scrolling = {
        history = 2500;
        multiplier = 3;
      };
      selection = {
        save_to_clipboard = false;
        semantic_escape_chars = ",│`|:\"' ()[]{}<>\t";
      };
      font = {
        normal.family = font;
        bold.family = font;
        italic.family = font;
        size = 11;
      };
      colors = {
        primary = {
          background = "#1a1b26";
          foreground = "#a9b1d6";
        };
        normal = {
          black = "#32344a";
          red = "#f7768e";
          green = "#9ece6a";
          yellow = "#e0af68";
          blue = "#7aa2f7";
          magenta = "#ad8ee6";
          cyan = "#449dab";
          white = "#787c99";
        };
        bright = {
          black = "#444b6a";
          red = "#ff7a93";
          green = "#b9f27c";
          yellow = "#ff9e64";
          blue = "#7da6ff";
          magenta = "#bb9af7";
          cyan = "#0db9d7";
          white = "#acb0d0";
        };
      };
    };
  };
}

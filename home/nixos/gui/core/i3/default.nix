{ pkgs, ... }:
let
  modifier = "Mod4";
  workspace = {
    terminal = "terminal"; # 1
    code = "code"; # 2
    three = "three"; # 3
    four = "four"; # 4
    five = "five"; # 5
    music = "music"; # 6
    chat = "chat"; # 7
    eight = "eight"; # 8
    nine = "nine"; # 9
    browser = "browser"; # 0
  };
in {
  xsession = {
    enable = true;
    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
      config = {
        inherit modifier;

        bars = [ ];

        window = {
          border = 0;
          hideEdgeBorders = "none";

          commands = [
            # Bind spotify workspace.
            # This is a workaround for spotify not working with "assigns".
            {
              command = "move to workspace ${workspace.music}";
              criteria = { class = "Spotify"; };
            }
          ];
        };

        gaps = {
          inner = 10;
          outer = 5;
        };

        keybindings = {
          "${modifier}+Return" = "exec ${pkgs.alacritty}/bin/alacritty";
          "${modifier}+Shift+q" = "kill";

          "${modifier}+d" =
            "exec --no-startup-id ${pkgs.rofi}/bin/rofi -modi drun -show drun";

          "${modifier}+h" = "focus left";
          "${modifier}+j" = "focus down";
          "${modifier}+k" = "focus up";
          "${modifier}+l" = "focus right";

          "${modifier}+Shift+h" = "move left";
          "${modifier}+Shift+j" = "move down";
          "${modifier}+Shift+k" = "move up";
          "${modifier}+Shift+l" = "move right";

          "${modifier}+b" = "split h; exec notify-send 'Tile Horizontally'";
          "${modifier}+v" = "split v; exec notify-send 'Tile Vertically'";
          "${modifier}+f" = "fullscreen toggle";

          "${modifier}+s" = "layout stacking";
          "${modifier}+w" = "layout tabbed";
          "${modifier}+e" = "layout toggle split";

          "${modifier}+Shift+space" = "floating toggle";
          "${modifier}+space" = "focus mode_toggle";

          "${modifier}+a" = "focus parent";

          "${modifier}+Shift+minus" = "move scratchpad";
          "${modifier}+minus" = "scratchpad show";

          "${modifier}+Shift+s" = "exec ${pkgs.flameshot}/bin/flameshot gui -c";
          "${modifier}+Shift+a" = "exec ${pkgs.flameshot}/bin/flameshot gui";

          "${modifier}+1" = "workspace ${workspace.terminal}";
          "${modifier}+2" = "workspace ${workspace.code}";
          "${modifier}+3" = "workspace ${workspace.three}";
          "${modifier}+4" = "workspace ${workspace.four}";
          "${modifier}+5" = "workspace ${workspace.five}";
          "${modifier}+6" = "workspace ${workspace.music}";
          "${modifier}+7" = "workspace ${workspace.chat}";
          "${modifier}+8" = "workspace ${workspace.eight}";
          "${modifier}+9" = "workspace ${workspace.nine}";
          "${modifier}+0" = "workspace ${workspace.browser}";

          "${modifier}+Shift+1" =
            "move container to workspace ${workspace.terminal}";
          "${modifier}+Shift+2" =
            "move container to workspace ${workspace.code}";
          "${modifier}+Shift+3" =
            "move container to workspace ${workspace.three}";
          "${modifier}+Shift+4" =
            "move container to workspace ${workspace.four}";
          "${modifier}+Shift+5" =
            "move container to workspace ${workspace.five}";
          "${modifier}+Shift+6" =
            "move container to workspace ${workspace.music}";
          "${modifier}+Shift+7" =
            "move container to workspace ${workspace.chat}";
          "${modifier}+Shift+8" =
            "move container to workspace ${workspace.eight}";
          "${modifier}+Shift+9" =
            "move container to workspace ${workspace.nine}";
          "${modifier}+Shift+0" =
            "move container to workspace ${workspace.browser}";

          "${modifier}+Shift+c" = "reload";
          "${modifier}+Shift+r" = "restart";
          "${modifier}+Shift+e" =
            "exec i3-nagbar -t warning -m 'Do you want to exit i3?' -b 'Yes' 'i3-msg exit'";

          "${modifier}+r" = "mode resize";
        };

        assigns = {
          ${workspace.terminal} = [{ class = "Alacritty"; }];
          ${workspace.code} = [{ class = "Code"; }];
          ${workspace.browser} = [{ class = "firefox"; }];
          ${workspace.chat} = [ { class = "discord"; } { class = "Slack"; } ];
          ${workspace.music} = [{ class = "Spotify"; }];
        };

        startup = [
          {
            command = "${pkgs.feh}/bin/feh --bg-fill ~/.background-image";
            always = true;
            notification = false;
          }
          {
            command = "systemctl --user restart polybar.service";
            always = true;
            notification = false;
          }
          {
            command = "${pkgs.xbanish}/bin/xbanish";
            always = true;
            notification = false;
          }
          {
            command = "${pkgs.firefox}/bin/firefox";
            always = false;
            notification = false;
          }
          {
            command = "${pkgs.spotify}/bin/spotify";
            always = false;
            notification = false;
          }
          {
            command = "${pkgs.i3}/bin/i3-msg workspace ${workspace.terminal}";
            always = false;
            notification = false;
          }
          {
            command = "${pkgs.alacritty}/bin/alacritty";
            always = false;
            notification = false;
          }
        ];
      };
      extraConfig = ''
        default_border none
        default_floating_border none
      '';
    };
  };

  services.polybar = {
    enable = true;
    config = ./config.ini;
    package = pkgs.polybar.override {
      i3Support = true;
      alsaSupport = true;
      pulseSupport = true;
    };
    script = "polybar &";
    extraConfig = (builtins.readFile ./modules.ini);
  };
}

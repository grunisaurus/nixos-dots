{
  config,
  pkgs,
  inputs,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      monitor = [
                "eDP-1, 1920x1080@60, 0x0, 1"
                "HDMI-A-1, 3440x1440@60, 1920x0, 1"
        ];
        general = {
          gaps_out = 10;
          gaps_in = 2;
        };

      animation = [
                  "global, 1, 2, default"

                ];

      exec-once = [
        "waybar"
        "hyprpaper"
        "hyprsunset"
      ];

      input = {
        kb_layout = "de,us";
        kb_options = "grp:win_space_toggle";
        follow_mouse = 1;

        touchpad = {
          natural_scroll = true;
          disable_while_typing = false;
        };
      };

      decoration = {
        rounding = 10;
      };

      bind = [
        "SUPER,M,exit"
        "SUPERSHIFT,X,killactive"
        "SUPER,A,exec,fuzzel"
        "SUPER,F,exec,librewolf"
        "SUPER,Q,exec,ghostty"
        "SUPER,L,exec,hyprlock"
        ",F2,exec,brightnessctl s 10%-"
        ",F3,exec,brightnessctl s +10%"
        ",F6,exec,amixer set Master toggle"
        ",F7,exec,amixer set Master 10%-"
        ",F8,exec,amixer set Master 10%+"
        "SUPER,V,togglefloating"
        "SUPER,mouse:272,movewindow"
        "SUPER,S,exec,hyprshot -m window -m active -o ~/screenshots/"
        "SUPERSHIFT,S,exec,hyprshot -m region -m active -o ~/screenshots/"
        "SUPER,B,exec,hyprctl hyprsunset temperature 2800"
        "SUPERSHIFT,B,exec,hyprctl hyprsunset identity"

        "SUPER,1,workspace,1"
        "SUPER,2,workspace,2"
        "SUPER,3,workspace,3"
        "SUPER,4,workspace,4"
        "SUPER,5,workspace,5"
        "SUPER,6,workspace,6"
        "SUPER,7,workspace,7"
        "SUPER,8,workspace,8"
        "SUPER,9,workspace,9"
        "SUPER,0,workspace,10"

        "SUPERSHIFT,1,movetoworkspace,1"
        "SUPERSHIFT,2,movetoworkspace,2"
        "SUPERSHIFT,3,movetoworkspace,3"
        "SUPERSHIFT,4,movetoworkspace,4"
        "SUPERSHIFT,5,movetoworkspace,5"
        "SUPERSHIFT,6,movetoworkspace,6"
        "SUPERSHIFT,7,movetoworkspace,7"
        "SUPERSHIFT,8,movetoworkspace,8"
        "SUPERSHIFT,9,movetoworkspace,9"
        "SUPERSHIFT,0,movetoworkspace,10"
      ];
      bindl = [
                '',switch:on:Lid Switch,exec,hyprctl keyword monitor "eDP-1, disable"''
                '',switch:off:Lid Switch,exec, hyprctl keyword monitor "eDP-1, 1920x1080, 0x0, 1"''
        ];

      windowrule= [
        "opacity 0.8 override 0.8 override,match:class kitty"
        "opacity 0.8 override 0.8 override,match:class ghostty"
        "opacity 0.8 override 0.8 override,match:class discord"
      ];
    };
  };
}

{
  pkgs,
  lib,
  config,
  ...
}:

let
  startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
    	waybar &
    	swww-daemon &
    	swww img ./background.gif &
    	'';
in
{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      "$mod" = "SUPER";
      exec-once = [
        ''${startupScript}/bin/start''
      ];

      general = {
        gaps_in = 5;
        gaps_out = 10;

        border_size = 2;

        "col.active_border" = "rgb(c6a0f6) rgb(7dc4e4) 45deg";
        "col.inactive_border" = "rgba(595959aa)";

      };

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
      };

      decoration = {
        rounding = 10;
        inactive_opacity = 0.6;
        active_opacity = 0.8;
        blur = {
          enabled = true;
          size = 10;
        };
      };

      binde = [
        "$mod SHIFT, right, resizeactive, 10 0"
        "$mod SHIFT, left, resizeactive, -10 0"
        "$mod SHIFT, up, resizeactive, 0 -10"
        "$mod SHIFT, down, resizeactive, 0 10"
      ];

      binded = [
        "$mod SHIFT CTRL, left, Move activewindow left, exec, hyprctl dispatch movewindow l"
        "$mod SHIFT CTRL, right, Move activewindow right, exec, hyprctl dispatch movewindow r"
        "$mod SHIFT CTRL, up, Move activewindow up, exec, hyprctl dispatch movewindow u"
        "$mod SHIFT CTRL, down, Move activewindow down, exec, hyprctl dispatch movewindow d"
      ];

      bind =
        [
          # Program shortcut
          "$mod, T, exec, kitty"
          "$mod, F, exec, firefox"
          "$mod, D, exec, discord"
          "$mod, W, exec, wasistlos"
          "$mod, C, exec, code"
          "$mod, A, exec, pkill wofi || wofi --conf /home/kirantiloh/.dotfiles/config/wofi/config/config --style /home/kirantiloh/.dotfiles/config/wofi/src/macchiato/style.css --sort-order=alphabetical -S drun"
          "$mod, Print, exec, grim -g \"$(slurp)\" - | swappy -f -"

          "CTRL ALT, W, exec, pkill waybar || waybar"
          ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ -l 1 5%+"
          ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ -l 1 5%-"
          ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
          ",XF86MonBrightnessDown, exec, brightnessctl set 5%-"
          ",XF86MonBrightnessUp, exec, brightnessctl set 5%+"
          "$mod_ALT, F4, exec, shutdown -h now"

          "CTRL ALT, Delete, exec, hyprctl dispatch exit"
          "$mod, Q, killactive"
          "ALT, Tab, cyclenext,"

          "$mod, left, movefocus, l"
          "$mod, right, movefocus, r"
          "$mod, up, movefocus, u"
          "$mod, down, movefocus, d"
        ]
        ++ (builtins.concatLists (
          builtins.genList (
            i:
            let
              ws = i + 1;
            in
            [
              "$mod, code:1${toString i}, workspace, ${toString ws}"
              "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            ]
          ) 9
        ));
    };
  };
}

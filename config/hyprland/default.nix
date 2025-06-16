{ pkgs, lib, config, ...}:

let
  startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
	waybar &
	swww init &
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
			inactive_opacity = 0.7;
			blur = {
				enabled = true;
				size = 10;
			};
		};

		bind = [
			# Program shortcut
			"$mod, T, exec, kitty"
			"$mod, F, exec, firefox"
			"$mod, D, exec, discord"
			"$mod, W, exec, wasistlos"
			"$mod, A, exec, pkill wofi || wofi --conf ./wofi/config/config --style ./wofi/src/macchiato/style.css -S drun --sort-order=alphabetical"
			"$mod, Print, exec, grim -g \"$(slurp)\" - | swappy -f -"

			"CTRL ALT, W, exec, pkill waybar || waybar"
			", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ -l 1 5%+"
			", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ -l 1 5%-"
			", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
			"$mod ALT, F4, exec, shutdown -h now"

			"CTRL ALT, Delete, exec, hyprctl dispatch exit"
			"$mod, Q, killactive"
			"ALT, Tab, cyclenext,"

			"$mod, left, movefocus, l"
			"$mod, right, movefocus, r"
			"$mod, up, movefocus, u"
			"$mod, down, movefocus, d"
		]
		++ (
		builtins.concatLists (builtins.genList (i:
			let ws = i + 1;
			in [
				"$mod, code:1${toString i}, workspace, ${toString ws}"
				"$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
			]
			) 9)
		);
	};			
	};			
}

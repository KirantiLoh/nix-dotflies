{ pkgs, config, lib, ... }:

{
  # …

  services.dunst = {
    enable = true;
    settings = {
      global = {
        browser = "${config.programs.firefox.package}/bin/firefox -new-tab";
        dmenu = "${pkgs.wofi}/bin/wofi -drun";
        follow = "mouse";
	font = "Jetbrains Mono Font 10";
	font_size = 12;
        format = "<b>%s</b>\\n%b";
        frame_width = 2;
        geometry = "500x5-5+30";
        horizontal_padding = 8;
        icon_position = "off";
        line_height = 0;
        markup = "full";
        padding = 10;
        separator_color = "frame";
        separator_height = 5;
        transparency = 10;
        word_wrap = true;
	corner_radius = 10;
	offset = "30x30";
      };

      urgency_low = {
        background = "#24273a";
        foreground = "#cad3f5";
        frame_color = "#a6da95";
        timeout = 10;
      };

      urgency_normal = {
        background = "#24273a";
        foreground = "#cad3f5";
        frame_color = "#7dc4e4";
        timeout = 15;
      };

      urgency_critical = {
        background = "#24273a";
        foreground = "#dd5633";
        frame_color = "#ed8796";
        timeout = 0;
      };
    };
  };

  # …
}

{
  programs.kitty = {
      enable = true;
      font = {
        name = "JetBrainsMono Nerd Font";
        size = 10;
      };
      settings = {
        window_padding_width=5;
        confirm_os_window_close="-1";
	opacity=0;
      };

      shellIntegration.enableZshIntegration = true;
      
      themeFile = "Catppuccin-Macchiato";
      #Also available: Catppuccin-Frappe Catppuccin-Latte Catppuccin-Macchiato Catppuccin-Mocha
      # See all available kitty themes at: https://github.com/kovidgoyal/kitty-themes/blob/46d9dfe230f315a6a0c62f4687f6b3da20fd05e4/themes.json
    };
}

{
  programs.nvf = {
    enable = true;
    # your settings need to go into the settings attribute set
    # most settings are documented in the appendix
    settings = {
      vim.viAlias = false;
      vim.vimAlias = true;

      # Theming
      vim.theme = {
	enable = true;
	name = "catppucin";
	style = "dark";
      };

      vim.telescope = {
	enable = true;
      };

      vim.statusline.lualine = {
	enable = true;
      };

      vim.lsp = {
        enable = true;
      };
      vim.languages = {
	enableLSP = true;
	ts.enable = true;
	python.enable = true;
	html.enable = true;
	go.enable = true;
	nix.enable = true;
	sql.enable = true;
      };
    };
  };
}
}

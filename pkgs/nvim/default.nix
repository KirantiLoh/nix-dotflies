{
  programs.nvf = {
    enable = true;
    # your settings need to go into the settings attribute set
    # most settings are documented in the appendix
    settings = {
      vim.viAlias = false;
      vim.vimAlias = true;

      vim.syntaxHighlighting = true;

      # Theming
      vim.theme = {
	enable = true;
	name = "catppuccin";
	style = "macchiato";
      };

      vim.telescope = {
	enable = true;
      };

      vim.statusline.lualine = {
	enable = true;
      };

      vim.comments.comment-nvim.enable = true;

      vim.autocomplete.blink-cmp = {
        enable = true;
      };

      vim.lsp = {
        enable = true;
        formatOnSave = true;
      };

      vim.languages = {
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

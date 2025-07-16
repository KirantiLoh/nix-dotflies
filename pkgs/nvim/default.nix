{
  ...
}:
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

      vim.autocomplete.blink-cmp = {
        enable = true;
      };

      vim.lsp = {
        enable = true;
        formatOnSave = true;
      };

      vim.languages = {
        ts = {
          enable = true;
          format.enable = true;
          lsp.enable = true;
          treesitter.enable = true;
        };
        python = {
          enable = true;
          format.enable = true;
          lsp.enable = true;
          treesitter.enable = true;
        };
        html.enable = true;
        go = {
          enable = true;
          format.enable = true;
          lsp.enable = true;
          treesitter.enable = true;
        };
        nix.enable = true;
        sql.enable = true;
        markdown.enable = true;
      };

      vim.autopairs.nvim-autopairs.enable = true;
      vim.utility.yazi-nvim.enable = true;
      vim.binds.cheatsheet.enable = true;
      vim.lsp.trouble.enable = true;
      vim.presence.neocord.enable = true;
      vim.visuals.nvim-web-devicons.enable = true;

      vim.keymaps = [
        {
          key = "<leader>wq";
          mode = [ "n" ];
          action = ":wq<CR>";
          silent = true;
          desc = "Save file and quit";
        }
        {
          key = ";";
          mode = [
            "n"
          ];
          action = ":";
          silent = true;
          desc = "Quick command mode";
        }
        {
          key = "jk";
          mode = [ "i" ];
          action = "<Esc>";
          silent = true;
          desc = "Quick keybind for changing to normal mode";
        }
      ];
    };
  };
}

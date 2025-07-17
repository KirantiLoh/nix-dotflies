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

      vim.git.enable = true;
      vim.git.vim-fugitive.enable = true;

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
      vim.tabline.nvimBufferline.enable = true;

      vim.dashboard.dashboard-nvim = {
        enable = true;
        setupOpts = {
          theme = "doom";
          hide = {
            statusline = false;
          };
          config = {
            header = [
              ""
              "⣅⣶⣾⠾⣚⣭⣭⣭⣭⣝⡫⢿⣻⡿⣷⡿⠉⠉⢿⣽⣶⣿⣿⣟⣾⡿⣯⣿⣟⣾⢿⣿⣳⣾⣞⣷⣾⣹"
              "⣿⠟⣵⣾⣿⢫⢭⢹⡿⠛⢿⣦⠹⡿⣯⠁⢄⠣⠈⢿⣯⣿⢾⣟⣯⢿⡻⠗⢟⡻⢿⣯⣿⢿⣽⡿⣽⣿"
              "⣿⠰⣿⡏⡍⣿⣇⣿⣿⠩⣾⣿⡇⣿⠅⠐⡌⠂⠥⠈⣿⣽⣿⣻⣿⣾⢿⣿⣳⣾⣼⣭⢹⣿⣯⡿⠿⢽"
              "⣿⣆⠻⣿⣷⣸⣿⣾⣿⣾⣿⠿⣣⣿⠀⠁⣂⣭⣤⣁⠘⠿⢾⣟⠷⣛⣛⣛⡙⢿⢩⠳⠛⠉⡀⠄⡄⣸"
              "⣿⣟⣷⣦⣭⣭⣍⠻⡉⣥⣶⢾⡟⣉⡰⢽⣿⠟⢉⡐⡓⠘⠖⠒⣦⠭⢙⣛⡛⣂⡂⢷⠀⠣⡘⠰⢀⣿"
              "⣿⣭⣶⣾⢿⣽⡿⡷⢤⢿⡿⣩⣾⣿⡿⠟⣁⣤⣥⣌⡀⣃⡐⠤⢀⠌⡁⠂⢩⡳⣼⣄⠶⣠⣁⠃⢾⣿"
              "⣿⡿⣽⣿⣻⣯⣿⣾⠿⠇⣴⣿⣿⡿⢡⢾⠟⣑⡋⢡⡎⡯⢽⣿⣱⣶⣤⡁⠀⢿⣿⣯⡈⠋⣒⣭⣼⣿"
              "⣿⡿⣟⣷⡿⣯⣷⣿⠃⣾⣾⣿⠟⠀⢢⣤⡰⢏⡎⣼⣿⣿⣯⢻⡇⡨⣝⢻⣞⠸⣗⢻⣷⢠⢻⣿⡻⠾"
              "⣿⢿⣟⣯⠿⠟⣽⠎⣼⣾⣿⠏⡰⠰⣫⣵⣶⣬⡁⢿⣿⣿⣿⡣⣱⣷⣌⢰⣿⠀⣿⣷⡝⡂⡆⣴⣻⣿"
              "⣿⣿⣙⣶⣷⣿⡟⢸⣿⣿⣟⢡⢂⣿⢏⣥⣶⣮⠻⣆⣈⡛⣩⣤⣶⣶⣤⣈⢥⡅⡻⣿⣿⡆⢧⢸⣿⢿"
              "⣿⣯⣿⣟⣯⣿⠇⡟⢸⡿⠟⣀⣸⣿⠨⣿⣿⡿⢀⣿⣿⣿⣿⢏⣶⣶⣦⡙⣧⡇⣿⣎⣿⣷⠀⢸⣿⣙"
              "⣿⣟⣾⣯⣯⣭⡅⠃⣿⢰⣿⣟⡿⣿⣷⣶⣶⣶⡞⣿⣿⣿⣿⡘⠿⢿⣿⢃⣿⢡⢿⣟⢿⡟⠀⣺⣙⣹"
              "⣿⣟⣯⣿⣽⣟⡇⠀⡿⢦⡙⢿⣿⣷⣿⣿⣿⠟⣥⣥⣬⠉⢾⣿⣿⡶⣲⢿⡏⣴⣿⣿⣏⠇⠀⣿⣿⣻"
              "⣿⣟⣯⣷⣿⣻⣿⠷⠰⡆⢿⢰⢂⣭⠙⡛⣛⠴⠬⠩⢌⣼⣿⣿⣿⣿⣿⡯⣰⣿⣿⠟⢸⢠⢇⢹⣷⣿"
              "⣿⣇⣮⣃⣭⣭⣸⣿⠷⢌⠈⠂⣪⣽⢀⢠⠛⠻⠌⢛⠒⡰⢶⡶⡴⣀⠠⠠⣿⣿⠟⠀⠃⢸⠞⣢⠙⢾"
              "⣿⣟⣿⢿⡿⣷⣿⣻⣷⣼⣴⣶⣉⣦⣤⣀⣌⡁⠐⠀⠄⠨⠕⠊⠰⠄⠖⠑⣋⠱⠆⠐⡜⡠⢤⣶⣶⣶"
              "⣿⣟⣯⣿⢿⣻⣷⡿⣯⣿⣻⣽⣿⣛⣭⣛⣛⣿⣿⣳⣿⡿⣿⣷⡷⣿⣿⢿⡿⢿⡷⣶⣶⣿⣶⣾⢷⣿"
              ""
              ""
            ];
            center = [
              {
                icon = " ";
                icon_hl = "Title";
                desc = "Find File           ";
                desc_hl = "String";
                key = "f";
                keymap = "SPC f f";
                key_hl = "Number";
                key_format = " %s";
                action = "Telescope find_files cwd=";
              }
              {
                icon = " ";
                icon_hl = "Title";
                desc = "Explore cwd         ";
                desc_hl = "String";
                key = "y";
                keymap = "SPC -";
                key_hl = "Number";
                key_format = " %s";
                action = "Yazi";
              }
            ];
            footer = [
              "If Haru Urara never gave up, neither should you"
            ];
            vertical_center = true;
          };
        };
      };

      vim.keymaps = [
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

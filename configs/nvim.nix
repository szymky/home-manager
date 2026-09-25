{ ... }:

{
  programs.nixvim = {
    enable = true;

    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      tabstop = 2;
      expandtab = true;
      smartindent = true;
      wrap = false;
      termguicolors = true;
      scrolloff = 8;
    };

    colorschemes.catppuccin = {
      enable = true;
      settings = {
        flavour = "mocha";
        transparent_background = true;
      };
    };
    globals.mapleader = " ";

    keymaps = [
      {
        mode = "n";
        key = "<leader>ff";
          action = "<cmd>Telescope find_files<CR>";
          options.desc = "Find Files";
        }
        {
          mode = "n";
          key = "<leader>fg";
          action = "<cmd>Telescope live_grep<CR>";
          options.desc = "Live Grep";
        }
        {
          mode = "n";
          key = "<leader>e";
          action = "<cmd>Neotree toggle<CR>";
          options.desc = "Toggle File Explorer";
        }
      ];

    plugins = {
      lualine.enable = true;
      telescope.enable = true;

      treesitter = {
        enable = true;
        folding.enable = true;

        highlight.enable = true;
        indent.enable = true;
      };

      neo-tree.enable = true;

      cmp = {
        enable = true;
        settings = {
          autoEnableSources = true;
          sources = [
            { name = "nvim_lsp"; }
            { name = "path"; }
            { name = "buffer"; }
            { name = "luasnip"; }
          ];
          mapping = {
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<Tab>" = "cmp.mapping.select_next_item()";
            "<S-Tab>" = "cmp.mapping.select_prev_item()";
            "<C-Space>" = "cmp.mapping.complete()";
          };
        };
      };

      luasnip.enable = true;

      lsp = {
        enable = true;
        keymaps = {
          silent = true;
          lspBuf = {
            gd = "definition";
            gD = "declaration";
            gi = "implementation";
            K = "hover";
            "<leader>rn" = "rename";
            "<leader>ca" = "code_action";
          };
        };
        servers = {
          nil_ls.enable = true;
          lua_ls.enable = true;
          rust_analyzer = {
            enable = true;
            installCargo = false;
            installRustc = false;
          };
        };

      };

      conform-nvim = {
        enable = true;
        settings = {
          format_on_save = {
            timeout_ms = 500;
            lsp_fallback = true;
          };
          formatters_by_ft = {
            nix = [ "aleph" "nixpkgs_fmt" ];
            rust = [ "rustfmt" ];
            lua = [ "stylua" ];
          };
        };
      };
    };
  };
}

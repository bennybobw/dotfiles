return {
  "mxw/vim-jsx",
  "pangloss/vim-javascript",
  { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000 },
  {
    'ray-x/aurora',
    init = function()
      vim.g.aurora_italic = 0
      vim.g.aurora_transparent = 0
      vim.g.aurora_bold = 1
    end
   },
  { "Mofiqul/dracula.nvim" },
  "nvim-tree/nvim-web-devicons",
  "nvim-lua/plenary.nvim",
  "duane9/nvim-rg",
  "norcalli/nvim-colorizer.lua",
  "lumiliet/vim-twig",
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("fzf-lua").setup({})
      
      vim.keymap.set("n", "<leader>ff", function()
        require("fzf-lua").files()
      end)

      vim.keymap.set("n", "<leader>fg", function()
        require("fzf-lua").live_grep()
      end)

      vim.keymap.set("n", "<leader>fb", function()
        require("fzf-lua").buffers()
      end)
    end
  },
  {"nanozuki/tabby.nvim"},
  {
    "EdenEast/nightfox.nvim",
    lazy = false,        -- load during startup
    priority = 1000,     -- make sure it loads before other UI plugins
    config = function()
      require("nightfox").setup({
        options = {
          transparent = false, -- or true if you like
        },
      })
      vim.cmd.colorscheme("duskfox")
      require("plugins.nightfox_tabby").setup()
    end,
  },
}
--[[
  {
    "navarasu/onedark.nvim",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('onedark').setup {
        style = 'darker'
      }
      -- Enable theme
      require('onedark').load()
    end
  },
  {
    'ray-x/aurora',
    init = function()
      vim.g.aurora_italic = 0
      vim.g.aurora_transparent = 0
      vim.g.aurora_bold = 1
    end,
    config = function()
        vim.cmd.colorscheme "aurora"
    end
   },
]]
-- https://github.com/ray-x/aurora
-- https://vimcolorschemes.com/mofiqul/dracula.nvim
-- https://vimcolorschemes.com/ghifarit53/tokyonight-vim
-- https://vimcolorschemes.com/tiagovla/tokyodark.nvim

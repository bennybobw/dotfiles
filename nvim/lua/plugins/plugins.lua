return {
  "mxw/vim-jsx",
  "pangloss/vim-javascript",
  { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000 },
  {
    "editorconfig/editorconfig-vim",
    lazy = false
  },
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
      local fzf = require("fzf-lua")
      fzf.setup({
        fzf_opts = {
          ["--nth"] = "1..", -- improves scoring for filenames
        },
      })

      -- helper to get git root
      local function git_root()
        local root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
        if vim.v.shell_error == 0 and root ~= "" then
          return root
        end
        return vim.fn.getcwd()
      end

      -- tracked files only
      --[[
      vim.keymap.set("n", "<leader>ff", function()
        fzf.git_files({ cwd = git_root() })
      end, { desc = "Git tracked files" })
      --]]

      -- all files in repo, including untracked
      vim.keymap.set("n", "<leader>ff", function()
        fzf.files({
          cwd = git_root(),
          fzf_opts = {
            ["--exact"] = "",
          },
        })
      end, { desc = "All files in repo" })

      -- grep entire git repo
      vim.keymap.set("n", "<leader>ft", function()
        fzf.live_grep({ cwd = git_root() })
      end, { desc = "Grep git root" })

      -- grep current working directory
      vim.keymap.set("n", "<leader>fc", function()
        fzf.live_grep({ cwd = vim.fn.getcwd() })
      end, { desc = "Grep cwd" })

      vim.keymap.set("n", "<leader>fb", function()
        fzf.buffers()
      end)
    end
  },
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
    end,
  },
  {"nanozuki/tabby.nvim",
    lazy = false,
    config = function()
      require("ui.nightfox_tabby")
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

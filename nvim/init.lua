vim.g.mapleader = ","
vim.g.maplocalleader = "\\"
vim.opt.termguicolors = true
vim.o.showtabline = 2
vim.opt.splitbelow = true

require("config.lazy")

-- I think I had to install wayland package wl-clipboard
-- let mapleader=","
vim.cmd([[
inoremap jk <ESC>

set title
set expandtab
set nomodeline
set ignorecase

set ts=8 sts=2 sw=2 tw=77
set number

set clipboard+=unnamedplus
set backupcopy=yes

set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %p%%
hi StatusLine cterm=none ctermbg=236 ctermfg=252
]])

-- Set up php filetypes
vim.cmd([[
au FileType javascript set cin
au FileType yaml set et
au FileType vim set sts=2 sw=2
au FileType php set tw=0 ts=8 sts=2 sw=2
au FileType lua set tw=0 ts=8 sts=2 sw=2
au FileType ruby set tw=0 ts=8 sts=2 sw=2
au FileType python set tw=0 ts=8 sts=2 sw=2
au BufNewFile,BufRead *.py set ts=2 sts=2 sw=2 tw=79 autoindent
au BufRead,BufNewFile *.dart set tw=0 ts=4 sts=2 sw=2
au BufRead,BufNewFile *.theme set filetype=php
au BufRead,BufNewFile *.twig set filetype=php
au BufRead,BufNewFile *.install set filetype=php
au BufRead,BufNewFile *.inc set filetype=php
au BufRead,BufNewFile *.module set filetype=php
au BufRead,BufNewFile *.test set filetype=php
]])

require('colorizer').setup()

--vim.g.dracula_italic = 0
-- vim.cmd[[colorscheme dracula-soft]]

--- harpoon setup
local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)

-- Set rename for tabby
vim.api.nvim_create_user_command("TR", function(opts)
  vim.t.tab_name = opts.args
end, {
  nargs = 1,
})
-- Colorscheme for tabby
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    -- Make tabline blend with your dark background.
    -- Links are safest across themes.
    vim.api.nvim_set_hl(0, "TabLineFill", { link = "Normal" })
    vim.api.nvim_set_hl(0, "TabLine",     { link = "StatusLineNC" })
    vim.api.nvim_set_hl(0, "TabLineSel",  { link = "StatusLine" })
  end,
})
-- Apply immediately for the current colorscheme too:
vim.api.nvim_set_hl(0, "TabLineFill", { link = "Normal" })
vim.api.nvim_set_hl(0, "TabLine",     { link = "StatusLineNC" })
vim.api.nvim_set_hl(0, "TabLineSel",  { link = "StatusLine" })

-- netrw
vim.g.netrw_banner = 0       -- hide top banner
vim.g.netrw_liststyle = 3    -- tree view
--vim.g.netrw_browse_split = 4 -- open files in previous window
vim.g.netrw_winsize = 25     -- sidebar size

-- Custom aliases
vim.keymap.set("n", "<leader>jt", function()
  vim.cmd("tabedit /var/www/prm.local/site/web/themes/custom/watershed/css")
end)

vim.keymap.set("n", "<leader>jm", function()
  vim.cmd("tabedit /var/www/prm.local/site/web/modules/custom/")
end)

vim.keymap.set("n", "<leader>cc", function()
  vim.cmd("tabedit /home/bwheeler/dotfiles/nvim/init.lua")
end, { desc = "Open init.lua" })

vim.keymap.set("n", "<leader>cp", function()
  vim.cmd("tabedit " .. vim.fn.stdpath("config") .. "/lua/plugins/plugins.lua")
end, { desc = "Open plugins.lua" })

vim.keymap.set("n", "<leader>cr", function()
  dofile(vim.fn.stdpath("config") .. "/init.lua")
  vim.notify("Config reloaded!")
end, { desc = "Open plugins.lua" })

vim.api.nvim_create_user_command("CR", function()
  dofile(vim.fn.stdpath("config") .. "/init.lua")
  vim.notify("Config reloaded!")
end, {})

vim.g.mapleader = ","
vim.g.maplocalleader = "\\"
vim.opt.termguicolors = true

require("config.lazy")

-- I think I had to install wayland package wl-clipboard
-- let mapleader=","
vim.cmd([[
inoremap jk <ESC>

set title
set expandtab
set nomodeline

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
au BufNewFile,BufRead *.py set ts=4 sts=4 sw=4 tw=79 autoindent
au BufRead,BufNewFile *.dart set tw=0 ts=4 sts=2 sw=2
au BufRead,BufNewFile *.theme set filetype=php
au BufRead,BufNewFile *.twig set filetype=php
au BufRead,BufNewFile *.install set filetype=php
au BufRead,BufNewFile *.inc set filetype=php
au BufRead,BufNewFile *.module set filetype=php
]])

require('colorizer').setup()
vim.cmd([[colorscheme nightfly]])

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

" https://github.com/junegunn/vim-plug#neovim
call plug#begin('~/.local/share/nvim/plugged')

inoremap jk <ESC>

set title
set expandtab
set nomodeline

set ts=8 sts=2 sw=2 tw=77
set number

let mapleader=","
" I think I had to install wayland package wl-clipboard
set clipboard+=unnamedplus
set backupcopy=yes
" vim.api.nvim_set_option("clipboard", "unnamed")

set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %p%%
hi StatusLine cterm=none ctermbg=236 ctermfg=252

" Set up php filetypes
au FileType javascript set cin
au FileType yaml set et
au FileType vim set sts=2 sw=2
au FileType php set tw=0 ts=8 sts=2 sw=2
au FileType lua set tw=0 ts=8 sts=4 sw=4
au FileType ruby set tw=0 ts=8 sts=2 sw=2
au FileType python set tw=0 ts=8 sts=2 sw=2
au BufNewFile,BufRead *.py set ts=4 sts=4 sw=4 tw=79 autoindent
au BufRead,BufNewFile *.dart set tw=0 ts=4 sts=2 sw=2
au BufRead,BufNewFile *.theme set filetype=php
au BufRead,BufNewFile *.twig set filetype=php
au BufRead,BufNewFile *.install set filetype=php
au BufRead,BufNewFile *.inc set filetype=php
au BufRead,BufNewFile *.module set filetype=php

"Plug 'sonph/onehalf'
"code completion
"https://github.com/yetone/avante.nvim
" Plug 'github/copilot.vim'
" Install fzf https://github.com/junegunn/fzf
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'bluz71/vim-nightfly-colors', { 'as': 'nightfly' }
Plug 'nanozuki/tabby.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'junegunn/fzf'
" Plug 'junegunn/fzf.vim'
"Plug 'ibhagwan/fzf-lua'
"Plug 'homerours/jumper.nvim'

" Telescope plugins
"Plug 'sharkdp/fd'
"Plug 'nvim-treesitter/nvim-treesitter'
"Plug 'nvim-lua/plenary.nvim'
Plug 'BurntSushi/ripgrep'
"Plug 'nvim-tree/nvim-web-devicons'
"Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
"Plug 'nvim-telescope/telescope-fzf-native.nvim'
"Plug 'tpope/vim-vinegar'
Plug 'norcalli/nvim-colorizer.lua'

call plug#end()
colorscheme nightfly 
lua require'colorizer'.setup()

" Find files using Telescope command-line sugar.
"nnoremap <leader>ff <cmd>Telescope find_files<cr>
"nnoremap <leader>fg <cmd>Telescope git_files<cr>
"nnoremap <leader>lg <cmd>Telescope live_grep<cr>
""nnoremap <leader>fb <cmd>Telescope buffers<cr>
"nnoremap <leader>fh <cmd>Telescope help_tags<cr>
"nnoremap <leader>ff <cmd>Telescope find_files<cr>

lua <<EOF
require('fzf-lua').setup({'fzf-vim'})
require"tabby".setup()
require('tabby.tabline').use_preset('tab_only', {
  nerdfont = false
})

local jumper = require("jumper.fzf-lua")
vim.keymap.set('n', '<c-y>', jumper.jump_to_directory)
vim.keymap.set('n', '<c-u>', jumper.jump_to_file)
vim.keymap.set('n', '<leader>fu', jumper.find_in_files)

EOF

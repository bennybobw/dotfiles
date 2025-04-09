" init.vim

set nocompatible              " be iMproved, required
filetype off                  " required

set number
set noswapfile
set smartcase

" Turn off statusbar, because it is externalized
set noshowmode
set noruler
set laststatus=0
set noshowcmd

" Enable GUI mouse behavior
set mouse=a

" use jk for <ESC>
inoremap jk <ESC>

" Tab stuff
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent

" Set up php filetypes
augroup php_filetypes
  au!
  autocmd BufNewFile,BufRead *.module set filetype=php
  autocmd BufNewFile,BufRead *.install set filetype=php
  autocmd BufNewFile,BufRead *.test set filetype=php
  autocmd BufNewFile,BufRead *.inc set filetype=php
  autocmd BufNewFile,BufRead *.profile set filetype=php
  autocmd BufNewFile,BufRead *.view set filetype=php
  autocmd BufNewFile,BufRead *.theme set filetype=php
  autocmd FileType php setlocal tabstop=2 shiftwidth=2
augroup END

" vim plug
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')
 " colorschemes
 Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
 Plug 'cnj4/horseradish256'
 Plug 'sonph/onehalf'
 Plug 'NLKNguyen/papercolor-theme'
 Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()

" set colorscheme
if (has("termguicolors"))
 set termguicolors
endif

colorscheme challenger_deep 

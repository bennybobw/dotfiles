" leader doesn't work on mac
let mapleader=","

" use jk for <ESC>
inoremap jk <ESC>

" quick syntax rehighlighting
map <leader>sy :syn sync fromstart <CR>

let g:autoclose_loaded = 1

" Turn off stupid neocomplcache
let g:neocomplcache_enable_at_startup = 0

" stupid whitespace thing
" set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set nolist
let g:indent_guides_enable_on_vim_startup=0

" Drupal tab stuff
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent
" Drupal *.module and *.install files.
if has("autocmd")
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
    autocmd BufRead,BufNewFile *.inc set filetype=php
    autocmd BufRead,BufNewFile *.profile set filetype=php
    autocmd BufRead,BufNewFile *.view set filetype=php
  augroup END
endif

" Fix stupid terminal color thing
set t_Co=256

" yank and paste to clipboard
set clipboard=unnamedplus

" ignore case on wrapping unless there's an uppercase in the search
set ignorecase 
set smartcase

" Wrapping
set wrap
set linebreak
set nolist  " list disables linebreak
set textwidth=0
set wrapmargin=0

"set nvim to use vim defaults
set nocp

set nocompatible " must be first line
set history=1000
let mapleader=","
set hlsearch

" swapfile placement
if isdirectory($HOME . '/.vim/swapfiles')
  set directory=$HOME/.vim/swapfiles//
endif

if has('nvim')
    let s:editor_root=expand("~/.nvim")
else
    let s:editor_root=expand("~/.vim")
endif

" use jk for <ESC>
inoremap jk <ESC>

" Tab stuff
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent
filetype plugin indent on

" turn on line numbers
set number

" file searching
set wildmode=list:longest

" turn on matchit macro
runtime macros/matchit.vim

" Drupal *.module and *.install files.
if has("autocmd")
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
    autocmd BufRead,BufNewFile *.inc set filetype=php
    autocmd BufRead,BufNewFile *.profile set filetype=php
    autocmd BufRead,BufNewFile *.view set filetype=php
    autocmd BufRead,BufNewFile *.theme set filetype=php
  augroup END
endif

" stupid whitespace thing
" set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set nolist
let g:indent_guides_enable_on_vim_startup=0

" Fix stupid terminal color thing
set t_Co=256

" yank and paste to clipboard
" Had to use ^ to prepend clipboard in Ubuntu 15.04, see http://vim.wikia.com/wiki/Accessing_the_system_clipboard
set clipboard^=unnamedplus

" ignore case on wrapping unless there's an uppercase in the search
set ignorecase 
set smartcase

" Wrapping
set wrap
set linebreak
set nolist  " list disables linebreak
set textwidth=0
set wrapmargin=0

" Turn off spell highlighting
set nospell

set visualbell

let g:autoclose_loaded = 1

"create new line below current line without leaving normal mode or moving cursor
noremap - m`o<Esc>``
"create new line above current line without leaving normal mode or moving cursor
noremap _ m`O<Esc>``

" quick syntax rehighlighting
map <leader>sy :syn sync fromstart <CR>

" Setting up Vundle - the vim plugin bundler
let vundle_installed=1
let vundle_readme=s:editor_root . '/bundle/vundle/README.md'
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    " silent execute "! mkdir -p ~/." . s:editor_path_name . "/bundle"
    silent call mkdir(s:editor_root . '/bundle', "p")
    silent execute "!git clone https://github.com/gmarik/vundle " . s:editor_root . "/bundle/vundle"
    let vundle_installed=0
endif
let &rtp = &rtp . ',' . s:editor_root . '/bundle/vundle/'
call vundle#rc(s:editor_root . '/bundle')

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'gcmt/taboo.vim'
Plugin 'mileszs/ack.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'skywind3000/quickmenu.vim'
set rtp+=~/.fzf
Plugin 'junegunn/fzf.vim'

" Syntax stuff
Plugin 'scrooloose/syntastic'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'leafgarland/typescript-vim'
Plugin 'tpope/vim-markdown'
Plugin 'pearofducks/ansible-vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'lumiliet/vim-twig'

" Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Show airline before split
set laststatus=2
" See powerline fonts docs here: https://github.com/powerline/fonts
let g:airline_powerline_fonts = 1

" PHP
Plugin 'spf13/PIV'
" GIT
Plugin 'tpope/vim-fugitive'

" Color Schemes
Plugin 'mbbill/vim-seattle'

" Use local bundles config if available {
    if filereadable(expand("~/.vimrc.bundles.local"))
        source ~/.vimrc.bundles.local
    endif
" }

if vundle_installed == 0
    echo "Installing Plugins, please ignore key map error messages"
    echo ""
    :PluginInstall
endif

" quick syntax rehighlighting
map <leader>sy :syn sync fromstart <CR>

" map changing directory to current working directory 
map <leader>cd :cd %:p:h<CR>

let g:syntastic_php_phpcs_args=" --standard=Drupal --extensions=php,module,inc,install,test,profile,theme"
" Syntastic settings, adapted from
" echodittolabs.org/drupal-coding-standards-vim-code-sniffer-syntastic-regex
if exists('loaded_syntastic_plugin') && strlen(drupal#phpcs_exec)
  let g:syntastic_php_phpcs_exec = drupal#phpcs_exec
  let g:syntastic_php_phpcs_args = drupal#phpcs_args
endif

let g:syntastic_scss_checkers = ['']

" Color Scheme
colorscheme seattle

" Alias TabooRename to TR
cabbrev TR TabooRename

" Taboo save tab names in session
set sessionoptions+=tabpages,globals

" Strip trailing whitespace on saving php, javascript, css, scss files
autocmd BufWritePre *.php,*.module,*.css,*.scss,*.js,*.jsx %s/\s\+$//e

" Fix for yarn/parcel watchers
set backupcopy=yes

" Syntax highlighting help
" Press ctrl + shift + p to get help with a line
" https://stackoverflow.com/questions/30247603/making-vim-show-a-git-diff-with-colors-like-a-git-diff-command-red-delete-gree
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif   
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
nmap <leader>syn :call <SID>SynStack()<CR>

" Toggle netrw
map <leader>nt :edit .<CR>
" Toggle quickmenu
map <leader>m :call quickmenu#toggle(0)<CR>

" quickmenu enable cursorline (L) and cmdline help (H)
let g:quickmenu_options = "HL"
call g:quickmenu#append('# Directories', '')

if isdirectory("/var/www/usenix.local")
  call g:quickmenu#append('Usenix modules', 'edit /var/www/usenix.local/htdocs/sites/all/modules/usenix | normal c', 'Usenix modules directory')
  call g:quickmenu#append('Usenix checkout', 'edit /var/www/usenix.local/htdocs/sites/all/modules/usenix/usenix_commerce_checkout | normal c', 'Usenix commerce checkout')
  call g:quickmenu#append('Taco sass', 'edit /var/www/usenix.local/htdocs/sites/all/themes/custom/taco | normal c', 'Taco')
  call g:quickmenu#append('Taco sass', 'edit /var/www/usenix.local/htdocs/sites/all/themes/custom/taco/sass/components | normal c', 'Taco sass')
endif

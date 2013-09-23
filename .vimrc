version 6.0
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
let &cpo=s:cpo_save
unlet s:cpo_save

set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.info,.aux,.log,.dvi,.bbl,.out
set background=light
set history=50
set viminfo='20,\"500

set autoindent
set backspace=2
set expandtab
set laststatus=2
set nomodeline
set ruler
set shiftwidth=4
set tabstop=4
set smartindent

set visualbell
set encoding=utf8
set printencoding=latin2
set printfont=courier:h8
set termencoding=utf8
set fileencodings=utf8

set number

set hlsearch
set incsearch
set ignorecase

cmap %/ <C-R>=expand("%:p:h") . '/'<CR>

au BufNewFile,BufRead *.twig set filetype=html
au BufRead,BufNewFile *.php4 *.php5 se filetype=php
au FileType php set omnifunc=phpcomplete#CompletePHP

filetype plugin on

" below needs xoria256 installed
set t_Co=256
colorscheme xoria256

version 6.0
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
imap <F4> ZZ
imap <F9> :w
imap <F10> ZZ
map Q gq
nmap gx <Plug>NetrwBrowseX
map <F4> ZZ
map <F2> :noh
map <F3> :let &hlsearch=!&hlsearch
map <F5> @w
map <F7> :s/<!--//:s/-->//:nohj
map <F8> I<!--A-->j
map <F9> :w
map <F10> ZZ
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetBrowseX(expand("<cWORD>"),0)
map <F11> 0i# j
map <F12> :s/^# //:nohj
let &cpo=s:cpo_save
unlet s:cpo_save
set autoindent
set background=light
set backspace=2
set expandtab
set history=50
set hlsearch
set incsearch
set laststatus=2
set nomodeline
set ruler
set shiftwidth=2
set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.info,.aux,.log,.dvi,.bbl,.out
set tabstop=2
set viminfo='20,\"500
set visualbell
set encoding=utf8
set termencoding=utf8
set fileencodings=utf8
" vim: set ft=vim :

" wowo settings
set ignorecase
set number

"source ~/.vim/plugin/php-doc.vim
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocRange()<CR> 

set smartindent
"set dictionary=/usr/share/vim/php.dict
"helptags ~/.vim/doc/

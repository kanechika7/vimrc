" BASE
syntax on
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set title

" space highlight
set list
set listchars=tab:→\ ,trail:~,nbsp:%,extends:>,precedes:<
if has('syntax')
	syntax enable
	function! ActivateInvisibleIndicator()
	highlight ZenkakuSpace cterm=underline ctermfg=red gui=underline guifg=#FF0000
	match ZenkakuSpace /　/
	endfunction
	augroup InvisibleIndicator
	autocmd!
	autocmd BufEnter * call ActivateInvisibleIndicator()
	augroup END
endif

" UTILITY COMMAND
nmap <F1> :.w !pbcopy<CR><CR>
vmap <F1> :w !pbcopy<CR><CR>
imap <F1> <Esc>:.w !pbcopy<CR><CR>
nmap <F2> :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
imap <F2> <Esc>:set paste<CR>:r !pbpaste<CR>:set nopaste<CR>

au BufRead,BufNewFile *.hamlc set ft=haml


" VUNDLE
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-rails.git'
Bundle 'vim-ruby/vim-ruby.git'
" Bundle 'bbommarito/vim-slim'
" Bundle 'slim-template/vim-slim'
Bundle 'groenewege/vim-less.git'
Bundle 'tpope/vim-haml.git'

" vim-scripts repos
Bundle 'php.vim'
Bundle 'jade.vim'
Bundle 'coffee.vim'
Bundle 'vim-coffee-script'
Bundle 'html5.vim'

" non github repos

" ...

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

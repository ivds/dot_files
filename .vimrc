set nocompatible
set encoding=utf-8
set ff=unix
filetype off
filetype plugin on
syntax enable
syntax on
colorscheme slate
set tabstop=2
set shiftwidth=2
set expandtab
set number relativenumber
set backspace=indent,eol,start
"=== Syntastic ====================================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_typescript_checkers = ['tslint', 'tsuquyomi']
let g:syntastic_aggregate_errors = 1
let g:syntastic_typescript_tslint_args = '/mnt/d/Dev/IQMS.Bouquet/IQMS.Bouquet.FrontEnd/'
let g:syntastic_typescript_tslint_exec = '/mnt/d/Dev/tslint/node_modules/tslint/bin/tslint' 
"==========================================================================================
"=== Tsuquyomi ====================================
let g:tsuquyomi_completion_detail = 1
let g:tsuquyomi_disable_quickfix = 0
let g:tsuquyomi_shortest_import_path = 1
let g:airlint#extensions#branch#enabled=1
"==========================================================================================
"=== Vundle plugins ===============================
set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin('$HOME/.vim/bundle/')
Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'leafgarland/typescript-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-syntastic/syntastic'
Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-theme'
Plugin 'prettier/vim-prettier'
Plugin 'scrooloose/nerdcommenter'
Plugin 'quramy/tsuquyomi'
call vundle#end()
"==========================================================================================
"=== Key remaps ===============================
let mapleader=" "
nnoremap <leader>g :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>cdb :cd /mnt/d/Dev/IQMS.Bouquet/IQMS.Bouquet.FrontEnd<CR>
nnoremap <silent> <leader>v- :vertical resize +5<CR>
nnoremap <silent> <leader>v+ :vertical resize -5<CR>
nnoremap <silent> <Leader>h+ :exe "resize " . (winheight(0) + 2)<CR>
nnoremap <silent> <Leader>h- :exe "resize " . (winheight(0) - 2)<CR>
nnoremap <leader>nt :NERDTree<CR> 
nnoremap <leader>r :source ~/.vimrc<CR>
nnoremap Q :@q<CR>
inoremap {<CR> {<CR>}<Esc>ko<tab>
"==========================================================================================
"=== NERD Commenter ===============================
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code
" indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a
" region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting let g:NERDTrimTrailingWhitespace = 1 " Enable NERDCommenterToggle to check all selected lines is commented or not let g:NERDToggleCheckAllLines = 1 
"==========================================================================================

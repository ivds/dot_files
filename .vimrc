set visualbell
set nocompatible
set encoding=utf-8
set ff=unix
filetype off
filetype plugin on
syntax enable
syntax on
set tabstop=2
set shiftwidth=2
set expandtab
set number relativenumber
set backspace=indent,eol,start
set rtp+=$HOME/.fzf
let g:ackprg = 'ag --nogroup --nocolor --column'
"=== Vundle plugins ===============================
set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin('$HOME/.vim/bundle/')
Plugin 'gmarik/Vundle.vim'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'prettier/vim-prettier'
Plugin 'scrooloose/nerdcommenter'
Plugin 'neoclide/coc.nvim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'mileszs/ack.vim'
Plugin 'dense-analysis/ale'
Plugin 'leafgarland/typescript-vim'
Plugin 'semibran/vim-colors-synthetic'
Plugin 'Yggdroot/indentLine'
"===color schemes===============================
Plugin 'vim-scripts/dante.vim'
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'plainfingers/black_is_the_color'
Plugin 'chr4/jellygrass.vim'
Plugin 'gkjgh/cobalt'
Plugin 'rmnv/vim-simple-colors'
"======================================================================================
call vundle#end()
colorscheme cobalt
"==========================================================================================
"=== Key remaps ===============================
let mapleader=" "
nnoremap <leader>g :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>cdb :cd /mnt/d/Dev/IQMS.Bouquet/IQMS.Bouquet.FrontEnd<CR>
nnoremap <silent> <leader>v- :vertical resize +5<CR>
nnoremap <silent> <leader>v+ :vertical resize -5<CR>
nnoremap <silent> <Leader>h+ :exe "resize " . (winheight(0) + 2)<CR>
nnoremap <silent> <Leader>h- :exe "resize " . (winheight(0) - 2)<CR>
nnoremap <C-N> :NERDTreeToggle<CR> 
nnoremap <leader>r :source ~/.vimrc<CR>:set term=xterm-256color<CR>
nnoremap Q :@q<CR>
"nnoremap <C-F> :FZ .
inoremap {<CR> {<CR>}<Esc>ko<tab>
nmap <C-j> <Plug>(ale_go_to_definition)
nmap <leader><C-j> <Plug>(ale_go_to_definition_in_vsplit)
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
"===FZF==========================================
" This is the default extra key bindings
" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
   call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
   copen
   cc
endfunction

let g:fzf_action = {
    \ 'ctrl-q': function('s:build_quickfix_list'),
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit' }

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

 "imap <C-f> <plug>(fzf-complete-file-ag) 
"==========================================================================================
let g:ale_linter = {
\    'javascript':['eslint'],
\    'typescript':['tsserver','tslint'],
\    'vue':['eslint']
\}

"==========================================================================================
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, '--color-path "1;36"', fzf#vim#with_preview(), <bang>0)

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"VUNDLE 
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"vundle requirements
set nocompatible	" be Improved, required
filetype off		" required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'honza/vim-snippets'
Plugin 'Valloric/YouCompleteMe'
Plugin 'edkolev/tmuxline.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'SirVer/ultisnips'
Plugin 'itchyny/lightline.vim'
Plugin 'lervag/vimtex'
Plugin 'octol/vim-cpp-enhanced-highlight'

call vundle#end()

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"PATHOGEN 
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"execute pathogen#infect()
"
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" LIGHTLINE
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified'] ]
      \ }
      \ }

set noshowmode

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" UTF8
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8


"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"BASIC SETTINGS
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let g:NERDDefaultAlign = 'left'

syntax on
set t_Co=256
set background=light
set term=screen-256color
colorscheme PaperColor 
" postavlja background boju na boju terminala valjda
"hi Normal guibg=NONE ctermbg=NONE

set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab
set autoindent
set cindent

set textwidth=120
set matchtime=2
set hlsearch "highlight search
set incsearch "incremental search
filetype plugin indent on
set undofile
set scrolloff=4
set wildmenu
set nowrap

" backspace over everything
set backspace=2 

" enable mouse
set mouse=a

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

"olaksan copy/paste u okviru vim-a
"nekad zna da fuckup kada se pastuje u vim
set pastetoggle=<F3>
set clipboard=unnamed

" relative line tokom Normal mode-a, obican tokom insert mode-a
set number relativenumber
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave    * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter      * set norelativenumber  
augroup END

"instantly close preview window afer autocomplete
autocmd CompleteDone * pclose

set laststatus=2 "always show statusline

"set yacc/bison files lex highlighting
augroup yacc_bison
  au!
  autocmd BufNewFile,BufRead *.ypp   set filetype=lex
augroup END




"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"MAPOVANJE I UNMAPOVANJE
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" DISABLE EX MODE
nnoremap Q <Nop>
" Maping <F2> to remove visualed searches
nnoremap <F2> :noh<CR>
nnoremap <F5> :NERDTree<CR>
nnoremap <F6> :NERDTreeFocus<CR>
" sklanja shift + K jer smara 
" Shift + K prebacuje u terminal i daje mogucnust koriscenja bash komandi
nnoremap K <Nop>
vnoremap K <Nop>


"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"ULTISNIPS
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"VIM-TEX             
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"AUTOCOMPLETION (YCM)
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
set completeopt-=preview
let g:ycm_python_interpreter_path = ''
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/global_extra_conf.py'
let g:ycm_extra_conf_globlist = ['~/Faks/KonstrukcijaKompilatora/*']

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" TMUXLINE
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let g:tmuxline_preset = 'tmux'


"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" CPP ENHANCED SYNTAX HIGHLIGHT 
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let g:cpp_member_variable_highlight =1
"let g:cpp_class_scope_highlight = 1
"let g:cpp_class_decl_highlight = 1
"

let g:PaperColor_Theme_Options = {
  \   'language': {
  \     'python': {
  \       'highlight_builtins' : 1
  \     },
  \     'cpp': {
  \       'highlight_standard_library': 1
  \     },
  \     'c': {
  \       'highlight_builtins' : 1
  \     }
  \   }
  \ }

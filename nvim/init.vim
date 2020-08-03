" -----------------------------------------------------------------------------
"  TOP-LEVEL SETTINGS 
" -----------------------------------------------------------------------------

" Automatic reloading of init.vim
autocmd! bufwritepost init.vim nested source %

set nocompatible
filetype off
syntax on
if !has('gui_running')
    set t_Co=256
endif
set background=light

" -----------------------------------------------------------------------------
"  UTF-8 
" -----------------------------------------------------------------------------
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
                
" -----------------------------------------------------------------------------
"  BASIC EDITING COMMANDS
" -----------------------------------------------------------------------------
set expandtab
set shiftwidth=4
set tabstop=4 
set nowrap 
set colorcolumn=81
set number

set noshowmode 
set laststatus=2

" Display relative(to the cursor) numberline while in Normal mode, 
" show absolute line numbers in insert mode
"set number relativenumber
"augroup numbertoggle
"    autocmd!
"    autocmd BufEnter,FocusGained,InsertLeave    * set relativenumber
"    autocmd BufLeave,FocusLost,InsertEnter      * set norelativenumber  
"augroup END


" -----------------------------------------------------------------------------
"  VIM-PLUG 
" -----------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')
    
    " coc.nvim
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " cpp highlight
    Plug 'jackguo380/vim-lsp-cxx-highlight'
    " colorscheme
    Plug 'junegunn/seoul256.vim'
    " statusline 
    Plug 'itchyny/lightline.vim'
    " file explorer
    Plug 'preservim/nerdtree'
call plug#end()


" -----------------------------------------------------------------------------
"  COLORSCHEME
" -----------------------------------------------------------------------------
colo seoul256-light


" c++ syntax highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

" -----------------------------------------------------------------------------
"   KEY (UN)MAPPING 
" -----------------------------------------------------------------------------
" Disable ex mode; TODO learn about Ex mode
nnoremap Q <Nop>
" Remove highlight from searched word 
nnoremap <F2>  :noh<CR>

" keep formating when pasting
set pastetoggle=<F3>
set clipboard=unnamed



" -----------------------------------------------------------------------------
"   NERDTree settings 
" -----------------------------------------------------------------------------
map <F5> :NERDTreeToggle<CR>
map <F6> :NERDTreeFocus<CR>

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'


" -----------------------------------------------------------------------------
"   Coc-vim CONFIGURATIONS https://github.com/neoclide/coc.nvim
" -----------------------------------------------------------------------------

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif


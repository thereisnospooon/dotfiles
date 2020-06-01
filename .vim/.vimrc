set nocompatible              " be iMproved, required
filetype off
" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

""" Vundle setup
set rtp+=~/.vim/bundle/vundle/
"call vundle#rc()
call plug#begin('~/.vim/plugged/')
" let Vundle manage Vundle
" required! 
Plug 'gmarik/vundle'
Plug 'scrooloose/nerdtree' 
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'lervag/vimtex'
Plug 'tweekmonster/django-plus.vim'
Plug 'itchyny/lightline.vim'
" UltiSnips
Plug 'SirVer/ultisnips'
" Vimux
Plug 'benmills/vimux'
" Fuzzy file search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Gruvbox Theme
Plug 'morhetz/gruvbox'
"Vim Snippets
Plug 'honza/vim-snippets'
" Intellisense completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Auto comment lines
Plug 'scrooloose/nerdcommenter'
" Git plugin
Plug 'tpope/vim-fugitive'
Plug 'ryanoasis/vim-devicons'
" Zen mode plugin
Plug 'junegunn/goyo.vim'
call plug#end()
filetype plugin indent on
""" End if vundle setup

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif


" FZF Rg custom command
command! -bang -nargs=* Rgp
			\ call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 
			\ 1, 
			\ fzf#vim#with_preview(),
			\ <bang>0)

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]
let g:coc_node_path='/usr/bin/node'
" from readme
" if hidden is not set, TextEdit might fail.
set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes


" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

let g:coc_user_config = {}
let g:coc_user_config['coc.preferences.jumpCommand'] = 'vsp'
let g:coc_snippet_next="<C-l>"
let g:coc_snippet_prev="<C-h>"
imap <C-s> <Plug>(coc-snippets-expand)

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"End of CoC setting

" Line numbering
set number relativenumber


" Indentation
set tabstop=4
set autoindent
set copyindent
set shiftwidth=4


" colorscheme
let g:gruvbox_contrast_dark = "medium"
let g:gruvbox_italic=1
let g:gruvbox_italicize_strings=1
set t_Co=256
set background=dark
colorscheme gruvbox

set guifont=DroidSansMono\ Nerd\ Font\ 11
let g:airline_powerline_fonts = 1


"" NERDTree setting
map <silent> <C-v> :NERDTreeToggle<CR>

" Fixes esc lag using Nerdtree
set ttimeout ttimeoutlen=30

" Disable mouse
set mouse=""

"Disable insert label because we have lightline
set noshowmode

" Disable highlighting in search
set nohlsearch

" Goyo settings
let g:goyo_height = '100%'
let g:goyo_width = '160'
let g:goyo_linenr = 1


" Lightline functionality
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

""" vimtex setting
let maplocalleader = '\'
let g:vimtex_fold_enabled = 1
let g:vimtex_view_method='zathura'
" show little symbols of parans and such.
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
" folding
set foldmethod=expr
set foldexpr=vimtex#fold#level(v:lnum)
set foldtext=vimtex#fold#text()
autocmd InsertLeave * write " When leaving Insert mode this will save the file. Used to make vimtex update the PDF.

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories = ['/home/guy/.vim/bundle/vim-snippets/UltiSnips/']

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<c-s>"
let g:UltiSnipsJumpForwardTrigger = "<c-l>"
let g:UltiSnipsJumpBackwardTrigger = "<c-h>"
""" My mappings
" Ctrl-p to grep files in directory
map <silent> <C-p> :Rgp <CR>  
" Ctrl-l to grep for files
map <silent> <C-l> :GFiles <CR>  

" Switch to last-active tab
if !exists('g:Lasttab')
    let g:Lasttab = 1
    let g:Lasttab_backup = 1
endif
autocmd! TabLeave * let g:Lasttab_backup = g:Lasttab | let g:Lasttab = tabpagenr()
autocmd! TabClosed * let g:Lasttab = g:Lasttab_backup
nmap <silent> tt :exe "tabn " . g:Lasttab<cr>

" YCM config
"if !exists('g:ycm_semantic_triggers')
    "let g:ycm_semantic_triggers = {}
"endif
"let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme 

"Don't wrap lines!
set nowrap

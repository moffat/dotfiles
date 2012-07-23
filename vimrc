filetype off                   " required!


set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'



" My Bundles
" Original Repos on GitHub
Bundle 'tpope/vim-markdown' 
Bundle 'msanders/snipmate.vim' 
Bundle 'altercation/vim-colors-solarized'
Bundle 'sickill/vim-sunburst'
Bundle 'scrooloose/nerdcommenter'
Bundle 'gerw/vim-latex-suite'
Bundle 'vim-scripts/timestamp.vim'
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-scripts/MatlabFilesEdition'
Bundle 'jpalardy/vim-slime'
Bundle 'Lokaltog/vim-powerline'
Bundle 'vimoutliner/vimoutliner'
" non github repos
" Bundle 'git://git.wincent.com/command-t.git'

" custom configuration form vim
set linebreak
" set paste
set number 
set backupdir=~/.vimbackup 
"hi Comment ctermfg=green
"hi Number ctermfg=yellow
"hi Statement ctermfg=LightRed cterm=bold
"hi String ctermfg=LightRed 
"hi SpecialChar ctermfg=white 

syntax on
set wildmenu
filetype plugin on
filetype indent on

let g:tex_flavor='latex'
let g:Tex_CompileRule_dvi = 'latex -src-specials -interaction=nonstopmode $*'
let g:Tex_ViewRule_dvi = 'xdvi -s 4 -unique'
" let g:Tex_ViewRule_pdf = 'xpdf -z 100 -remote gvim'
let g:Tex_ViewRule_pdf = 'evince'
let g:Tex_FormatDependency_pdf = 'pdf'
let g:Tex_CompileRule_ps = 'dvips -Ppdf -o $*.ps $*.dvi'
let g:Tex_CompileRule_pdf = 'xelatex -shell-escape -interaction=nonstopmode $*.tex'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = ",pdf" 
" let g:Tex_ViewRule_pdf = 'evince --sm-client-id=10'
let g:Tex_PromptedEnvironments = 'eqnarray*,eqnarray,equation,equation*,\[,$$,align,align*,frame'
let g:Tex_HotKeyMappings = 'eqnarray*,eqnarray,bmatrix,frame'
let g:Tex_Env_frame = "\\begin{frame}\<CR>\\frametitle{<++>}\<CR><++>\<CR>\\end{frame}"
let g:Tex_FoldedMisc = "item,preamble,<<<,comments"
let g:Tex_FoldedEnvironments = ",frontmatter"

" Windows Position
if has("gui_running")
    " GUI is running or is about to start.
    " Maximize gvim window.
    set lines=100 columns=90
    " Change the color scheme for .tex files
    autocmd BufEnter *.tex colorscheme solarized
    autocmd BufEnter *.tex set background=light 
    autocmd BufEnter *.txt set background=light 
    autocmd BufEnter *.txt colorscheme solarized
    autocmd BufEnter *.mkd set background=light 
    autocmd BufEnter *.mkd colorscheme solarized
    autocmd BufEnter *.otl set background=light 
    autocmd BufEnter *.otl colorscheme solarized
    autocmd BufEnter *.mkd syntax on
    autocmd BufEnter * PowerlineReloadColorscheme
    autocmd BufEnter *.mkd set wrap
    autocmd BufEnter *.tex set wrap
    set background=light
    colorscheme Sunburst
else
    "" This is console Vim.
    "if exists("+lines")
        "set lines=50
    "endif
    "if exists("+columns")
        "set columns=100
    "endif
     set t_Co=256
     set background=dark
     colorscheme Sunburst
endif


" This stuff depends on whether the gui is running

set guifont=Ubuntu\ Mono\ 12
set guioptions-=T
set guioptions+=f
set nowrap
"Set mapleader
let mapleader = ","
let g:mapleader = ","


let g:slime_target = "tmux"
xmap <F5> <Plug>SlimeRegionSend
nmap <F5> <Plug>SlimeParagraphSend


set encoding=utf-8
set laststatus=2
set shiftwidth=4
set smarttab
set smartindent
set expandtab

set ignorecase
set smartcase

" This is totally awesome - remap jj to escape in insert mode.  You'll never type jj anyway, so it's great!
inoremap jj <Esc>

set mouse=a

" When I close a tab, remove the buffer
set nohidden

set undofile
set undodir=$HOME/.vim/undodir



" fix problem with e-acute
imap <buffer> <leader>it <Plug>Tex_InsertItemOnThisLine



"nnoremap        ts i%Created: TIME<C-\><C-o>iSTAMP<Esc>
nnoremap <expr> ts "i% Created:  TIME"."STAMP <cr>Modified: TIME"."STAMP \e"

nmap <C-V> "+gP
imap <C-V> <ESC><C-V>i
vmap <C-C> "+y 

" <Ctrl-X> -- cut (goto visual mode and cut)
imap <C-X> <C-O>vgG
vmap <C-X> "*x<Esc>i 

" Count the number of 
nmap <C-s> :1,.s/Slide//gn<CR>


" Automatically cd into the directory that the file is in
autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')




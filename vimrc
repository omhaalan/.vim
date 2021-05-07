set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


" python
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'


" syntaxt checker
"TODO: congfigure for latex
Plugin 'vim-syntastic/syntastic'

" Utility
Plugin 'scrooloose/nerdtree'


" Plugin 'git@github.com:kien/ctrlp.vim.git'          "file search"
Plugin 'ycm-core/YouCompleteMe.git'
" Plugin 'mileszs/ack.vim'

" Debugger
Plugin 'puremourning/vimspector'
Plugin 'szw/vim-maximizer'
" Power line
" Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" Some color schemes
" Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'



"Latex plug in
"Plugin 'lervag/vimtex'

"Make
"Plugin 'neomake/neomake'


" Snippets TODO: Put back in!
"Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'



" Snippets

" Writing
" Plugin 'reedes/vim-pencil'
" All of your Plugins must be added before the following line

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set noswapfile

let &t_TI = ""
let &t_TE = ""

" python
set encoding=utf-8

" colemake mapping



nnoremap n h
nnoremap N H
nnoremap e j
nnoremap E J
nnoremap i k
"nnoremap I K
nnoremap o l
"nnoremap O L



noremap k n
noremap K N
noremap l u
noremap L U
noremap u i
noremap U I

nnoremap y o
nnoremap Y O
"
"nnoremap c y
"nnoremap C Y

"xnoremap y
"xnoremap J Y

vnoremap n h
xnoremap n h
vnoremap e j
xnoremap e j
vnoremap i k
xnoremap i k

vnoremap o l
xnoremap o l

xnoremap u i
xnoremap U I



nnoremap <SPACE> <Nop>
let mapleader = " " 
let maplocalleader="'" 
" Use the elflord color scheme.
colors elflord

" Enable syntax highlighting.
syntax on

noremap <leader>ev :vsplit $MYVIMRC<CR>
noremap <leader>ei :vsplit ~/.config/i3/config<CR>
noremap <leader>im :vsplit ~/habits/impulseList<CR>
noremap <leader>ho :split ~/habits/hours<CR>
noremap <leader>sv :source $MYVIMRC<CR>
noremap <leader>w :w!<CR>
noremap <leader>q :q<CR>

nnoremap <leader>n :wincmd h<CR>
nnoremap <leader>e :wincmd j<CR>
nnoremap <leader>i :wincmd k<CR>
nnoremap <leader>o :wincmd l<CR>
nnoremap <leader>l :UndotreeShow<CR>


set relativenumber
set number
" set virtualedit=onemore

" superior navigation
nnoremap 7 ^
nnoremap N B
"nnoremap $ $1
nnoremap 0 $
nnoremap O W
nnoremap I H
nnoremap 9 <PageUp>
nnoremap E L
nnoremap 8 <PageDown>

" insert
nnoremap . A




" resizing

nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

nnoremap -1 :m .-2<CR>==
nnoremap +1 :m .+1<CR>==
vnoremap +1 :m '>+1<CR>gv==gv
vnoremap -1 :m '<-2<CR>gv==gv

" Writing configurations


" set nocompatible
" filetype plugin on       " may already be in your .vimrc
"let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'

" augroup pencil
"   autocmd!
"   autocmd FileType markdown,mkd call pencil#init()
"   autocmd FileType text         call pencil#init()
" augroup END
 

nnoremap <leader>pt :NERDTreeToggle<Enter>
nnoremap <silent>  <leader>pv :NERDTreeFind<CR>
let NERDTreeMapUp= "i"
let NERDTreeMenuUp= "i"
let NERDTreeMapDown= "e"
let NERDTreeMenuDown= "e"

" let NERDTreeMapUpdir= "i"
" let NERDTreeMapDowndir= "e"
let NERDTreeMapJumpFirstChild= "I"
let NERDTreeMapJumpLastChild= "E" 
"let NERDTreeMapJumpNextSibling=<C-e>

let NERDTreeMapOpenExpl= "å"
let NERDTreeMapOpenSplit= "ø"
let NERDTreeMapHidden= "æ"
let NERDTreeToggleHidden= "A"



" python idention

autocmd FileType python map <buffer> <F3> :call flake8#Flake8()<CR>

" au BufNewFile,BufRead *.py
"     \ set tabstop=4
"     \ set softtabstop=4
"     \ set shiftwidth=4
"     \ set textwidth=79
"     \ set expandtab
"     \ set autoindent
"     \ set fileformat=unix

" python syntaxt
let python_highlight_all=1
syntax on


" color scheme
if has('gui_running')
  set background=dark
  colorscheme solarized
endif


" You complete me
let g:ycm_autoclose_preview_window_after_insertion = 1


" debugging
let g:vimspector_install_gadgets = [ 'debugpy']

nmap <localleader>s :call vimspector#Launch()<CR> 
nmap <localleader>t :call vimspector#Continue()<CR> 

" These should probably be changed at some point
nmap <localleader>p  <Plug>VimspectorStepInto
nmap <localleader>f <Plug>VimspectorStepOver
nmap <localleader>w <Plug>VimspectorStepOut


nmap <localleader>a <Plug>VimspectorRestart
nmap <localleader>u <Plug>VimspectorToggleBreakpoint
nmap <localleader>uc <Plug>VimspectorToggleConditionalBreakpoint

nmap <localleader>q <Plug>VimspectorClearLineBreakpoint

" packadd termdebug
" let g:termdebug_wide=1


" maximizer mappings
nnoremap <leader>m :MaximizerToggle<CR>
vnoremap <leader>m :MaximizerToggle<CR>gv
" inoremap <leader>m <C-o>:MaximizerToggle<CR>


" Syntastic

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0"
"
"
"
"" Ultisnips
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"




" vimtex

"let g:tex_flavor='latex'
"let g:vimtex_view_method='mupdf'
"nmap <localleader>c  <Plug>vimtex-compiler
"let g:vimtex_enabled=1
"g:vimtex_view_general_options_latexmk
"let g:vimtex_compiler_latexmk='1'

















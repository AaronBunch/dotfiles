" url: https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/

set nocompatible " required
filetype off     " required
" we turn filetype back on after plugins are initialized

" set the runtime path to include Vundle and initialize;
" add the plugin below, then use :PluginInstall from vim
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all plugins here
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
" Bundle 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" all plugins must be added before the following line
call vundle#end()
filetype plugin indent on

" when using :sp and :vs
set splitbelow
set splitright

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" enable folding with <space>
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" show docstrings of folded code
let g:SimpylFold_docstring_preview=1

" python formatting
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

set encoding=utf-8

" enable these features if i ever get youcompleteme to work
"let g:ycm_autoclose_preview_window_after_completion=1
"map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" let Vim and YouCompleteMe know about any virtualenv
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" Make the code look pretty
let python_highlight_all=1
syntax on

" Color schemes: solarized for gui mode, zenburn for terminal mode
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif

" Toggle between light and dark theme in solarized
call togglebg#map("<F5>")

" Access system clipboard
set clipboard=unnamed

" Better command-line completion
set wildmode=longest,list,full
set wildmenu
" Show partial commands in the last line of the screen
set showcmd
 
" Turn off search highlighting
set nohlsearch
 
" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
 
" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start
 
" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
 
" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
" set nostartofline
 
" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler
 
" Always display the status line, even if only one window is displayed
set laststatus=2
 
" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm
 
" Use visual bell instead of beeping when doing something wrong
set visualbell
 
" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=
 
" Enable use of the mouse for all modes
set mouse=a
 
" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2
 
" Display line numbers on the left
set number
 
" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200
 
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$
 
" Tell vim where the tags file is. It starts looking in the current
" directory, and the semicolon tells vim to keep looking in the parent
" directories.
set tags=./tags;

" The working directory is always the one containing the current file
set autochdir

" Save marks when closing session
set viminfo='100,f1

" UTF-8 processing
runtime scripts/set_utf8.vim

:abbreviate #t # TODO(abunch):

" LaTeX-Suite ----------------------------------------------------------

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a single file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded. The
" following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" Latex-Suite: Set default target to pdf
let g:Tex_DefaultTargetFormat='pdf'
" Latex-Suite: Set default pdf viewer
let g:Tex_ViewRuleComplete_pdf = 'open *.pdf &'
" Latex-Suite: Tell it to run bibtex
let g:Tex_MultipleCompileFormats='pdf,bibtex,pdf'

" <F9> automatically runs python code
nnoremap <silent> <F9> :!clear;python %<CR>



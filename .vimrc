" *** PLUGIN LOADING ***

filetype off
let this_system = system("uname -s")
" :echo this_system
if has("unix")
    if (this_system =~ 'MSYS_NT')
        " Emulating Unix on Windows
        set runtimepath+=$HOME/Google\ Drive/code/config/.vim/bundle/Vundle.vim/
        call vundle#begin('%USERPROFILE%/Google Drive/code/config/.vim/bundle/')
    else
        " Vanilla Unix
        set rtp+=~/.vim/bundle/Vundle.vim
        call vundle#begin()
    endif
elseif has('win32')
    " TODO: see https://github.com/VundleVim/Vundle.vim/wiki/Vundle-for-Windows
endif

" Vundle commands: :BundleInstall and :BundleClean
Plugin 'VundleVim/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
" highlight matching html tag when cursor is on it
Plugin 'gregsexton/MatchTag'
" css/less/sass/html color preview for vim
Plugin 'gorodinskiy/vim-coloresque'
" syntax checking for lots of languages
" Checkers need to be installed separately - type :help syntastic-checkers
Plugin 'scrooloose/syntastic'

call vundle#end()

" *** BASICS ***

" Needed for NERDCommenter to figure out what comments to insert
filetype plugin on

" Correct backspace behaviour
set backspace=indent,eol,start

set autoindent
set smartindent
" set foldmethod=indent

" Use UTF-8 as display encoding
" (not how the in memory contents are written to disk)
set encoding=utf-8

" Turn tabs entered into spaces
set expandtab
" Size of a tab character (# spaces) for purpose of *display*
set tabstop=4
" Size of a tab character (# spaces) for purpose of *editing*
set softtabstop=4
" Characters to indent per level
set shiftwidth=4
" Round indentation (and tabs when editing) to nearest appropriate multiple
set shiftround

" Minimum window width (others are auto-resized)
set winwidth=79

" Always show the statusline
set laststatus=2

" Don't fold by default
set nofoldenable

" FileType-specific settings
autocmd FileType html setlocal shiftwidth=2 softtabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 softtabstop=2
autocmd FileType scss setlocal shiftwidth=2 softtabstop=2

" *** APPEARANCE ***

set t_Co=256

syntax on
colorscheme desert 

" Line numbers displayed on left
set number

" Line highlighting
set cursorline

" By default, split new buffers below, not above
set splitbelow

" Bad whitespace highlighting
highlight BadWhitespace ctermbg=red guibg=red
" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Search highlighting
set incsearch
set showmatch
set hlsearch

" Replace all occurrences in a line, not just the first
" (make :s/foo/bar act like :s/foo/bar/g by default)
set gdefault

" *** CUSTOM BINDINGS ***

" Turn off arrow keys
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" Make j and k move up and down one line on the _screen_, not the code.
:nmap j gj
:nmap k gk

" Clear search highlights using F8
" TODO Caused problems last time - many keys entered insert mode
nnoremap <F8> :noh<return><ESC>

" Use CtrlP to search through open buffers (F9, ie quickload)
map <F9> :CtrlPBuffer<CR>

" NERDCommenter: Toggle comment...
" - based on top selected line's status: <leader>c<space>
" - based on each line's status: <leader>ci
" Comment sexily (<leader>cs); undo comment (<leader>cu)
" Compact sexy comments
let NERDCompactSexyComs=1
" Remove extra spaces from sexy comments when uncommenting
let NERDRemoveExtraSpaces=1 
" Put spaces on either side of commented lines
let NERDSpaceDelims=1
" To get django comments working - see Steve Losh's .vimrc:
" https://bitbucket.org/sjl/dotfiles/src/tip/vim/.vimrc

" Syntastic
" When set to 1 the error window will be automatically opened when errors are detected, and closed when none are detected.
" let g:syntastic_auto_loc_list=1

" *** FILETYPE-SPECIFIC SETTINGS ***

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.c,*.h set textwidth=79 " C: 79
au BufRead,BufNewFile *.py,*.pyw set textwidth=79 " Python: 79
au BufRead,BufNewFile *.hs set textwidth=78 " Haskell: 78

" Turn off settings in 'formatoptions' relating to comment formatting.
" - c : do not automatically insert comment leader when wrapping based on
  " 'textwidth'
" - o : do not insert comment leader when using 'o' or 'O' from command mode
" - r : do not insert comment leader when hitting <Enter> in insert mode
" Python: not needed
" C: prevents insertion of '*' at the beginning of every line in a comment
au BufRead,BufNewFile *.c,*.h set formatoptions-=c formatoptions-=o formatoptions-=r

" Use UNIX (\n) line endings for new files.
" Python: yes
" C: yes
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" Mouse support
set ttymouse=xterm2
" Works in all Vim modes (=n means works in normal mode)
set mouse=a

" *** GVIM SETTINGS ***
" turn off icons
set guioptions-=T
set guifont=Consolas:h8

" VIM USAGE NOTES
" <leader> is \
" wordcount etc is g <Ctrl>-g
" Going between vim registers and X registers
" http://www.reddit.com/r/vim/comments/m9tcz/ask_rvim_anyone_successfully_mapped_yankpaste
" DON'T PUT COMMENTS AT THE END OF LINES IN VIMSCRIPT - doesn't always work

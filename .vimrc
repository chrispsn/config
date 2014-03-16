" <leader> is \
" DON'T PUT COMMENTS AT THE END OF LINES - doesn't always work

" Vundle requirements
" Install using
"     git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle)
"     (although the above may not be necessary given the bootstrap
"     script below)
"     :BundleInstall
"     and :BundleClean to remove vundles removed from this .vimrc

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundles

" Bootstrap vundle installation:
" https://github.com/gmarik/vundle/blob/master/test/vimrc
" let root = '/tmp/!vundle-test/bundles/'
" let src = 'http://github.com/gmarik/vundle.git'

" if !isdirectory(expand(root, 1).'/vundle')
  " exec '!git clone '.src.' '.shellescape(root, 1).'/vundle'
" endif

Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Lokaltog/vim-powerline'
Bundle 'airblade/vim-gitgutter'
Bundle 'tpope/vim-surround'
" highlight matching html tag when cursor is on it
Bundle 'gregsexton/MatchTag'
" css/less/sass/html color preview for vim
Bundle 'gorodinskiy/vim-coloresque'
" Makes GVim colourschemes work in terminal Vim
Bundle 'godlygeek/csapprox'
" syntax checking for lots of languages
Bundle 'scrooloose/syntastic'

" Syntastic options
" let g:syntastic_auto_loc_list=1

" Auto git-gutter: http://superuser.com/questions/558876/how-can-i-make-the-sign-column-show-up-all-the-time-even-if-no-signs-have-been-a
" Formatting of git-gutter
" Same colour as text background
au VimEnter * hi! clear SignColumn
" Same colour as linenumbers
" au VimEnter * hi! link SignColumn LineNr


" *** BASICS ***

" Autodetect filetypes (for autocompletion etc)
filetype plugin on

" Filetype indent on
set autoindent
set smartindent
" set foldmethod=indent

" Tabs converted to spaces, etc
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Minimum window width (others are auto-resized)
set winwidth=79

" But special for HTML and CSS
au FileType html, htmldjango, css, scss setl shiftwidth=2 softtabstop=2


" *** CUSTOM BINDINGS ***

" NERDCommenter
" Toggle comment based on top selected line's status (<leader>c<space>)
" Toggle comment based on each line's status (<leader>ci)
" Comment sexily (<leader>cs); undo comment (<leader>cu)
"
" Compact sexy comments
let NERDCompactSexyComs=1
" Remove extra spaces from sexy comments when uncommenting
let NERDRemoveExtraSpaces=1 
" Put spaces on either side of commented lines
let NERDSpaceDelims=1
" To get django comments working - see Steve Losh's .vimrc:
" https://bitbucket.org/sjl/dotfiles/src/tip/vim/.vimrc

" Make j and k move up and down one line on the _screen_,
" instead of one line in the code.
:nmap j gj
:nmap k gk

" Use CtrlP to search through open buffers (F9, ie quickload)
map <F9> :CtrlPBuffer<CR>

" " Toggle search highlighting (F8)
" map <F8> :set hls!<CR>
" imap <F8> <ESC>:set hls!<CR>a
" vmap <F8> <ESC>:set hls!<CR>gv

" Clear search highlights using F8
" Caused problems last time - many keys entered insert mode
nnoremap <F8> :noh<return><ESC>

" *** COLOURS AND SYNTAX HIGHLIGHTING ***

set t_Co=256

syntax on
let python_highlight_all=1
" colorscheme wombat
" colorscheme candyman
colorscheme newspaper

" *** APPEARANCE ***

" Line numbers are displayed on left
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

" without this, need to type :s/foo/bar/g
" instead of :s/foo/bar to get replacement of more than
" the first occurance of foo on a line
set gdefault

" *** FILETYPE-SPECIFIC SETTINGS ***

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.c,*.h set textwidth=79 " C: 79
au BufRead,BufNewFile *.py,*.pyw set textwidth=79 " Python: 79
au BufRead,BufNewFile *.hs set textwidth=78 " Haskell: 78

" Turn off settings in 'formatoptions' relating to comment formatting.
" - c : do not automatically insert the comment leader when wrapping based on
  " 'textwidth'
" - o : do not insert the comment leader when using 'o' or 'O' from command mode
" - r : do not insert the comment leader when hitting <Enter> in insert mode
" Python: not needed
" C: prevents insertion of '*' at the beginning of every line in a comment
au BufRead,BufNewFile *.c,*.h set formatoptions-=c formatoptions-=o formatoptions-=r

" Use UNIX (\n) line endings for new files.
" Python: yes
" C: yes
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" Always show the statusline
set laststatus=2
set encoding=utf-8

" Don't fold by default
set nofoldenable
" set foldlevel=1

" TEST RUNNING
" adapted from Gary Bernhardt's config 
" as displayed in Destroy All Software #60

map <leader>t :call RunTests()<cr>

function! RunTests()
    " Run test infrastructure.
    " if filereadable("test_*.py")
    exec ":!clear; nosetests"
    " else
        " exec ":!echo 'No tests available!'"
    " end
endfunction

" *** OTHER INTERESTING THINGS ***
" Going between vim registers and X registers
" http://www.reddit.com/r/vim/comments/m9tcz/ask_rvim_anyone_successfully_mapped_yankpaste
"
" Mouse support
set ttymouse=xterm2
" works in any mode (=n means works in normal mode)
set mouse=a

" Turn off arrow keys
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" *** GVIM SETTINGS ***
" turn off icons
set guioptions-=T

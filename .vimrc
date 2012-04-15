runtime bundle/pathogen/autoload/pathogen.vim
" Above necessary because pathogen is not installed in the autoload
" directory
call pathogen#infect()
call pathogen#helptags()

" *** NOTES ***

" DON'T PUT COMMENTS AT THE END OF LINES 
" THEY MAY NOT BE REGISTERED AS COMMENTS
" BUT INSTEAD FORM PART OF THE SET OPTION

" <leader> is \

" *** BASICS ***

" Autodetect filetypes (for autocompletion etc)
filetype on
filetype plugin on

" Filetype indent on
set autoindent
set smartindent
" set foldmethod=indent

" Disable vi compatibility
set nocompatible

" Tabs converted to spaces, etc
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" But special for HTML and CSS
au FileType html setl shiftwidth=2 softtabstop=2
au FileType css setl shiftwidth=2 softtabstop=2
au FileType scss setl shiftwidth=2 softtabstop=2

" Treat .scss like .css for all purposes, too (inc syntax highlighting)
au BufRead,BufNewFile *.scss set filetype=css


" *** CUSTOM BINDINGS ***

" Press F5 to check Python code against PEP8

" NERDCommenter
" Toggle comment based on top selected line's status (<leader>c<space>)
" Toggle comment based on each line's status (<leader>ci)
" Comment sexily (<leader>cs)
" Undo comment (<leader>cu)
" More: https://github.com/scrooloose/nerdcommenter/blob/master/doc/NERD_commenter.txt
" Compact sexy comments
let NERDCompactSexyComs=1
" Remove extra spaces from sexy comments when uncommenting
let NERDRemoveExtraSpaces=1 
" Put spaces on either side of commented lines
let NERDSpaceDelims=1
" To get django comments working - see Steve Losh's .vimrc:
" https://bitbucket.org/sjl/dotfiles/src/tip/vim/.vimrc


" Toggles NERDTree (Ctrl-D)
nmap <silent> <C-D> :NERDTreeToggle<CR>

" Switches to alternate window
map <Leader><Leader> <C-^>

" Toggles line numbers (F2)
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>

" Toggle search highlighting (F8)
map <F8> :set hls!<CR>
imap <F8> <ESC>:set hls!<CR>a
vmap <F8> <ESC>:set hls!<CR>gv

" Clear search highlights using ESC
" Caused problems last time - many keys entered insert mode
" nnoremap <ESC> :noh<return><ESC>

" neocomplpop hotkeys
imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>" 
smap  <tab>  <right><plug>(neocomplcache_snippets_jump) 

" remap F1 to escape
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" fold html tags
nnoremap <leader>ft Vatzf

" *** COLOURS AND SYNTAX HIGHLIGHTING ***

set t_Co=256

syntax on
let python_highlight_all=1
colorscheme wombat
" colorscheme candyman

" *** APPEARANCE ***

" Line numbers are displayed on left
set number
" But make them relative, since actual line number is displayed
" at bottom of window
" set relativenumber

" Line highlighting
set cursorline
" cursorcolumn is disabled until the 'preview window popup kills the
" autocomplete' bug gets fixed
" set cursorcolumn

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

" TextMate-like display of invisible characters
" set list
" set listchars=tab:▸\ ,eol:¬

" *** AUTOCOMPLETION ***

set completeopt=menuone,longest,preview
" menuone: menu pops up even if only one entry
" longest: inserts the longest common match, e.g. for Foo and Foz is 'Fo'
" preview: puts up a scratchpad displaying docs info for the thing autocompleted

let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_auto_select = 1 
" set wildmode=list:longest,full
" closes the scratch (tip) buffer when cursor moves in insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
" closes the scratch (tip) buffer when leave insert mode
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" *** FUNCTIONAL SETTINGS ***

" without this, need to type :s/foo/bar/g
" instead of :s/foo/bar to get replacement of more than
" the first occurance of foo on a line
set gdefault

" *** GVIM SETTINGS ***

" turn off icons
set guioptions-=T
" set guioptions-=m
" set guioptions-=L

" for indent guides plugin
" let g:indent_guides_enable_on_vim_startup = 1 
" let g:indent_guides_guide_size = 1

" *** FILETYPE-SPECIFIC SETTINGS ***

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.c,*.h set textwidth=79 " C: 79
au BufRead,BufNewFile *.py,*.pyw set textwidth=79 " Python: 79
" Wrap at 72 chars for comments.
set formatoptions=cq textwidth=72 foldignore= wildignore+=*.py[co]
au BufRead,BufNewFile *.hs set textwidth=78 " Haskell: 78

" Turn off settings in 'formatoptions' relating to comment formatting.
" - c : do not automatically insert the comment leader when wrapping based on
  " 'textwidth'
" - o : do not insert the comment leader when using 'o' or 'O' from command mode
" - r : do not insert the comment leader when hitting <Enter> in insert mode
" Python: not needed
" C: prevents insertion of '*' at the beginning of every line in a comment
au BufRead,BufNewFile *.c,*.h set formatoptions-=c formatoptions-=o formatoptions-=r

" Use UNIX (\n) line endings.
" Only used for new files so as to not force existing files to change their
" line endings.
" Python: yes
" C: yes
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" *** OTHER INTERESTING THINGS ***
" Going between vim registers and X registers
" http://www.reddit.com/r/vim/comments/m9tcz/ask_rvim_anyone_successfully_mapped_yankpaste

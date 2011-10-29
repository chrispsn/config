runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

""" NOTES
"" PEP8
" hit F5 to check python code against PEP8
" uses the pep8 plugin for vim
" needs sudo pip install pep8 on the system, though

" Custom bindings
nmap <silent> <C-D> :NERDTreeToggle<CR>
map <Leader><Leader> <C-^> "Switches to alternate file

set t_Co=256

" Autocompletion
set completeopt=menuone,longest,preview
" menuone: memu pops up even if only one entry
" longest: inserts the longest common match, e.g. for Foo and Foz is 'Fo'
" preview: puts up a scratchpad displaying docs info for the thing autocompleted

let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-n>"
let g:SuperTabLongestHighlight = 1 " selects the first entry automatically
let g:SuperTabLongestEnhanced = 1
filetype on
filetype plugin on
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"set wildmode=list:longest,full " A test

" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Syntax highlighting
syntax on
let python_highlight_all=1
colorscheme wombat
" colorscheme candyman

" enable css color highlighting for scss files
au BufRead,BufNewFile *.scss set filetype=css

" Search highlighting (toggle with F8) (experimental)
map <F8> :set hls!<CR>
imap <F8> <ESC>:set hls!<CR>a
vmap <F8> <ESC>:set hls!<CR>gv

" Make GVim minimal (experimental)
"set guioptions-=T
"set guioptions-=m
"set guioptions-=L

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

" Line numbers
set number
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR> " Turns off line numbers

" Line highlighting
set cursorline
set cursorcolumn
"" for indent guides plugin
"let g:indent_guides_enable_on_vim_startup = 1 
"let g:indent_guides_guide_size = 1

" Bad whitespace highlighting
highlight BadWhitespace ctermbg=red guibg=red
" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.c,*.h set textwidth=79 " C: 79
au BufRead,BufNewFile *.py,*.pyw set textwidth=79 " Python: 79
au BufRead,BufNewFile *.hs set textwidth=78 " Haskell: 78

" Turn off settings in 'formatoptions' relating to comment formatting.
" - c : do not automatically insert the comment leader when wrapping based on
"    'textwidth'
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

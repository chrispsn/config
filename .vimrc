runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

set t_Co=256

" Autocompletion
" filetype plugin on
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
set completeopt=menuone,longest,preview
set wildmode=list:longest,full " A test

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

" Custom bindings
nmap <silent> <C-D> :NERDTreeToggle<CR>
map <Leader><Leader> <C-^> "Switches to alternate file

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set t_Co=256

" autocompletion
" filetype plugin on
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
set completeopt=menuone,longest,preview

" syntax highlighting
syntax on
let python_highlight_all=1
colorscheme wombat
" also excellent: candyman

" filetype indent on
set autoindent
set smartindent
" set foldmethod=indent

set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

set number
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>

" Line highlighting
set cursorline
set cursorcolumn
"" for indent guides plugin
"let g:indent_guides_enable_on_vim_startup = 1 
"let g:indent_guides_guide_size = 1

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

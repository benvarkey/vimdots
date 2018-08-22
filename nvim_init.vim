" Use packages used for VIM
set packpath+=~/.vim

set encoding=utf-8  " Unicode as default
set autochdir " automatically change window's cwd to file's dir
set shell=/bin/bash  "Set shell to bash (not fish or anything ridiculous :P)
se showmatch  " Briefly jump to the matching parenthesis
imap jj <ESC> " New keybinding to enter command mode
set laststatus=2  " Always show status line
setlocal spell spelllang=en_us  " Spell check

" Cursor customization
se cursorline
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
hi CursorLine cterm=NONE ctermbg=lightgrey

se relativenumber
se number
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" Whitespace rules
se ai  " Auto-indent
se expandtab " Expand tabs to spaces
se tabstop=4 " Convert tab to 4 spaces
se shiftwidth=4  " Use 4 spaces for indentation
" Use <leader>l to toggle display of whitespace (leader is '\')
nmap <leader>l :set list!<CR>
" And set some nice chars to do it with
set listchars=tab:»\ ,eol:¬

" Page settings
se colorcolumn=120 " Marker after column 120
se textwidth=120  " Maximum width for breaking text

hi Pmenu cterm=NONE ctermbg=grey
" Highlight background
hi Search cterm=NONE ctermbg=LightCyan

" Pattern matching
se ignorecase  " not case sensitive
se smartcase  " except when search pattern has caps
se gdefault  " use /.../g by default
nnoremap <leader><space> :noh<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use powerline fonts
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
"Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EasyMotion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EasyMotion_smartcase = 1  " Smartcase like Vim's

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" indentLine
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_char = '│'
let g:indentLine_enabled = 1
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_leadingSpaceEnabled = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Close if only NERDTree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Filter filetypes
let NERDTreeIgnore = ['\.pyc$','\.pyo','\.o$']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" jedi-vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:jedi#show_call_signatures_delay = 0

" Load Pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

set encoding=utf-8  " Unicode as default

" Enable syntax support
syntax enable
filetype plugin indent on
syntax on

" automatically change window's cwd to file's dir
set autochdir

" Some sane settings
se nocp  " Remove VI compatibility
set shell=/bin/bash  "Set shell to bash (not fish or anything ridiculous :P)
au FocusLost * :wa  " Automatically save on losing focus
se hls  " Highlight on-the-fly
se showcmd  " Show running command's keystrokes
se showmatch  " Briefly jump to the matching parenthesis
" New keybinding to enter command mode
imap jj <ESC>
set laststatus=2  " Always show status line
"set updatetime=500
hi Pmenu cterm=NONE ctermbg=grey

" Cursor customization
se cursorline
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
hi CursorLine cterm=NONE ctermbg=lightgrey

" Relative line number
se number
se relativenumber
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
se colorcolumn=80 " Marker after column 80
se textwidth=79  " Maximum width for breaking text

" Pattern matching
se ignorecase  " not case sensitive
se smartcase  " except when search pattern has caps
se gdefault  " use /.../g by default
nnoremap <leader><space> :noh<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin customizations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
let g:airline_theme='solarized'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Close if only NERDTree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Filter filetypes
let NERDTreeIgnore = ['\.pyc$','\.pyo','\.o$']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EasyMotion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EasyMotion_smartcase = 1  " Smartcase like Vim's

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" minimap
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn on minimap by default

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ack.vim/ag.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
    "let g:ackprg = 'ag --nogroup --nocolor --column'
endif
" Disable opening the first result
cnoreabbrev Ack Ack!
" Add a leader
nnoremap <Leader>a :Ack!<Space>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:syntastic_python_checkers=['pylint', 'pep8']
let g:syntastic_aggregate_errors=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_enable_highlighting = 1
let g:syntastic_auto_loc_list=1
let g:syntastic_ignore_files=['.*\.tex']
let g:syntastic_loc_list_height=5

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" jedi-vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:jedi#show_call_signatures_delay = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" indentLine
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_char = '│'
let g:indentLine_enabled = 1
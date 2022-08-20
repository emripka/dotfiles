call plug#begin('~/.vim/plugged')

" vim-REPL + config
Plug 'sillybun/vim-repl'
let g:repl_program = {
            \   'python': 'ptpython',
            \   'vim': 'vim -e',
            \   }
let g:repl_predefine_python = {
            \   'numpy': 'import numpy as np',
            \   'matplotlib': 'from matplotlib import pyplot as plt',
            \   }
let g:repl_cursor_down = 1
let g:repl_python_automerge = 1
let g:repl_output_copy_to_register = "t"
nnoremap <leader>r :REPLToggle<Cr>
nnoremap <leader>e :REPLSendSession<Cr>
autocmd Filetype python nnoremap <F12> <Esc>:REPLDebugStopAtCurrentLine<Cr>
autocmd Filetype python nnoremap <F10> <Esc>:REPLPDBN<Cr>
autocmd Filetype python nnoremap <F11> <Esc>:REPLPDBS<Cr>
let g:repl_position = 3

Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'will133/vim-dirdiff'
Plug 'jreybert/vimagit'

" Git Gutter
Plug 'airblade/vim-gitgutter'
" set signcolumn=number
set updatetime=250
let g:gitgutter_max_signs = 500
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '—'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'
let g:gitgutter_set_sign_backgrounds=0

Plug 'dense-analysis/ale'
let g:ale_linters = {
\   'python':        ['flake8', 'pylint', 'mypy'],
\   'markdown':      ['mdl', 'writegood'],
\   'javascript':    ['eslint'],
\}

let g:ale_fixers = {
\   '*':          ['remove_trailing_lines', 'trim_whitespace'],
\   'python':     ['autopep8', 'isort'],
\}
let g:ale_python_pylint_options = '--rcfile '.expand('~/.vim/.python-lint')
let g:ale_python_flake8_options = '--rcfile  '.expand('~/.vim/.flake8')
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '🔰'
highlight clear ALEErrorSign
highlight clear ALEWarningSign

Plug 'Yggdroot/indentLine'
let g:indentLine_char = '|'
let g:vim_json_conceal = 0
let g:markdown_syntax_conceal = 0

Plug 'MaxMEllon/vim-jsx-pretty'
let g:vim_jsx_pretty_highlight_close_tag = 1

Plug 'tpope/vim-commentary' 

" Typescript
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
let g:instant_markdown_autostart = 0

Plug 'ap/vim-css-color'
" Color theme
Plug 'sonph/onehalf', { 'rtp': 'vim'  }

call plug#end()

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'ycm-core/YouCompleteMe'

call vundle#end()
filetype plugin indent on

let g:ycm_auto_trigger = 1
let g:ycm_enable_semantic_highlighting = 1


autocmd FileType svg setlocal shiftwidth=2 tabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2
autocmd FileType python setlocal shiftwidth=4 tabstop=4
autocmd FileType json setlocal shiftwidth=4 tabstop=4
autocmd FileType sql setlocal shiftwidth=4 tabstop=4
autocmd FileType rs setlocal shiftwidth=4 tabstop=4
autocmd FileType proto setlocal shiftwidth=4 tabstop=4

autocmd BufEnter *.tsx :setlocal filetype=typescript

set expandtab
set number
set hlsearch
set autoindent
set mouse-=a
set colorcolumn=80 
set foldmethod=indent

let g:solarized_termcolors= 256

syntax enable
syntax on

filetype plugin on

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" jump between html/xml tags
runtime macros/matchit.vim

" colorscheme desert
set background=dark

colorscheme solarized

highlight SignColumn guibg=NONE ctermbg=NONE
highlight GitGutterAdd guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

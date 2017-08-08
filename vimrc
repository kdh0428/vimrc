call plug#begin('~/.vim/plugged')

" base
Plug 'gmarik/vundle'
Plug 'https://github.com/eparreno/vim-l9.git'
Plug 'https://github.com/tpope/vim-pathogen.git'
Plug 'https://github.com/vim-scripts/cmdalias.vim.git'

" Utilities
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'https://github.com/scrooloose/nerdcommenter.git'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/kien/ctrlp.vim.git'
Plug 'https://github.com/sjl/gundo.vim.git'
Plug 'https://github.com/vim-syntastic/syntastic.git'
Plug 'https://github.com/vim-scripts/AutoComplPop.git'

" Language
Plug 'https://github.com/vim-scripts/c.vim.git'
Plug 'https://github.com/lepture/vim-jinja.git'
Plug 'https://github.com/plasticboy/vim-markdown.git'
Plug 'https://github.com/mattn/emmet-vim.git'
Plug 'https://github.com/pangloss/vim-javascript.git'
Plug 'https://github.com/nvie/vim-flake8.git'
Plug 'https://github.com/groenewege/vim-less.git'

call plug#end()
filetype plugin indent on
" vundle setting ---

colorscheme solarized 
syntax on

set nu
set expandtab
set tabstop=4 shiftwidth=4 sts=4
set autoindent
set fileformat=unix
set backspace=2
set modeline
set encoding=utf-8 fileencodings=utf-8,cp949,ucs-bom,korea,iso-2022-kr
set mouse=a

au FileType cpp    setl ts=4 sw=4 sts=4
au FileType yaml   setl ts=2 sw=2 sts=2
au FileType html   setl ts=2 sw=2 sts=2
au FileType javascript setl ts=2 sw=2 sts=2
au FileType coffee setl ts=2 sw=2 sts=2
au FileType jade setl ts=2 sw=2 sts=2
au FileType jinja  setl ts=2 sw=2 sts=2
au FileType htmldjango setl ts=2 sw=2 sts=2
au FileType make   setl ts=4 sw=4 sts=4 noet

"setlocal spell spelllang=en_us

if has("gui_running")
    set imd
    set guifont=Inconsolata\ Bold\ 14

    colorscheme ir_black

    set guioptions-=T
    set guioptions-=m
    highlight SpellBad guibg=red guifg=white
    hi Search guibg=gray guifg=blue
endif

if has("gui_macvim")
    set guifont=Inconsolata:h16.00
    set guioptions=egmrLt

    set vb
    set eb
endif

set hlsearch
hi Search  ctermbg=gray ctermfg=blue

if exists('+colorcolumn')
    set colorcolumn=80
else
    highlight OverLength ctermbg=red ctermfg=white guifg=white guibg=red match OverLength /\%81v.\+/
endif

let $JS_CMD='node'
let NERDTreeIgnore = ['\.pyc$','\.class$']
let g:gitgutter_enabled = 1

runtime! bundle/cmdalias.vim/plugin/cmdalias.vim

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

let g:syntastic_python_checkers=['flake8']
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1

let b:javascript_fold = 0
let mapleader=","
nnoremap <leader>tt :tabnew<CR>
nnoremap <leader>tw :tabnext<CR>
nnoremap <leader>] :let @/ = ""<CR>
nnoremap <leader>dd :NERDTree<CR>
nnoremap <F5> :GundoToggle<CR>
nnoremap <leader>s :w<CR>
nnoremap <leader>x :x<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>w <ESC><C-w>w
nnoremap <leader>p <ESC><C-w>p
nnoremap <leader>a i
nnoremap <leader>p :CtrlP<CR>
vnoremap <C-Insert> "+y
vnoremap <S-Insert> "+gP

nnoremap <MiddleMouse> <Nop>
nnoremap <2-MiddleMouse> <Nop>
nnoremap <3-MiddleMouse> <Nop>
nnoremap <4-MiddleMouse> <Nop>
inoremap <MiddleMouse> <Nop>
inoremap <2-MiddleMouse> <Nop>
inoremap <3-MiddleMouse> <Nop>
inoremap <4-MiddleMouse> <Nop>

function! SearchDash()
    let s:browser = "/usr/bin/open"
    let s:searchString = getline("'<")[getpos("'<")[2]-1:getpos("'>")[2]-1]
    let s:url = "\"dash://".s:searchString."\""
    let s:cmd = "silent ! " . s:browser . " " . s:url
    execute s:cmd
    redraw!
endfunction
map <leader><leader>d :call SearchDash()<CR>

function! SearchGoogle()
    let s:browser = "/usr/bin/google-chrome"
    let s:searchString = getline("'<")[getpos("'<")[2]-1:getpos("'>")[2]-1]
    let s:url = "\"http://www.google.co.kr/search?q=".s:searchString."\""
    let s:cmd = "silent ! " . s:browser . " " . s:url
    execute s:cmd
    redraw!
endfunction
map <leader><leader>g :call SearchGoogle()<CR>

map <leader><leader>j :YcmCompleter GoToDefinition<CR>

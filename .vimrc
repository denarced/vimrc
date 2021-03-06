set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set tw=80

set history=500
set nocompatible
set ruler
set number
set relativenumber
set showcmd

set hlsearch
" Works better on terminal with black background. At least can read highlighted
" text.
hi Search cterm=NONE ctermfg=black ctermbg=yellow
set nowrapscan
set nowrap

" Persistent undo
set undodir=~/.vim/undo/
set undofile

"Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

let xml_jump_string="_jmp_string_"

" Prevent new asterisk when line wraps, add it on enter
autocmd Filetype asciidoc setlocal formatoptions-=c
autocmd Filetype asciidoc setlocal formatoptions+=r
autocmd Filetype cpp setlocal equalprg=astyle
autocmd Filetype go setlocal noexpandtab
autocmd Filetype javascript setlocal autoindent equalprg=js-beautify\ -
autocmd FileType json setlocal equalprg=python3\ -m\ json.tool\ --sort-keys
autocmd FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
autocmd FileType yaml setlocal shiftwidth=2 softtabstop=2 tabstop=2

autocmd BufReadPost .babelrc set syntax=json

" Otherwise vim thinks ts files are xml files
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript


" Enable html editing with xmledit plugin
let g:xmledit_enable_html = 1

" Always show double quotes in json files
let g:vim_json_syntax_conceal = 0

" Always show status line
se laststatus=2
let g:lightline = {
      \ 'colorscheme': 'Tomorrow',
      \ }
if !has('gui_running')
  set t_Co=256
endif

" Run goimports on save instead of gofmt, it covers both
let g:go_fmt_command = "goimports"

" Use ag with ack
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif
let g:ackpreview=1
let g:ackhighlight=1

" tern_for_vim config
let tern_map_keys = 1
let tern_show_argument_hints = 1
let tern_show_signature_in_pum = 1

let g:ale_fixers = { 'python': ['isort'], 'json': ['fixjson'] }
let g:ale_fix_on_save = 1

call plug#begin('~/.vim/plugged')

Plug 'mileszs/ack.vim'
Plug 'w0rp/ale', { 'tag': 'v2.5.0' }
Plug 'davidhalter/jedi-vim'
Plug 'itchyny/lightline.vim'
Plug 'shawncplus/phpcomplete.vim'
Plug 'tomtom/tcomment_vim'
Plug 'ternjs/tern_for_vim'
Plug 'leafgarland/typescript-vim'
Plug 'chrisbra/unicode.vim'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go', { 'tag': 'v1.20' }
Plug 'elzr/vim-json'
Plug 'ludovicchabant/vim-lawrencium'
Plug 'mustache/vim-mustache-handlebars'
Plug 'prettier/vim-prettier', { 'do': 'npm install', 'for': ['javascript', 'css', 'scss', 'html'] }
Plug 'sukima/xmledit'
Plug 'arrufat/vala.vim'

call plug#end()

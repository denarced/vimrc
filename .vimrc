set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set tw=80

set history=500
set nocompatible
set ruler
set showcmd

set hlsearch
set nowrapscan
set nowrap

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
autocmd FileType json setlocal equalprg=python\ -m\ json.tool
autocmd FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

" Otherwise vim thinks ts files are xml files
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript

" Open tagbar at top or bottom
let g:tagbar_vertical = 30

" Close the window on selecting tag
let g:tagbar_autoclose = 1

" Always show the list of warnings and errors
" Not only for command :Errors
let g:syntastic_always_populate_loc_list = 1
" Just trying whether this next line fixes jumping to errors in Go source files
let g:syntastic_auto_loc_list = 1
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
" Otherwise exceedingly slow
let g:syntastic_ignore_files = ['\.java$']
let g:syntastic_go_checkers = ['go']

" Prevent jedi from automatically inserting the first method name when typing
" dot
let g:jedi#popup_on_dot = 0

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

call plug#begin('~/.vim/plugged')

Plug 'davidhalter/jedi-vim'
Plug 'itchyny/lightline.vim'
Plug 'shawncplus/phpcomplete.vim'
Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
Plug 'tomtom/tcomment_vim'
Plug 'marijnh/tern_for_vim'
Plug 'leafgarland/typescript-vim'
Plug 'chrisbra/unicode.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'fatih/vim-go', { 'tag': 'v1.7.1' }
Plug 'elzr/vim-json'
Plug 'ludovicchabant/vim-lawrencium'
Plug 'rodjek/vim-puppet'
Plug 'derekwyatt/vim-scala'
Plug 'tpope/vim-surround'
Plug 'wellle/visual-split.vim'
Plug 'sukima/xmledit'

call plug#end()

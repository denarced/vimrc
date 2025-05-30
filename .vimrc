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
set incsearch
" Works better on terminal with black background. At least can read highlighted
" text.
colorscheme slate
hi Search ctermfg=black
" Set pure black background.
hi Normal ctermbg=16
set nowrapscan
set nowrap

"Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

set foldmethod=indent
set nofoldenable

let mapleader = ','
let xml_jump_string="_jmp_string_"

nmap <leader>g <Plug>(ale_go_to_definition)
" Prevent new asterisk when line wraps, add it on enter
autocmd Filetype asciidoc setlocal formatoptions-=c
autocmd Filetype asciidoc setlocal formatoptions+=r
autocmd Filetype go setlocal noexpandtab
autocmd Filetype go setlocal tw=100
autocmd FileType go nmap <leader>e <Plug>(go-if-err)
autocmd FileType go nmap <leader>f <Plug>(go-fill-struct)
autocmd FileType go nmap <leader>r <Plug>(go-referrers)
autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)
autocmd FileType json setlocal equalprg=python3\ -m\ json.tool\ --sort-keys
autocmd FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
autocmd FileType yaml setlocal equalprg=prettier\ --parser\ yaml

" Otherwise vim thinks ts files are xml files
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx

autocmd BufNewFile *.sh 0r ~/.vim/templates/skeleton.sh | normal G
autocmd BufNewFile *.py 0r ~/.vim/templates/skeleton.py | normal 4jw
autocmd BufNewFile *.json 0r ~/.vim/templates/skeleton.json | normal l

" Enable html editing with xmledit plugin
let g:xmledit_enable_html = 1

" Always show double quotes in json files
let g:vim_json_syntax_conceal = 0

" Always show status line
se laststatus=2
let g:lightline = {
      \ 'colorscheme': 'molokai',
      \ }
if !has('gui_running')
  set t_Co=256
endif

" Run goimports on save instead of gofmt, it covers both
let g:go_fmt_command = "goimports"
" Use new vim 8.2 popup windows for Go Doc
let g:go_doc_popup_window = 1

let g:ale_completion_enabled = 1
let g:ale_floating_preview = 1
set completeopt+=noinsert
let g:ale_fixers = {'sh': ['shfmt'], 'python': ['autoimport', 'ruff_format'], 'json': ['fixjson', 'prettier'], 'yaml': ['prettier'], 'typescript': ['prettier'], 'javascript': ['prettier', 'eslint'], 'go': ['golines'], 'scss': ['prettier']}
let g:ale_fix_on_save = 1
let g:ale_linters = {'go': ['gofmt', 'golint', 'gopls', 'govet', 'revive', 'staticcheck', 'golangci-lint'], 'python': ['ruff'], 'yaml': ['yamllint']}
let g:ale_go_revive_options = '-formatter unix'

" Nvim's yaml filetype plugin sets to 2 unless the madness is stopped with this.
let g:yaml_recommended_style=0

" Search word under cursor.
nnoremap <silent><Leader>s :Rg <C-R><C-W><CR>

" Alt (default) doesn't work at all and workarounds are system specific so I'd
" rather use control. I haven't heard it being dependent on the keyboard layout.
let g:move_key_modifier = 'C'
let g:move_key_modifier_visualmode = 'C'

call plug#begin('~/.vim/plugged')

Plug 'dense-analysis/ale', { 'tag': 'v4.0.0' }
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'davidhalter/jedi-vim'
Plug 'itchyny/lightline.vim'
Plug 'raimon49/requirements.txt.vim'
Plug 'tomtom/tcomment_vim'
Plug 'SirVer/ultisnips', { 'tag': '3.2' }
Plug 'chrisbra/unicode.vim'
Plug 'sebdah/vim-delve'
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'elzr/vim-json'
Plug 'ludovicchabant/vim-lawrencium'
Plug 'pbrisbin/vim-mkdir'
Plug 'matze/vim-move'
Plug 'honza/vim-snippets'
Plug 'dhruvasagar/vim-table-mode'
Plug 'sukima/xmledit'

call plug#end()

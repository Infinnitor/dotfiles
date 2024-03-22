call plug#begin()
Plug 'csexton/trailertrash.vim'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'nanotech/jellybeans.vim'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline-themes'
Plug 'rust-lang/rust.vim'
Plug 'ervandew/supertab'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-syntastic/syntastic'
Plug 'ghifarit53/tokyonight-vim'
Plug 'ap/vim-css-color'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'jwalton512/vim-blade'
Plug 'dylanaraps/wal.vim'
Plug 'prettier/vim-prettier'
call plug#end()

set encoding=UTF-8
set autoindent
set nocindent
set noexpandtab
set copyindent
set indentexpr=""
set shiftwidth=4
set tabstop=4
set cinoptions=m1

let g:rust_recommended_style = 0
let g:rustfmt_autosave = 0
let g:python_recommended_style = 0
let g:python_highlight_string_format = 1
let g:python_highlight_builtin_objs  = 1
let g:markdown_recommended_style = 0

let g:syntastic_php_checkers = ["php", "phpcs", "phpmd"]
let g:syntastic_python_checkers = ["flake8"]
let g:syntastic_rust_checkers = ["cargo"]
let g:syntastic_mode_map = { "mode": "passive", "active_filetypes": [], "passive_filetypes": [] }

set wildmode=longest,list

set background=dark
syntax enable
set backspace=indent,eol,start
" colorscheme wal
set fillchars+=vert:│

set termguicolors
colorscheme tokyonight
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1
let g:prettier#exec_cmd_async = 1
let g:prettier#config#use_tabs = 'true'

let mapleader = " "
nmap <leader>p :NERDTreeToggle<CR>
nmap <leader>a :tabp<CR>
nmap <leader>d :tabn<CR>
nmap <leader>/ :Commentary<CR>

nmap <C-j> 15j \| zz
nmap <C-k> 15k \| zz

function NewTree()
	tabe .
	normal! 5G
endfunction

nmap <leader>t :call NewTree()<CR>
nmap <leader>r :e!<CR>

autocmd FileType rust nnoremap <leader>fm :RustFmt<CR>
autocmd FileType python nnoremap <leader>fm :0,$!yapf<Cr><C-o>
autocmd FileType html,css,javascript nmap <leader>fm <Plug>(Prettier)

let g:UltiSnipsExpandTrigger="<tab>"
let g:NERDTreeWinPos = "right"
let g:NERDTreeWinSize = 50

autocmd BufWritePre * :TrailerTrim
set whichwrap+=<,>,[,]

command W update
command Linewrap :set wrap linebreak
command Popout :execute 'silent :!alacritty --working-directory %:p:h --command bash --init-file <(echo ". \"$HOME/.bashrc\"; vim %:p") &' | redraw! | q

set number!
set nowrap
set noswapfile
set clipboard=unnamedplus

let &t_SI = "\e[5 q"
let &t_EI = "\e[2 q"
" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

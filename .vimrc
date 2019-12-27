let $VIMHOME = $HOME . '/.vim'

if !isdirectory(expand($VIMHOME . '/backups'))
	call mkdir($VIMHOME . '/backups', 'p', 0700)
endif

if !isdirectory(expand($VIMHOME . '/undos'))
	call mkdir($VIMHOME . '/undos', 'p', 0700)
endif

if !isdirectory(expand($VIMHOME . '/swaps'))
	call mkdir($VIMHOME . '/swaps', 'p', 0700)
endif

if !isdirectory(expand($VIMHOME . '/autoload'))
	call mkdir($VIMHOME . '/autoload', 'p', 0700)
endif

set directory=$VIMHOME/swaps
set undodir=$VIMHOME/undos
set backupdir=$VIMHOME/backups
set undofile
set backup

" Load vim-plug
if empty(glob($VIMHOME . '/autoload/plug.vim'))
	execute '!curl -fLo ' . $VIMHOME . '/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin($VIMHOME . '/plug')
Plug '/usr/local/opt/fzf'
Plug 'airblade/vim-gitgutter'
Plug 'hhvm/vim-hack'
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'w0rp/ale'
call plug#end()

set background=dark
syntax on
colorscheme gruvbox

" Add the g flag to search/replace by default
set gdefault
" Always show the gutter. Stops jittering on edits.
set signcolumn=yes

set mouse=a
set number
set relativenumber

set ignorecase
set smartcase
set hlsearch

set colorcolumn=91

set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab

" No error sounds
set noerrorbells
set visualbell
set t_vb=

" Always show the status line
set laststatus=2
" Allow backspacing over everything in insert mode
set backspace=indent,eol,start
" Start scrolling 3 lines away from margins
set scrolloff=3
" Wrap properly at words
set wrap linebreak

" Expand commands
set wildmenu
set wildmode=list:longest,full

" Automatic completion
let g:ale_completion_enabled = 1
" Include the linter name (e.g. 'hack' or 'hhast'), code, and message in errors
let g:ale_echo_msg_format = '[%linter%]% [code]% %s'
" Enable HHAST - this has security implications (see below)
let g:ale_linters = { 'hack': ['hack', 'hhast', 'hackfmt'] }

let g:ale_fix_on_save = 1

" Enable completion where available.
let g:ale_completion_enabled = 1

let g:ale_fixers = {
	\ '*': ['remove_trailing_lines', 'trim_whitespace', 'prettier'],
	\ 'hack': ['hackfmt']
\}

" Press `K` to view the type in the gutter
nnoremap <silent> gt :ALEHover<CR>
" Type `gd` to go to definition
nnoremap <silent> gd :ALEGoToDefinition<CR>
nnoremap gs :ALESymbolSearch

" Show type on hover in a floating bubble
if v:version >= 801
	set balloonevalterm
	let g:ale_set_balloons = 1
	let balloondelay = 250
endif

" System copy
vmap <Leader>y "+y
nmap <Leader>y "+y

" Don't replace buffer after visual paste
function! RestoreRegister()
	let @" = s:restore_reg
	return ''
endfunction

function! s:Repl()
	let s:restore_reg = @"
	return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

" Map escape to 'jk'
inoremap jk <esc>
" Map `Escape` to ‘nothing’ in Normal, Visual, Select, Operator-pending modes
noremap <esc> <nop>
" Map `Escape` to ‘nothing’ in Insert and Command modes
noremap! <esc> <nop>

" Reload vimrc after saving and keep cursor position
if !exists('*ReloadVimrc')
	fun! ReloadVimrc()
		let save_cursor = getcurpos()
		source $MYVIMRC
		call setpos('.', save_cursor)
	endfun
endif
autocmd! BufWritePost $MYVIMRC call ReloadVimrc()

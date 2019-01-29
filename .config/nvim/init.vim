if has('win32') || has ('win64')
  let $NVIMHOME = $VIM . '/vimfiles'
else
  let $NVIMHOME = $HOME . '/.config/nvim'
endif

if !isdirectory(expand($NVIMHOME . '/backups'))
  execute '!mkdir -p ' . $NVIMHOME . '/backups'
endif

if !isdirectory(expand($NVIMHOME . '/autoload'))
  execute '!mkdir -p ' . $NVIMHOME . '/autoload'
endif

set backupdir=$NVIMHOME/backups
set backup

" Load vim-plug
if empty(glob($NVIMHOME . '/autoload/plug.vim'))
  execute '!curl -fLo ' . $NVIMHOME . '/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin($NVIMHOME . '/plug')
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'mhinz/vim-startify'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'w0rp/ale'
Plug 'hhvm/vim-hack'
"Plug 'majutsushi/tagbar'
"Plug 'xolox/vim-easytags'
"Plug 'xolox/vim-misc'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

set background=dark
colorscheme gruvbox
syntax on

set mouse=a
set number
set relativenumber

set ignorecase
set smartcase
set hlsearch

set colorcolumn=81,91

set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab

" No error sounds
set noerrorbells
set visualbell
set t_vb=

set laststatus=2                " Always show the status line
set backspace=indent,eol,start  " Allow backspacing over everything in insert mode
set scrolloff=3                 " Start scrolling 3 lines away from margins
set wrap linebreak              " Wrap properly at words

" Expand commands
set wildmenu
set wildmode=list:longest,full

let g:ale_hack_hhast_executable = 'vendor/splinter/vendor/hhvm/hhast/bin/hhast-lint'
" Automatic completion
let g:ale_completion_enabled = 1
" Include the linter name (e.g. 'hack' or 'hhast'), code, and message in errors
let g:ale_echo_msg_format = '[%linter%]% [code]% %s'
" Enable HHAST - this has security implications (see below)
let g:ale_linters = { 'hack': ['hack', 'hhast'] }

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

" System copy paste
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
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

nnoremap <silent> gd :ALEGoToDefinition<CR>

" Map escape to 'jk'
inoremap jk <esc>
" Map `Escape` to ‘nothing’ in Normal, Visual, Select, Operator-pending modes
noremap <esc> <nop>
" Map `Escape` to ‘nothing’ in Insert and Command modes
noremap! <esc> <nop>

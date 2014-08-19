" Most of this is taken from here 
" http://stackoverflow.com/questions/164847/what-is-in-your-vimrc
" http://jcoffeehome.google.com/svn-history/r56/trunk/tools/linux/userHome/.vimrc
set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'gmarik/Vundle.vim'
  Plugin 'scrooloose/nerdtree'
  Plugin 'scrooloose/syntastic'
  Plugin 'kien/ctrlp.vim'
call vundle#end()
filetype plugin indent on
syntax enable
" NOTE: MAKE SURE ~/.vim/backup and ~/.vim/tmp EXIST!
" Keep vim backup files in one directory
set backup
if (has("win64") || has("win32") || has("win16"))
	\ && isdirectory(expand("%USERPROFILE%/.vim/backup")) 
	\ && isdirectory(expand("%USERPROFILE%/.vim/swaps"))
		set backupdir=%USERPROFILE%/.vim/backup
		set directory=%USERPROFILE%/.vim/swaps
		set viminfo+=n%USERPROFILE%/.vim/viminfo
elseif isdirectory(expand("~/.vim/backup")) 
	\ && isdirectory(expand("~/.vim/swaps"))
		set backupdir=~/.vim/backup
		set directory=~/.vim/swaps
		set viminfo+=n~/.vim/viminfo
else
	echo "Warning: couldn't find ~/.vim/backup or ~/.vim/tmp. Using normal backup behavior."
endif
" Set path to where vim was launched. Better use of find.
set path=$PWD/**
" No error sounds
set noerrorbells
set visualbell
set t_vb=
" Keep 2 lines above and below
set scrolloff=2
" More history! Default is 20 I think
set history=1000
" Indent according to above line
set autoindent
" Tabs over spaces (for work)
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set expandtab
" Tab to expand vim commands
set wildmenu
set wildmode=list:longest,full
" Fixes backspace problems (not deleting over line breaks) (I think)
set backspace=2
" Display line numbers
set number
" Ignore case in search
set ignorecase
" Don't ignore when I include capital characters (and other stuff?)
set smartcase
" Start search immediately!
set incsearch
" Highlight search
set hlsearch
" Automatic commands
if has("autocmd")
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
endif
" Use relative line numbers
if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
endif
" Vroooom. Check what this does later
set ttyfast
" Enable mouse in all modes
set mouse=a
set background=dark
colorscheme solarized

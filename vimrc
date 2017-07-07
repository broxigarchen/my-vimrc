" ------------------------------------------------
" Date   : 17/5/28
" Brief  : Vim Configure File
" Desc.
" Vimrc with vundle.vim 
" ------------------------------------------------
set nocompatible        " no compatible with vi
filetype off            " necessary 

set rtp+=~/.vim/bundle/Vundle.vim/     " Vundle Initialize & runtime path

" format for plugins installation using Vundle
" please add installation command between vundle#begin and vundle#end.

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'          " Let Vundle manage itself

" Plugins from Github
" Format: Plugin 'USR/REPO'


" Plugins from http://vim-scripts.org/vim/scripts.html
" Format: Plugin ‘PLUGIN_NAME’

" Navigation Taglist  -- Required: VIM6.5 + exuberant-ctags
Plugin 'taglist.vim'

" Plugins not managed by Git repo.
" Format: Plugin 'git://REPO_URL'

" Syntax solarized
Plugin 'git://github.com/altercation/vim-colors-solarized.git'

" Navigation Ctrl+P
Plugin 'git://github.com/kien/ctrlp.vim.git'

" Navigation NERDTree
Plugin 'git://github.com/scrooloose/nerdtree.git'

" Plugins from local machine
" Format: Plugin 'file://ABSOULATE_PATH'



call vundle#end()                      " Necessary
filetype plugin indent on              " Necessary

" Simple Manual of Vundle
" :PluginList          - List every installed plugins
" :PluginInstall       - Install plugin, add '!' to update or used ':PluginUpdate'
" :PluginSearch foo    - seach foo, add '!' clean local cache
" :PluginClean         - clean unused plugins with confirms, add '!' allow automatically remove plugin
" :h vundle            - Get more details, wiki and FAQ
" Insert plugins setting below this line

" Solarized Color
syntax enable
set background=light
call togglebg#map("<F5>")
colorscheme solarized

" Taglist
map <F9> :TlistToggle<CR>
let Tlist_Exit_OnlyWindow = 1    " taglist will exit when it is the only opened windows
"let Tlist_Use_Right_Window = 1   " Dis at right side
filetype on

" NerdTree
" start up automatically
map <F8> :NERDTreeToggle<CR>
" close vim when the lasted open window is nerdtree
autocmd vimenter * NERDTree    autocmd bufenter * if(winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeWinPos = 1            "Dis at right side

" Vim settig
" Insert General Configuration Under This line
set number              " Display line number
set showcmd             " Show  (partial) command in status line.
set ignorecase          " Do case insensitive matching
set smartcase           " Do smart case matching
set incsearch           " Incremental search
set autowrite           " Automatically save before commands like :next and :make
set hidden              " Hide buffers when they are abandoned
set mouse=a             " Enable mouse usage (all modes)
set nolist              " Hide Special Characters

" Backspace setting
" indent,eol,start
set backspace=indent,eol,start
" TAB settingg
set ts=4
set sw=4

" <F12> -> save
nmap <F12> :w!<cr>
imap <F12> <esc>:w!<cr>

" Abbreviate Definiation
ab #d  #define 
ab #i  #include 
ab #c  /*   */
ab #b  /**************************************************************/
ab #l  /*------------------------------------------------------------*/
ab @c  Copyright C CG. ALL Rights Reserved.

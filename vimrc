" ------------------------------------------------
" Date   : 19/6/20
" Brief  : Vim Configure File
" Desc.
" add search configuration
" ------------------------------------------------
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
set background=dark
call togglebg#map("<F11>")
colorscheme solarized

" Taglist
map <F9> :TlistToggle<CR>
map <F10> :silent !{ctags -R}<CR>
map <C-\> :tab split<CR>exec("tag".expand("<cword>"))<CR>
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
set autowrite           " Automatically save before commands like :next and :make
set hidden              " Hide buffers when they are abandoned
set mouse=a             " Enable mouse usage (all modes)
set nolist              " Hide Special Characters
set clipboard=unnamedplus   " Use + clipboard

" search preference
set ignorecase          " Do case insensitive matching
set smartcase           " Do smart case matching
set incsearch           " Incremental search
set hlsearch            " high light matches
let g:quickfix_is_open = 0
function! QuickFixToggle()
  if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
        execute g:quickfix_return_to_window . "wincmd w"
    else
        let g:quickfix_return_to_window = winnr()
        botright copen
        let g:quickfix_is_open = 1
	endif
endfunction
nnoremap <F3> :call QuickFixToggle()<CR>
map <C-f> :grep! "\<<cword>\>" %<CR>:botright copen<CR>
map <C-d> :grep! "\<<cword>\>" . -r<CR>:botright copen 33<CR>   "search recursively and display quickfix
map <C-n> :cp!<CR>       " F5 next occurence
map <C-m> :cn!<CR>       " F6 previous occurence

" yank those cheat commands, in normal mode type q: than p to paste in the opened cmdline
" how-to search for a string recursively
" :grep! "\<doLogErrorMsg\>" . -r
"
" how-to search recursively , omit log and git files
" :vimgrep /srch/ `find . -type f \| grep -v .git \| grep -v .log`
" :vimgrep /srch/ `find . -type f -name '*.pm' -o -name '*.pl'`
"
" how-to search for the "srch" from the current dir recursively in the shell
" vim -c ':vimgrep /srch/ `find . -type f \| grep -v .git \| grep -v .log`'
"
" how-to highlight the after the search the searchable string
" in normmal mode press g* when the cursor is on a matched string

" how-to jump between the search matches - open the quick fix window by
" :copen 22

" how-to to close the quick fix window
" :ccl


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
ab @c  PLEASE SEE LICENCE FILE

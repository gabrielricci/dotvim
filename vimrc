set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

Plugin 'TaskList.vim'
Plugin 'pydoc.vim'
Plugin 'SuperTab'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'nvie/vim-flake8'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'flazz/vim-colorschemes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Init ricci config

" clipboard
set clipboard=unnamed

" removes trailing spaces
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction

autocmd FileWritePre    * :call TrimWhiteSpace()
autocmd FileAppendPre   * :call TrimWhiteSpace()
autocmd FilterWritePre  * :call TrimWhiteSpace()
autocmd BufWritePre     * :call TrimWhiteSpace()

" colorschema
syntax enable
set background=dark
colorscheme jellybeans

" show line numbers
set nu

" folding
set foldmethod=indent
set foldlevel=99

"sintax highlight
syntax on                    " syntax highlighing
filetype on                  " try to detect filetypes
filetype plugin indent on    " enable loading indent file for filetype

" mark trailing whitespaces as errors
match ErrorMsg '\s\+$'

" show line limit
if exists('+colorcolumn')
  set colorcolumn=100
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>100v.\+', -1)
endif

" supertab settings
au FileType python set omnifunc=pythoncomplete#Complete
set completeopt=menuone,longest,preview

" pydoc settings
let g:pydoc_open_cmd = 'vsplit'

" vim-flake8 settings
let g:flake8_show_quickfix=1  " don't show
let g:flake8_show_in_gutter=1  " show
let g:flake8_show_in_file=1  " show
autocmd BufWritePost *.py call Flake8()

" ctrl-p settings
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc
let g:ctrlp_working_path_mode = 'a'

" ctrl-p map
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" tasklist plugin map
map <leader>td <Plug>TaskList

" pep8 plugin map
let g:pep8_map='<leader>8'

" NerdTree map
map <c-\> :NERDTreeToggle<CR>

" tab navigation mappings
set showtabline=2               " File tabs allways visible
:nmap <C-e> :tabprevious<cr>
:nmap <C-r> :tabnext<cr>
:nmap <C-t> :tabnew<cr>
:map <C-t> :tabnew<cr>
:map <C-e> :tabprevious<cr>
:map <C-r> :tabnext<cr>
:map <C-w> :tabclose<cr>
:imap <C-e> <ESC>:tabprevious<cr>i
:imap <C-r> <ESC>:tabnext<cr>i
:imap <C-t> <ESC>:tabnew<cr>

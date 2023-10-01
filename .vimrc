:set number
:set mouse=a
:set expandtab
:set hlsearch
:set ignorecase 
:set incsearch
:set smartcase
:set laststatus=2
:set autoindent
:set cursorline
:set clipboard+=unnamed
:syntax on

let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" cppファイルの設定
au FileType cpp setlocal expandtab
au FileType cpp setlocal tabstop=4
au FileType cpp setlocal shiftwidth=4
au FileType cpp setlocal softtabstop=4

set nocompatible
filetype off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call plug#begin('~/.vim/plugged')

" フォルダ管理
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" スニペット
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" 高速なコード補完エンジン
Plug 'ycm-core/YouCompleteMe'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'sheerun/vim-polyglot'
Plug 'pangloss/vim-javascript'
Plug 'majutsushi/tagbar'
Plug 'junegunn/vim-easy-align'
Plug 'jiangmiao/auto-pairs'
Plug 'phpactor/phpactor', {'for': 'php', 'tag': '*', 'do': 'composer install --no-dev -o'}

call plug#end()

nnoremap <silent><C-t> :NERDTreeToggle<CR>

filetype plugin indent on

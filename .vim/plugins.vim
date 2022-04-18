" ------------------------------------------------------------
"     To install correctly:
" ------------------------------------------------------------
" :source %
" :PlugInstall
" ------------------------------------------------------------
"     Configuration file path
" ------------------------------------------------------------
" ~/.vim/plugin-config.vim

call plug#begin('~/.vim/plugged')

Plug 'mhinz/vim-signify'
Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lambdalisue/battery.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
Plug 'luochen1990/rainbow'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/limelight.vim'
Plug 'mzlogin/vim-markdown-toc'
Plug 'tpope/vim-repeat'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-fugitive'
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline-themes'
Plug 'prettier/vim-prettier'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'dense-analysis/ale'
Plug 'preservim/tagbar'
" Plug 'SirVer/ultisnips'
Plug 'yggdroot/indentline'

call plug#end()

colorscheme dracula

"PlugInstall
"PlugUpdate
"PlugStatus
"PlugClean
"PlugUpgrade

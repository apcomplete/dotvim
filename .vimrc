set nocompatible

call plug#begin('~/.vim/plugged')

Plug 'honza/vim-snippets'
Plug 'kien/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sjl/vim-sparkup'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/bufexplorer.zip'
Plug 'dense-analysis/ale'

"Git
Plug 'airblade/vim-gitgutter'

"Rails
Plug 'tpope/vim-rails'

"Elixir
Plug 'avdgaag/vim-phoenix'
Plug 'mhinz/vim-mix-format'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

"Syntax Highlighting
" Plug 'sheerun/vim-polyglot'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

call plug#end()

runtime! config/*.vim

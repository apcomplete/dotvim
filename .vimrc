set nocompatible
filetype off

" Disable vim-jsx
let g:polyglot_disabled = ['typescriptreact']

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
Plug 'vim-scripts/UltiSnips'
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
Plug 'amiralies/coc-elixir', {'do': 'yarn install && yarn prepack'}

" Javascript
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

"Syntax Highlighting
Plug 'maxmellon/vim-jsx-pretty'
Plug 'neoclide/vim-jsx-improve'
Plug 'sheerun/vim-polyglot'

call plug#end()

filetype plugin indent on

runtime! config/*.vim

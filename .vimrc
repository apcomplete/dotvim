set nocompatible
filetype off

" bring in the bundles for mac and windows
set rtp+=~/vimfiles/vundle.git/
set rtp+=~/.vim/vundle.git/

call vundle#begin()

Bundle 'honza/vim-snippets'
Bundle 'kien/ctrlp.vim'
Bundle 'rking/ag.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'sjl/vim-sparkup'
Bundle 'tpope/vim-projectionist'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'vim-scripts/UltiSnips'
Bundle 'vim-scripts/bufexplorer.zip'
Bundle 'w0rp/ale'

"Git
Bundle 'airblade/vim-gitgutter'

"Rails
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-rails'

"Elixir
Bundle 'avdgaag/vim-phoenix'

"Syntax Highlighting
Bundle 'sheerun/vim-polyglot'

call vundle#end()

filetype plugin indent on

runtime! config/*.vim

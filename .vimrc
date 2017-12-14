set nocompatible
filetype off

" bring in the bundles for mac and windows
set rtp+=~/vimfiles/vundle.git/
set rtp+=~/.vim/vundle.git/

call vundle#begin()

Bundle 'godlygeek/tabular'
Bundle 'honza/vim-snippets'
Bundle 'kien/ctrlp.vim'
Bundle 'majutsushi/tagbar'
Bundle 'rking/ag.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'sjl/vim-sparkup'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'vim-scripts/UltiSnips'
Bundle 'vim-scripts/bufexplorer.zip'
Bundle 'w0rp/ale'

"Templating Languages
Bundle 'AndrewRadev/vim-eco'
Bundle 'mustache/vim-mustache-handlebars'
Bundle 'slim-template/vim-slim'

"Git
Bundle 'airblade/vim-gitgutter'

"Rails
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-rails'

"Clojure
Bundle 'guns/vim-clojure-static'
Bundle 'tpope/vim-fireplace'
Bundle 'tpope/vim-leiningen'

"Node
Bundle 'digitaltoad/vim-jade'

"Javascript
Bundle 'kchmck/vim-coffee-script'
Bundle 'pangloss/vim-javascript'
Bundle 'mxw/vim-jsx'

"Elixir
Bundle 'elixir-lang/vim-elixir'

"Swift
Bundle 'toyamarinyon/vim-swift'

"Golang
Bundle 'fatih/vim-go'

call vundle#end()

filetype plugin indent on

runtime! config/*.vim

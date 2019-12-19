"don't flash my screen
set novisualbell

"enable syntax highlighting
syntax on

"highlight matching brackets
set showmatch

"scroll the window when we get near the edge
set scrolloff=4 sidescrolloff=10

"use 2 spaces for tabs
set expandtab tabstop=2 softtabstop=2 shiftwidth=2
set smarttab

"show the first match as search strings are typed
set incsearch

"highlight the search matches
set hlsearch

"searching is case insensitive when all lowercase
set ignorecase smartcase

"assume the /g flag on substitutions to replace all matches in a line
set gdefault

"set temporary directory (don't litter local dir with swp/tmp files)
set directory=/tmp/

"pick up external file modifications
set autoread

"don't abandon buffers when unloading
set hidden

"match indentation of previous line
set autoindent

"don't blink the cursor
set guicursor=a:blinkon0

"show status line
set laststatus=2

"augment status line
function! ETry(function, ...)
  if exists('*'.a:function)
    return call(a:function, a:000)
  else
    return ''
  endif
endfunction
set statusline=[%n]\ %<%.99f\ %h%w%m%r%{ETry('CapsLockStatusline')}%y%{ETry('rails#statusline')}%{ETry('fugitive#statusline')}%#ErrorMsg#%*%=%-16(\ %l,%c-%v\ %)%P

"When lines are cropped at the screen bottom, show as much as possible
set display=lastline

"flip the default split directions to sane ones
set splitright
set splitbelow

"make backspace work in insert mode
set backspace=indent,eol,start

"highlight trailing whitespace
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set list

"allow lots of tabs
set tabpagemax=20

"remember last position in file
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\""| endif

"OS wide cut/copy
set clipboard=unnamed

"Custom filetypes
au BufRead,BufNewFile {Guardfile,Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby
au BufNewFile,BufRead *.json set ai filetype=javascript
au BufNewFile,BufRead *.xjs set ai filetype=javascript
au BufNewFile,BufRead *.ejs set ai filetype=html
au BufNewFile,BufRead *.mak set ai filetype=mako
au BufNewFile,BufRead *.rabl set ai filetype=ruby
au BufNewFile,BufRead *.coffee set filetype=coffee
au BufNewFile,BufRead *.cap set ai filetype=ruby

"Show Git diff in window split when commiting
au FileType gitcommit DiffGitCached | wincmd L | wincmd p

"For all text files set 'textwidth' to 78 characters.
au FileType text setlocal textwidth=78

au BufEnter * setlocal cursorline
au BufLeave * setlocal colorcolumn=0

"Language-specific Indentions
au FileType php setlocal ts=4 sts=4 sw=4 expandtab
au FileType go setlocal ts=4 sts=0 sw=4 noexpandtab nolist

"use absolute line number
set number
set relativenumber

"autocompletion list
set wildmode=list:longest

"wrap lines
set wrap

"use new regex for highlighting issues
set re=1

autocmd VimEnter * unmap <silent><expr> co

colorscheme railscasts

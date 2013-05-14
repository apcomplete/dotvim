" OS wide cut/copy
  set clipboard=unnamed

  au BufNewFile,BufRead *.xjs set ai filetype=javascript
  au BufNewFile,BufRead *.ejs set ai filetype=html
  au BufNewFile,BufRead *.rb set ai filetype=rails.ruby
  au BufNewFile,BufRead *.mak set ai filetype=mako
  au BufNewFile,BufRead Guardfile set ai filetype=ruby

" Show Git diff in window split when commiting
  au FileType gitcommit DiffGitCached | wincmd L | wincmd p

" For all text files set 'textwidth' to 78 characters.
  au FileType text setlocal textwidth=78

  au BufEnter * setlocal cursorline
  au BufLeave * setlocal colorcolumn=0

  set expandtab ts=2 sts=2 sw=2
  au FileType php setlocal ts=4 sts=4 sw=4 expandtab

" Use php syntax for html files
  au FileType html setlocal syntax=php

"use relative line numbering
  au BufEnter * set relativenumber

"show line numbers in nerdtree
  let NERDTreeShowLineNumbers = 1
  let NERDTreeIgnore = ['\.pyc$']

"autocompletion list
  set wildmode=list:longest

" wrap lines
  set wrap

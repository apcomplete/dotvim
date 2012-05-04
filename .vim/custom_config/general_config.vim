" OS wide cut/copy
  set clipboard=unnamed

" MASS is JS
  au BufNewFile,BufRead *.xjs set ai filetype=javascript
  
" Show Git diff in window split when commiting
  au FileType gitcommit DiffGitCached | wincmd L | wincmd p

" For all text files set 'textwidth' to 78 characters.
  au FileType text setlocal textwidth=78

  au BufEnter * setlocal cursorline
  au BufLeave * setlocal nocursorline
  au BufLeave * setlocal colorcolumn=0 

  au FileType php setlocal ts=4 sts=4 sw=4
  au FileType html setlocal ts=4 sts=4 sw=4

"use relative line numbering
  au BufEnter * set relativenumber

"show line numbers in nerdtree
  let NERDTreeShowLineNumbers = 1

"override default behavior to allow unsaved buffers to be hidden
  set hidden

"autocompletion list
  set wildmode=list:longest

" allow backspacing over everything in insert mode
  set backspace=indent,eol,start

" incremental searching
  set incsearch

" wrap lines
  set wrap!

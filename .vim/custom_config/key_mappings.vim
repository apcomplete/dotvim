" remap jj to exit visual mode
  imap jj <Esc>

" Clear highlighting for search
  noremap <silent><Leader>/ :nohls<CR>

" Disable middle mouse click
  map <MiddleMouse> <Nop>
  imap <MiddleMouse> <Nop>

" NERDTree mapping
  map <leader>w :NERDTreeToggle<CR>

"Open the taglist
  nnoremap <silent> ,T :TagbarToggle<CR>

"Save using sudo access
  cmap w!! %!sudo tee > /dev/null %

"remap leader to ,
let mapleader = ','

"insert blank lines without going into insert mode
nmap go o<esc>
nmap gO O<esc>

"mapping the jumping between splits. Hold control while using vim nav.
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-H> <C-W>h
nmap <C-L> <C-W>l

"shortcut for =>
imap <C-l> <Space>=><Space>

"handy macro expansion
iabbrev Lidsa Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum
iabbrev rdebug require 'ruby-debug'; Debugger.start; Debugger.settings[:autoeval] = 1; Debugger.settings[:autolist] = 1; debugger; 0;
abbrev hte the

"Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

"clean up trailing whitespace map 
map <Leader>e :%s/\s\+$<cr>

"make tab key match bracket pairs
nnoremap <tab> %
vnoremap <tab> %

"buffer resizing mappings (shift + arrow key)
nnoremap <S-Up> <c-w>+
nnoremap <S-Down> <c-w>-
nnoremap <S-Left> <c-w><
nnoremap <S-Right> <c-w>>

"remap jj to exit visual mode
imap jj <Esc>

"Clear highlighting for search
noremap <silent><Leader>/ :nohls<CR>

"Disable middle mouse click
map <MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>

"NERDTree mapping
map <leader>w :NERDTreeToggle<CR>

"Open the taglist
nnoremap <silent> ,T :TagbarToggle<CR>

"Save using sudo access
cmap w!! %!sudo tee > /dev/null %

"shortcut to align text with Tabular
map <Leader>a :Tabularize<space>

" go file shortcuts
augroup go
  autocmd!
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
augroup END

augroup rails
  " javascript alternates
  autocmd User Rails/app/assets/javascripts/*/*.js let b:rails_alternate = substitute(substitute(rails#buffer().path(), 'app/assets', 'app/assets', ''), '\.js', '.test.js', '')
  autocmd User Rails/app/javascripts/*/*.js let b:rails_alternate = substitute(substitute(rails#buffer().path(), 'app', 'app', ''), '\.js', 'test.js', '')
  autocmd User Rails/app/javascripts/*/*.test.js let b:rails_alternate = substitute(substitute(rails#buffer().path(), 'app/javascripts', 'app/javascripts', ''), '.test.js', '.js', '')
augroup END

" enable 256 colors
set t_Co=256

let NERDTreeHijackNetrw = 0
"show line numbers in nerdtree
let NERDTreeShowLineNumbers = 1
let NERDTreeIgnore = ['\.pyc$']
nmap g :NERDTree \| NERDTreeToggle \| NERDTreeFind<CR>

" add space after comment character
let g:NERDSpaceDelims = 1

" Ultisnips advance using tab instead of <c-j>
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Ultisnips add custom snippets folder
let g:UltiSnipsSnippetDirectories=["bundle/UltiSnips/UltiSnips","config/snippets"]

" # to surround with ruby string interpolation
let g:surround_35 = "#{\r}"
" - to surround with no-output erb tag
let g:surround_45 = "<% \r %>"
" = to surround with output erb tag
let g:surround_61 = "<%= \r %>"

augroup sparkup_types
  "Remove ALL autocommands of the current group.
  autocmd!
  "Add sparkup to new filetypes
  autocmd FileType mako,php,eco runtime! ftplugin/html/sparkup.vim
augroup END

set wildignore+=*/vendor/*,*/tmp/*,*/node_modules/*,*/bower_components/*

let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""' " Use ag in CtrlP for listing files. Fast and respects .gitignore

" Only run linters when saving file
let g:ale_lint_on_text_changed = 'never'

let g:ale_javascript_eslint_suppress_missing_config = 1

let g:ale_linters = {
\ 'javascript': ['eslint']
\}

" Skip linting on jsx files for PFF
let g:ale_pattern_options = {
\ '\.ex$': {'ale_linters': [], 'ale_fixers': []},
\ '\.exs$': {'ale_linters': [], 'ale_fixers': []},
\}

" Do not go to active window.
let g:bufExplorerFindActive=0

" Highlight jsx in js files
let g:jsx_ext_required = 0

" Configure projections
let g:projectionist_heuristics = {
    \ "*": {
    \   "*.ex": { "alternate": "test/{}_test.exs" },
    \   "test/*_test.exs": { "alternate": "{}.ex" },
    \   "pff/*.js": { "alternate": "pff/{}.test.js" },
    \   "pff/*.test.js": { "alternate": "pff/{}.js" },
    \ },
    \ }

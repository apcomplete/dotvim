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

" use goimports for formatting
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

function! CustomTabularPatterns()
  if exists('g:tabular_loaded')
    AddTabularPattern! symbols         / :/l0
    AddTabularPattern! hash            /^[^>]*\zs=>/
    AddTabularPattern! chunks          / \S\+/l0
    AddTabularPattern! assignment      / = /l0
    AddTabularPattern! comma           /^[^,]*,/l1
    AddTabularPattern! colon           /:\zs /l0
    AddTabularPattern! options_hashes  /:\w\+ =>/
  endif
endfunction
autocmd VimEnter * call CustomTabularPatterns()

let g:syntastic_enable_signs=1
let g:syntastic_check_on_open = 1
let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_disabled_filetypes = ['sass']
let g:syntastic_ruby_checkers = ['mri','rubocop']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_go_checkers = ['go', 'golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': [] }
let g:go_list_type = "quickfix"

augroup sparkup_types
  "Remove ALL autocommands of the current group.
  autocmd!
  "Add sparkup to new filetypes
  autocmd FileType mako,php,eco runtime! ftplugin/html/sparkup.vim
augroup END

set wildignore+=*/vendor/*,*/tmp/*,*/node_modules/*,*/bower_components/*

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

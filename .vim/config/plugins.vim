"enable 256 colors
set t_Co=256

let NERDTreeHijackNetrw = 0
"show line numbers in nerdtree
let NERDTreeShowLineNumbers = 1
let NERDTreeIgnore = ['\.pyc$']
nmap g :NERDTree \| NERDTreeToggle \| NERDTreeFind<CR>

"Ultisnips advance using tab instead of <c-j>
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"Ultisnips add custom snippets folder
let g:UltiSnipsSnippetDirectories=["bundle/UltiSnips/UltiSnips","config/snippets"]

"# to surround with ruby string interpolation
let g:surround_35 = "#{\r}"
"- to surround with no-output erb tag
let g:surround_45 = "<% \r %>"
"= to surround with output erb tag
let g:surround_61 = "<%= \r %>"

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
"let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_disabled_filetypes = ['sass']

augroup sparkup_types
  "Remove ALL autocommands of the current group.
  autocmd!
  "Add sparkup to new filetypes
  autocmd FileType mako,php,eco runtime! ftplugin/html/sparkup.vim
augroup END

set wildignore+=*/vendor/*,*/tmp/*,*/node_modules/*,*/bower_components/*

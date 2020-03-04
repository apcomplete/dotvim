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

set wildignore+=*/vendor/*,*/tmp/*,*/node_modules/*,*/bower_components/*,*/coverage*

" Only run linters when saving file
let g:ale_lint_on_text_changed = 'never'

let g:ale_linters = {
\ 'elixir': ['credo'],
\ 'javascript': ['eslint']
\}

" Do not go to active window.
let g:bufExplorerFindActive = 0

" Highlight jsx in js files
let g:jsx_ext_required = 0

" Configure projections
let g:projectionist_heuristics = {
    \ "*": {
    \  "lib/**/views/*_view.ex": {
    \     "type": "view",
    \     "alternate": "test/{dirname}/views/{basename}_view_test.exs",
    \     "template": [
    \       "defmodule {dirname|camelcase|capitalize}.{basename|camelcase|capitalize}View do",
    \       "  use {dirname|camelcase|capitalize}, :view",
    \       "end"
    \     ]
    \   },
    \   "test/**/views/*_view_test.exs": {
    \     "alternate": "lib/{dirname}/views/{basename}_view.ex",
    \     "type": "test",
    \     "template": [
    \       "defmodule {dirname|camelcase|capitalize}.{basename|camelcase|capitalize}ViewTest do",
    \       "  use ExUnit.Case, async: true",
    \       "",
    \       "  alias {dirname|camelcase|capitalize}.{basename|camelcase|capitalize}View",
    \       "end"
    \     ]
    \   },
    \   "lib/**/controllers/*_controller.ex": {
    \     "type": "controller",
    \     "alternate": "test/{dirname}/controllers/{basename}_controller_test.exs",
    \     "template": [
    \       "defmodule {dirname|camelcase|capitalize}.{basename|camelcase|capitalize}Controller do",
    \       "  use {dirname|camelcase|capitalize}, :controller",
    \       "end"
    \     ]
    \   },
    \   "test/**/controllers/*_controller_test.exs": {
    \     "alternate": "lib/{dirname}/controllers/{basename}_controller.ex",
    \     "type": "test",
    \     "template": [
    \       "defmodule {dirname|camelcase|capitalize}.{basename|camelcase|capitalize}ControllerTest do",
    \       "  use {dirname|camelcase|capitalize}.ConnCase, async: true",
    \       "end"
    \     ]
    \   },
    \   "lib/**/channels/*_channel.ex": {
    \     "type": "channel",
    \     "alternate": "test/{dirname}/channels/{basename}_channel_test.exs",
    \     "template": [
    \       "defmodule {dirname|camelcase|capitalize}.{basename|camelcase|capitalize}Channel do",
    \       "  use {dirname|camelcase|capitalize}, :channel",
    \       "end"
    \     ]
    \   },
    \   "test/**/channels/*_channel_test.exs": {
    \     "alternate": "lib/{dirname}/channels/{basename}_channel.ex",
    \     "type": "test",
    \     "template": [
    \       "defmodule {dirname|camelcase|capitalize}.{basename|camelcase|capitalize}ChannelTest do",
    \       "  use {dirname|camelcase|capitalize}.ChannelCase, async: true",
    \       "",
    \       "  alias {dirname|camelcase|capitalize}.{basename|camelcase|capitalize}Channel",
    \       "end"
    \     ]
    \   },
    \   "test/**/features/*_test.exs": {
    \     "type": "feature",
    \     "template": [
    \       "defmodule {dirname|camelcase|capitalize}.{basename|camelcase|capitalize}Test do",
    \       "  use {dirname|camelcase|capitalize}.FeatureCase, async: true",
    \       "end"
    \     ]
    \   },
    \   "lib/*.ex": {
    \     "alternate": "test/{}_test.exs",
    \     "type": "source",
    \     "template": [
    \       "defmodule {camelcase|capitalize|dot} do",
    \       "end"
    \     ]
    \   },
    \   "test/*_test.exs": {
    \     "alternate": "lib/{}.ex",
    \     "type": "test",
    \     "template": [
    \       "defmodule {camelcase|capitalize|dot}Test do",
    \       "  use ExUnit.Case, async: true",
    \       "",
    \       "  alias {camelcase|capitalize|dot}",
    \       "end"
    \     ]
    \   },
    \   "pff/*.js": { "type": "test", "alternate": "pff/{}.test.js" },
    \   "pff/*.jsx": { "type": "test", "alternate": "pff/{}.test.js" },
    \   "pff/*.test.js": { "type": "src", "alternate": ["pff/{}.js", "pff/{}.jsx"] },
    \ },
    \ }

" Don't navigate to first result
cnoreabbrev Ack Ack!

" Disable vim-jsx
let g:polyglot_disabled = ['jsx']

filetype off

"enable 256 colors
set t_Co=256

"Custom configuration of plugins
"http://www.vim.org/scripts/script.php?script_id=2175
colorscheme railscasts

Bundle "git://github.com/scrooloose/nerdtree.git"
  let NERDTreeHijackNetrw = 0
  "show line numbers in nerdtree
  let NERDTreeShowLineNumbers = 1
  let NERDTreeIgnore = ['\.pyc$']
  nmap g :NERDTree \| NERDTreeToggle \| NERDTreeFind<CR>

Bundle 'vim-scripts/UltiSnips'
  "Ultisnips advance using tab instead of <c-j>
  let g:UltiSnipsExpandTrigger="<tab>"
  let g:UltiSnipsJumpForwardTrigger="<tab>"
  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

  "Ultisnips add custom snippets folder
  let g:UltiSnipsSnippetDirectories=["bundle/UltiSnips/UltiSnips","config/snippets"]

"Ultisnips default snippets
Plugin 'honza/vim-snippets'

Bundle "git://github.com/tpope/vim-repeat.git"

Bundle "git://github.com/tpope/vim-surround.git"
  "# to surround with ruby string interpolation
  let g:surround_35 = "#{\r}"
  "- to surround with no-output erb tag
  let g:surround_45 = "<% \r %>"
  "= to surround with output erb tag
  let g:surround_61 = "<%= \r %>"

"Tabular for aligning text
Bundle "git://github.com/godlygeek/tabular.git"
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

"Unimpaired for keymaps for quicky manipulating lines and files
Bundle "git://github.com/tpope/vim-unimpaired.git"

"Syntastic for catching syntax errors on save
Bundle "git://github.com/scrooloose/syntastic.git"
  let g:syntastic_enable_signs=1
  "let g:syntastic_quiet_messages = {'level': 'warnings'}
  let g:syntastic_disabled_filetypes = ['sass']

Bundle 'vim-scripts/bufexplorer.zip'
"Use version 7.2.8

Bundle 'scrooloose/nerdcommenter'

Bundle 'sjl/vim-sparkup'
  augroup sparkup_types
    "Remove ALL autocommands of the current group.
    autocmd!
    "Add sparkup to new filetypes
    autocmd FileType mako,php,eco runtime! ftplugin/html/sparkup.vim
  augroup END

Bundle 'kien/ctrlp.vim'
  set wildignore+=*/vendor/*,*/tmp/*,*/node_modules/*,*/bower_components/*

Bundle 'majutsushi/tagbar'

Bundle 'rking/ag.vim'

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

filetype plugin indent on

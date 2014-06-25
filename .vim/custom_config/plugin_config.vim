filetype off

  "enable 256 colors
  set t_Co=256

  "Custom configuration of plugins
  "http://www.vim.org/scripts/script.php?script_id=2175
  colorscheme railscasts

  Bundle 'vim-scripts/UltiSnips'
    "Ultisnips advance using tab instead of <c-j>
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<tab>"
    let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

    "Ultisnips add custom snippets folder
    let g:UltiSnipsSnippetDirectories=["bundle/UltiSnips/UltiSnips","custom_config/snippets"]

  Bundle 'vim-scripts/bufexplorer.zip'
  "7.2.8

  Bundle 'scrooloose/nerdcommenter'

  Bundle 'sjl/vim-sparkup'
    augroup sparkup_types
      " Remove ALL autocommands of the current group.
      autocmd!
      " Add sparkup to new filetypes
      autocmd FileType mako,php,eco runtime! ftplugin/html/sparkup.vim
    augroup END

  Bundle 'kien/ctrlp.vim'
    let g:ctrlp_map = ',t'
    set wildignore+=*/vendor/*,*/tmp/*,*/node_modules/*,*/bower_components/*

  Bundle 'kchmck/vim-coffee-script'
    au BufNewFile,BufRead *.coffee set filetype=coffee

  Bundle 'AndrewRadev/vim-eco'

  Bundle 'majutsushi/tagbar'

  Bundle 'tpope/vim-endwise'

  Bundle 'mustache/vim-mustache-handlebars'

  Bundle 'tpope/vim-rails'

  Bundle 'rking/ag.vim'

  Bundle 'airblade/vim-gitgutter'

filetype plugin indent on

filetype off

  "enable 256 colors
  set t_Co=256

  "Custom configuration of plugins
  "http://www.vim.org/scripts/script.php?script_id=2175
  colorscheme railscasts

  Bundle "git://github.com/vim-scripts/UltiSnips.git"
    "Ultisnips advance using tab instead of <c-j>
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<tab>"
    let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

    "Ultisnips add custom snippets folder
    let g:UltiSnipsSnippetDirectories=["bundle/UltiSnips/UltiSnips","custom_config/snippets"]

  Bundle "git://github.com/vim-scripts/bufexplorer.zip.git"
  "7.2.8

  Bundle "git://github.com/scrooloose/nerdcommenter.git"

  Bundle "git://github.com/sjl/vim-sparkup.git"
    augroup sparkup_types
      " Remove ALL autocommands of the current group.
      autocmd!
      " Add sparkup to new filetypes
      autocmd FileType mako,php runtime! ftplugin/html/sparkup.vim
    augroup END

  Bundle 'git://git.wincent.com/command-t.git'
    set wildignore+=vendor/cache/*,vendor/ruby/*

  Bundle 'git://github.com/apcomplete/html_entities_helper.vim.git'

  Bundle 'git://github.com/kchmck/vim-coffee-script.git'
    au BufNewFile,BufRead *.coffee set filetype=coffee

  Bundle 'git://github.com/majutsushi/tagbar'

  Bundle 'git://github.com/tpope/vim-endwise.git'

filetype plugin indent on

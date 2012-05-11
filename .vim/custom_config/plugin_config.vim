filetype off
" Custom configuration of plugins
  Bundle "git://github.com/rickharris/vim-monokai.git"
    "enable 256 colors
    set t_Co=256
    "use monokai colorscheme
    colorscheme monokai

  Bundle "git://github.com/vim-scripts/UltiSnips.git"
    "Ultisnips advance using tab instead of <c-j>
    let g:UltiSnipsExpandTrigger="<tab>" 
    let g:UltiSnipsJumpForwardTrigger="<tab>" 
    let g:UltiSnipsJumpBackwardTrigger="<s-tab>" 

    "Ultisnips add custom snippets folder
    let g:UltiSnipsSnippetDirectories=["bundle/UltiSnips/UltiSnips","custom_config/snippets"]

  Bundle "git://github.com/vim-scripts/bufexplorer.zip.git"

  Bundle "git://github.com/scrooloose/nerdcommenter.git"

  Bundle "git://github.com/sjl/vim-sparkup.git"

  Bundle 'git://git.wincent.com/command-t.git'

  Bundle 'git://github.com/padgetap/html_entities_helper.vim.git'
filetype plugin indent on

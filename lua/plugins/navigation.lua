return {
  {
    'preservim/nerdtree',
    config = function()
      vim.api.nvim_set_keymap('', '<Leader>w', ':NERDTreeToggle<CR>', { noremap = true })
    end
  },
  {
    'vim-scripts/bufexplorer.zip',
    config = function()
      vim.g.bufExplorerFindActive = 0
    end
  },
  {
    'mileszs/ack.vim',
    config = function()
      vim.g.ackprg = 'rg --vimgrep --smart-case'
      vim.cmd('cnoreabbrev Ack Ack!')
    end
  },
  {
    'tpope/vim-projectionist',
    config = function()
      require("projectionist").setup()
    end
  },
}

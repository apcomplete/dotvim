-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use { 'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    branch = '0.1.x',
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<C-p>', builtin.find_files, {})
      vim.keymap.set('n', 'fg', builtin.live_grep, {})
      vim.keymap.set('n', 'fb', builtin.buffers, {})
      vim.keymap.set('n', 'fh', builtin.help_tags, {})
    end
  }

  use 'scrooloose/nerdcommenter'

  use {
    'preservim/nerdtree',
    config = function()
      vim.api.nvim_set_keymap('', '<Leader>w', ':NERDTreeToggle<CR>', { noremap = true })
    end
  }

  use {
    'rgroli/other.nvim',
    config = function()
      require('other-nvim').setup({
        mappings = {
          {
            pattern = '/(.*)/(.*).tsx?$',
            target = {
              {
                target = '/%1/%2.test.tsx',
                context = 'tsx'
              },
              {
                target = '/%1/%2.test.ts',
                context = 'ts'
              },
            },
            context = 'source'
          },
          {
            pattern = '/(.*)/(.*).test.tsx?$',
            target = {
              {
                target = '/%1/%2.tsx',
                context = 'tsx'
              },
              {
                target = '/%1/%2.ts',
                context = 'ts'
              },
            },
            context = 'test'
          },
          {
            pattern = '/test/(.*)/(.*)_test.exs$',
            target = '/lib/%2/%3.ex',
            context = 'elixir source'
          },
          {
            pattern = '/lib/(.*)/(.*).ex$',
            target = '/test/%2/%3_test.exs',
            context = 'elixir test'
          },
        },
        style = {
          -- How the plugin paints its window borders
          -- Allowed values are none, single, double, rounded, solid and shadow
          border = "solid",
          -- Column seperator for the window
          seperator = "|",
          -- width of the window in percent. e.g. 0.5 is 50%, 1.0 is 100%
          width = 0.7,
          -- min height in rows.
          -- when more columns are needed this value is extended automatically
          minHeight = 2
        },
      })

      vim.cmd 'command! A Other'
      vim.cmd 'command! AV OtherVSplit'
    end
  }

  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'

  use {
    'vim-scripts/bufexplorer.zip',
    config = function()
      vim.g.bufExplorerFindActive = 0
    end
  }

  -- Better file searching
  use {
    'mileszs/ack.vim',
    config = function()
      vim.g.ackprg = 'rg --vimgrep --smart-case'
      vim.cmd('cnoreabbrev Ack Ack!')
    end
  }

  -- ========== LSP ============
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }

  use {
    "someone-stole-my-name/yaml-companion.nvim",
    requires = {
      { "neovim/nvim-lspconfig" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
    },
    config = function()
      require("telescope").load_extension("yaml_schema")
    end,
  }

  require('mason').setup()
  require("mason-lspconfig").setup({
    ensure_installed = {
      'bashls',
      'cssls',
      'dockerls',
      'elixirls',
      'html',
      'jsonls',
      'marksman', -- markdown
      'pyright',
      'ruby_ls',
      'sqlls',
      'lua_ls',
      'tsserver',
    },
    automatic_installation = true,
  })

  -- Use Neovim as a language server to inject LSP diagnostics, code
  -- actions, and more via Lua.
  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      -- 'lukas-reineke/lsp-format.nvim',
    },
    config = function()
      local b = require('null-ls.builtins')
      -- local lsp_format = require('lsp-format')
      require('null-ls').setup({
        sources = {
          ----------------------
          --   Code Actions   --
          ----------------------
          b.code_actions.eslint,
          b.code_actions.shellcheck,

          ----------------------
          --    Diagnostics   --
          ----------------------
          b.diagnostics.actionlint,
          b.diagnostics.codespell,

          b.diagnostics.credo.with {
            -- run credo in strict mode even if strict mode is not enabled in
            -- .credo.exs
            extra_args = { '--strict' },
            -- only register credo source if it is installed in the current project
            condition = function(_utils)
              local cmd = { 'rg', ':credo', 'mix.exs' }
              local credo_installed = ('' == vim.fn.system(cmd))
              return not credo_installed
            end,
          },
          b.diagnostics.eslint,
          b.diagnostics.yamllint,
          b.diagnostics.cfn_lint,
          -- require 'plugins.null-ls.commitlint',

          -- ----------------------
          -- --    Formatters    --
          -- ----------------------
          -- -- Doesn't work for heex files
          -- b.formatting.mix.with {
          --   extra_filetypes = { 'eelixir', 'heex' },
          --   args = { 'format', '-' },
          --   extra_args = function(_params)
          --     local version_output = vim.fn.system 'elixir -v'
          --     local minor_version = vim.fn.matchlist(version_output, 'Elixir \\d.\\(\\d\\+\\)')[2]
          --
          --     local extra_args = {}
          --
          --     -- tells the formatter the filename for the code passed to it via stdin.
          --     -- This allows formatting heex files correctly. Only available for
          --     -- Elixir >= 1.14
          --     if tonumber(minor_version, 10) >= 14 then
          --       extra_args = { '--stdin-filename', '$FILENAME' }
          --     end
          --
          --     return extra_args
          --   end,
          -- },
          -- b.formatting.pg_format,
          b.formatting.prettier,
          -- b.formatting.shfmt,
          -- b.formatting.stylua,

          -- python
          b.diagnostics.flake8.with {
            command = '.venv/bin/flake8',
          },
          -- b.formatting.isort.with {
          --   command = '.venv/bin/isort',
          -- },
          -- b.formatting.black.with {
          --   command = '.venv/bin/black',
          -- },
        },
        -- on_attach = function(client)
        --   if client.supports_method 'textDocument/formatting' then
        --     lsp_format.on_attach(client)
        --   end
        -- end,
      })
    end
  }

  -- Use internal formatting for bindings like gq. null-ls or neovim messes this up somehow
  vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
      vim.bo[args.buf].formatexpr = nil
    end,
  })

  -- Mappings.
  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  local opts = { noremap = true, silent = true }
  vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', '<LEADER>q', vim.diagnostic.setloclist, opts)

  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', '<C-]>', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<LEADER>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<LEADER>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<LEADER>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, bufopts)
    vim.keymap.set('n', '<LEADER>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<LEADER>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<LEADER>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<LEADER>p', function() vim.lsp.buf.format { async = true } end, bufopts)
  end

  local lsp_flags = {
    debounce_text_changes = 150
  }

  -- hook up cmp_nvim_lsp for completion
  local lspconfig = require('lspconfig')
  local lsp_defaults = lspconfig.util.default_config
  lsp_defaults.capabilities = vim.tbl_deep_extend('force', lsp_defaults.capabilities,
    require('cmp_nvim_lsp').default_capabilities())

  require('lspconfig')['bashls'].setup({ flags = lsp_flags, on_attach = on_attach })
  require('lspconfig')['cssls'].setup({ flags = lsp_flags, on_attach = on_attach })
  require('lspconfig')['dockerls'].setup({ flags = lsp_flags, on_attach = on_attach })
  require('lspconfig')['elixirls'].setup({ flags = lsp_flags, on_attach = on_attach })
  require('lspconfig')['html'].setup({ flags = lsp_flags, on_attach = on_attach })
  require('lspconfig')['jsonls'].setup({ flags = lsp_flags, on_attach = on_attach })
  require('lspconfig')['marksman'].setup({ flags = lsp_flags, on_attach = on_attach }) -- markdown
  require('lspconfig')['pyright'].setup({ flags = lsp_flags, on_attach = on_attach })
  require('lspconfig')['ruby_ls'].setup({ flags = lsp_flags, on_attach = on_attach })
  require('lspconfig')['sqlls'].setup({ flags = lsp_flags, on_attach = on_attach })
  require('lspconfig')['lua_ls'].setup({
    flags = lsp_flags,
    on_attach = on_attach,
    settings = {
      Lua = {
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { 'vim' },
        },
      },
    },
  })
  require('lspconfig')['tsserver'].setup({ flags = lsp_flags, on_attach = on_attach })

  -- Just needed if I have problems
  vim.lsp.set_log_level("debug")

  -- -- ========== Completeion ============
  -- Snippets, need to understand more about how to use this
  use {
    'L3MON4D3/LuaSnip',
    tag = 'v1.*',
    config = function()
      require('luasnip.loaders.from_vscode').lazy_load({ paths = './snippets' })
    end
  }
  use('rafamadriz/friendly-snippets') -- language specific snippets

  use('saadparwaiz1/cmp_luasnip')     -- completion from snippets
  use('hrsh7th/cmp-nvim-lsp')         -- completion from LSP
  use('hrsh7th/cmp-buffer')           -- completion from this buffer
  use('hrsh7th/cmp-path')             -- completion from file paths

  -- The basis for configuring completion
  vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
  use {
    'hrsh7th/nvim-cmp',
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')

      local select_opts = { behavior = cmp.SelectBehavior.Select }

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end
        },
        sources = {
          { name = 'path' },
          { name = 'nvim_lsp', keyword_length = 3 },
          { name = 'buffer',   keyword_length = 3 },
          { name = 'luasnip',  keyword_length = 2 },
        },
        window = {
          documentation = cmp.config.window.bordered()
        },
        formatting = {
          fields = { 'menu', 'abbr', 'kind' },
          format = function(entry, item)
            local menu_icon = {
              nvim_lsp = 'λ',
              luasnip = '⋗',
              buffer = 'Ω',
              path = '🖫',
            }

            item.menu = menu_icon[entry.source.name]
            return item
          end,
        },
        mapping = {
          ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
          ['<Down>'] = cmp.mapping.select_next_item(select_opts),
          ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
          ['<C-n>'] = cmp.mapping.select_next_item(select_opts),
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<C-d>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(1) then
              luasnip.jump(1)
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<C-b>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<Tab>'] = cmp.mapping(function(fallback)
            local col = vim.fn.col('.') - 1

            if cmp.visible() then
              cmp.select_next_item(select_opts)
            elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
              fallback()
            else
              cmp.complete()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item(select_opts)
            else
              fallback()
            end
          end, { 'i', 's' }),
        },
      })
    end
  }

  -- Rails
  -- use 'tpope/vim-rails'

  -- Elixir
  use { 'mhinz/vim-mix-format', ft = { 'elixir' } }
  use { 'avdgaag/vim-phoenix', ft = { 'elixir' } }

  -- Git
  use 'airblade/vim-gitgutter'

  -- some stupid config around gitgutter to keep line numbers showing up
  vim.cmd('highlight clear SignColumn')
  vim.cmd('highlight GitGutterAdd ctermfg=2')
  vim.cmd('highlight GitGutterChange ctermfg=3')
  vim.cmd('highlight GitGutterDelete ctermfg=1')
  vim.cmd('highlight GitGutterChangeDelete ctermfg=4')

  -- Syntax Highlighting

  use {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    requires = { { 'nvim-treesitter/playground' } },
    config = function()
      require('nvim-treesitter.configs').setup({
        -- A list of parser names, or "all"
        ensure_installed = {
          'bash',
          'comment',
          'css',
          'dockerfile',
          'eex',
          'elixir',
          'erlang',
          'go',
          'heex',
          'javascript',
          'json',
          'lua',
          'markdown',
          'python',
          'ruby',
          'rust',
          'scss',
          'tsx',
          'typescript',
          'vim',
        },
        sync_install = false,
        -- Automatically install missing parsers when entering buffer
        ignore_install = { 'javascript' },
        auto_install = true,
        highlight = {
          enabled = true,
          additional_vim_regex_highlighting = true,
        },
      })
    end
  }

  use {
    'mhanberg/output-panel.nvim',
    config = function()
      require('output_panel').setup()
    end
  }

  use {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup({
        options = {
          icons_enabled = true,
          theme = 'auto',
        },
        sections = {
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = {
            {
              'filename',
              file_status = true, -- displays file status (readonly status, modified status)
              path = 1            -- 1 - Relative path, 2 -- absolute path
            },
          },
        },
        inactive_sections = {
          lualine_c = {
            {
              'filename',
              path = 1 -- 1 - Relative path, 2 -- absolute path
            }
          },
        },
      })
    end
  }
end)

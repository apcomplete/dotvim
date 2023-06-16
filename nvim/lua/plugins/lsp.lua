return {
  {
    "williamboman/mason.nvim",
    config = function()
      require('mason').setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          'bashls',
          'cssls',
          'dockerls',
          --'elixirls',
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
    end
  },
  "williamboman/mason-lspconfig.nvim",
  {
    "neovim/nvim-lspconfig",
    config = function()
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
        vim.keymap.set('n', '<LEADER>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
          bufopts)
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

      lspconfig.bashls.setup({ flags = lsp_flags, on_attach = on_attach })
      lspconfig.cssls.setup({ flags = lsp_flags, on_attach = on_attach })
      lspconfig.dockerls.setup({ flags = lsp_flags, on_attach = on_attach })
      lspconfig.html.setup({ flags = lsp_flags, on_attach = on_attach })
      lspconfig.jsonls.setup({ flags = lsp_flags, on_attach = on_attach })
      lspconfig.marksman.setup({ flags = lsp_flags, on_attach = on_attach }) -- markdown
      lspconfig.pyright.setup({ flags = lsp_flags, on_attach = on_attach })
      lspconfig.ruby_ls.setup({ flags = lsp_flags, on_attach = on_attach })
      lspconfig.sqlls.setup({ flags = lsp_flags, on_attach = on_attach })
      lspconfig.lua_ls.setup({
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
      lspconfig.tsserver.setup({ flags = lsp_flags, on_attach = on_attach })
    end
  },
  {
    "someone-stole-my-name/yaml-companion.nvim",
    dependencies = {
      { "neovim/nvim-lspconfig" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
    },
    config = function()
      require("telescope").load_extension("yaml_schema")
    end,
  },
}

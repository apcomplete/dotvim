return {
  {
    'jose-elias-alvarez/null-ls.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'lukas-reineke/lsp-format.nvim',
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
          --b.code_actions.shellcheck,

          ----------------------
          --    Diagnostics   --
          ----------------------
          --b.diagnostics.actionlint,
          --b.diagnostics.codespell,

          b.diagnostics.credo.with {
            -- run credo in strict mode even if strict mode is not enabled in
            -- credo takes more than 5s... :(
            timeout = 10000,
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
          -- b.diagnostics.yamllint,
          -- b.diagnostics.cfn_lint,
          -- require 'plugins.null-ls.commitlint',

          -- ----------------------
          -- --    Formatters    --
          -- ----------------------
          -- -- Doesn't work for heex files
          --b.formatting.mix.with {
          --extra_filetypes = {},
          --args = { 'format', '-', '--dot-formatter', '$ROOT/.formatter.exs' }
          --extra_args = function(_params)
          --local version_output = vim.fn.system 'elixir -v'
          --local minor_version = vim.fn.matchlist(version_output, 'Elixir \\d.\\(\\d\\+\\)')[2]

          --local extra_args = {}

          ---- tells the formatter the filename for the code passed to it via stdin.
          ---- This allows formatting heex files correctly. Only available for
          ---- Elixir >= 1.14
          --if tonumber(minor_version, 10) >= 14 then
          --extra_args = { '--stdin-filename', '$FILENAME' }
          --end

          --return extra_args
          --end,
          --},
          --b.formatting.pg_format,
          b.formatting.prettier,
          -- b.formatting.shfmt,
          -- b.formatting.stylua,

          -- python
          --b.diagnostics.flake8.with {
          --command = '.venv/bin/flake8',
          --},
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
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    dependencies = { { 'nvim-treesitter/playground' } },
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
          -- disable highlighting for large files
          disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
          additional_vim_regex_highlighting = true,
        },
      })
    end
  }
}

-- LSP servers we want auto-installed and enabled. mason and mason-lspconfig
-- are added via vim.pack in init.lua but mason-lspconfig is not setup there,
-- so we do that here.

vim.lsp.config('pyright', {
  settings = {
    pyright = {
      -- Using Ruff's import organizer
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        -- Ignore all files for analysis to exclusively use Ruff for linting
        ignore = { '*' },
      },
    },
  },
})

require('mason-lspconfig').setup {
  ensure_installed = { 'clangd', 'gopls', 'pyright', 'ts_ls', 'ruff' },
  automatic_enable = true,
}

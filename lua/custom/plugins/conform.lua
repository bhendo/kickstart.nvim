-- Extend conform's formatters_by_ft with our project formatters.
-- conform.setup uses tbl_deep_extend, so calling it again merges with init.lua's config.

require('conform').setup {
  formatters_by_ft = {
    json = { 'jq' },
    sarif = { 'jq' },
    python = { 'ruff_format', 'ruff_organize_imports' },
    html = { 'prettier' },
    javascript = { 'prettier' },
    typescript = { 'prettier' },
    typescriptreact = { 'prettier' },
    markdown = { 'markdownlint' },
    yaml = { 'prettier' },
  },
}

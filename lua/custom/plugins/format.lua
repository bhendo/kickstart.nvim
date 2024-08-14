return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local conform = require 'conform'

    conform.setup {
      formatters_by_ft = {
        python = { 'isort', 'black' },
        json = { 'jq' }
      },
      format_after_save = {
        lsp_format = "fallback"
      }
    }
  end,
}

-- Pretty markdown rendering inside the buffer.
-- Depends on nvim-treesitter and mini.nvim, both of which init.lua already adds.

vim.pack.add { 'https://github.com/MeanderingProgrammer/render-markdown.nvim' }
require('render-markdown').setup {
  -- We don't write LaTeX math in markdown; disabling avoids needing the
  -- latex treesitter parser plus utftex/latex2text on the system.
  latex = { enabled = false },
}

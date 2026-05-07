vim.pack.add { 'https://github.com/chentoast/marks.nvim' }

local marks = require 'marks'
marks.setup {}

vim.keymap.set('n', 'm', marks.set, { desc = '[m]arks set' })
vim.keymap.set('n', 'gn', marks.next, { desc = 'marks: [g]o to [n]ext mark' })
vim.keymap.set('n', '<leader>mp', marks.preview, { desc = '[m]arks: [p]review' })
vim.keymap.set('n', '<leader>md', marks.delete_buf, { desc = '[m]arks: [d]elete all marks' })

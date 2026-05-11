-- Solarized colorscheme. Loaded after init.lua's tokyonight, so this wins.

vim.pack.add { 'https://github.com/maxmx03/solarized.nvim' }

vim.o.background = 'dark' -- or 'light'
vim.cmd.colorscheme 'solarized'

vim.keymap.set('n', '<leader>tc', function()
  if vim.o.background == 'light' then
    vim.o.background = 'dark'
  else
    vim.o.background = 'light'
  end
end, { desc = '[T]oggle the [c]olorscheme background' })

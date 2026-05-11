-- nvim-treesitter is added by init.lua; nvim-web-devicons is also added there
-- (conditional on have_nerd_font, which we set to true).

vim.pack.add { 'https://github.com/nvimdev/lspsaga.nvim' }

require('lspsaga').setup {
  lightbulb = {
    enabled = true,
    sign = true,
    virtual_text = false,
    sign_priority = 20,
  },
}

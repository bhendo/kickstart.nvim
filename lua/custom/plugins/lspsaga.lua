-- nvim-treesitter is added by init.lua. Icon support comes from mini.icons
-- (also set up in init.lua), which mocks nvim-web-devicons for plugins like
-- this one that require it (conditional on have_nerd_font, which we set to true).

vim.pack.add { 'https://github.com/nvimdev/lspsaga.nvim' }

require('lspsaga').setup {
  lightbulb = {
    enabled = true,
    sign = true,
    virtual_text = false,
    sign_priority = 20,
  },
}

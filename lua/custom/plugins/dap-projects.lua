-- nvim-dap is loaded via kickstart.plugins.debug, which our custom init.lua
-- requires before this file.

vim.pack.add { 'https://github.com/ldelossa/nvim-dap-projects' }
require('nvim-dap-projects').search_project_config()

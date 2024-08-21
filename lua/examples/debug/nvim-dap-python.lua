-- for use with ldelossa/nvim-dap-projects
-- this file should be placed .nvim/nvim-dap.lua
-- in the projects root directory
local dap = require 'dap'
local dap_python = require 'dap-python'

dap_python.setup 'python'
dap_python.test_runner = 'pytest'

dap.configurations.python = {}

table.insert(dap.configurations.python, {
  type = 'python',
  request = 'launch',
  name = 'Pytest Current File',
  module = 'pytest',
  args = { '${file}', '-sv' },
})

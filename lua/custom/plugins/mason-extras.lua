-- Install extra Mason packages that aren't covered by mason-lspconfig
-- or mason-tool-installer (e.g. debug adapters).

local mr = require 'mason-registry'
mr.refresh(function()
  local ok, p = pcall(mr.get_package, 'codelldb')
  if ok and not p:is_installed() then p:install() end
end)

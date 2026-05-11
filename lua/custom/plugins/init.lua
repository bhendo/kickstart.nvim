-- Custom plugins / config loader.
--
-- Each file is a plain Lua script that calls `vim.pack.add` and then sets the
-- plugin up — same pattern as upstream's `lua/kickstart/plugins/*.lua`.
-- Order matters here: kickstart enables come first (they install dap, mason
-- extras, etc.) so later customizations can build on them.

-- Environment / filetype tweaks (no plugin deps; safe to load first)
require 'custom.plugins.providers'
require 'custom.plugins.filetypes'

-- Kickstart optional plugins (vim.pack-based)
require 'kickstart.plugins.debug'
require 'kickstart.plugins.indent_line'
require 'kickstart.plugins.lint'
require 'kickstart.plugins.autopairs'
require 'kickstart.plugins.neo-tree'
require 'kickstart.plugins.gitsigns'

-- LSP / Mason extras (depend on init.lua's mason + mason-lspconfig)
require 'custom.plugins.lsp'
require 'custom.plugins.mason-extras'

-- Formatting / completion overrides
require 'custom.plugins.conform'

-- Editor
require 'custom.plugins.colorscheme'
require 'custom.plugins.markdown'
require 'custom.plugins.marks'
require 'custom.plugins.harpoon'
require 'custom.plugins.lspsaga'
require 'custom.plugins.trouble'
require 'custom.plugins.ufo'
require 'custom.plugins.codediff'
require 'custom.plugins.sarif'

-- Language-specific
require 'custom.plugins.rustaceanvim'
require 'custom.plugins.dap-projects'

-- User keymaps
require 'custom.plugins.keymaps'

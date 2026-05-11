-- Disable Neovim's remote plugin host providers we don't use.
-- Providers host plugins WRITTEN in these languages (e.g. legacy Deoplete in Python);
-- they are unrelated to LSP support for editing files in those languages.
-- All our plugins are Lua, so none of these hosts are needed.

vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

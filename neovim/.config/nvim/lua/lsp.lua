-- Setup language servers.
local lspconfig = require('lspconfig')
-- Python language server
lspconfig.jedi_language_server.setup {}
-- Lua language server
lspconfig.lua_ls.setup {}
-- VimScript language server
lspconfig.vimls.setup {}

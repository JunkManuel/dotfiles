--------------------------
-- Setup lsp
--------------------------
local lspconfig = require('lspconfig')
require("lsp-ui")

-------------------------
-- Python language server
-------------------------
lspconfig.jedi_language_server.setup {}

-------------------------
-- Lua language server
-------------------------
lspconfig.lua_ls.setup {
   on_init = function(client)
     local path = client.workspace_folders[1].name
     if not vim.loop.fs_stat(path..'/.luarc.json') and not vim.loop.fs_stat(path..'/.luarc.jsonc') then
       client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
         Lua = {
           runtime = {
             -- Tell the language server which version of Lua you're using
             -- (most likely LuaJIT in the case of Neovim)
             version = 'LuaJIT'
           },
           -- Make the server aware of Neovim runtime files
           workspace = {
             checkThirdParty = false,
             library = {
               vim.env.VIMRUNTIME
               -- "${3rd}/luv/library"
               -- "${3rd}/busted/library",
             }
             -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
             -- library = vim.api.nvim_get_runtime_file("", true)
           }
         }
       })

       client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
     end
     return true
   end
}

-------------------------
-- VimScript language server
-------------------------
lspconfig.vimls.setup {}

-------------------------
-- dockerfiles language server
-------------------------
lspconfig.dockerls.setup {}
lspconfig.docker_compose_language_service.setup {
	filetypes = { "yaml.docker-compose" },
}

-- Enable docker compose lsp with filename
function docker_fix()
    local filename = vim.fn.expand("%:t")

    if filename == "docker-compose.yaml" then
        vim.bo.filetype = "yaml.docker-compose"
        print("matched!")
    else
        print(filename)
    end
end

vim.cmd[[au BufRead * lua docker_fix()]]


-------------------------
-- END lsp 
-------------------------
require("lsp-keybindings")

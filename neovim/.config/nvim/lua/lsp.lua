-- Setup language servers.
local lspconfig = require('lspconfig')

-- Python language server
lspconfig.jedi_language_server.setup {}

-- Lua language server
lspconfig.lua_ls.setup {}

-- VimScript language server
lspconfig.vimls.setup {}

-- dockerfiles language server
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

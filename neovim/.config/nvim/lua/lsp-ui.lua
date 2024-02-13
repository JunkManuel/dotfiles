--------------------------
-- UI customizations for LSP
--------------------------

-- floating windows borders

local _border = {
	{"🭽", "FloatBorder"},
	{"▔", "FloatBorder"},
	{"🭾", "FloatBorder"},
	{"▕", "FloatBorder"},
	{"🭿", "FloatBorder"},
	{"▁", "FloatBorder"},
	{"🭼", "FloatBorder"},
	{"▏", "FloatBorder"},
}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
	vim.lsp.handlers.hover,{
    		border = _border
	}
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  	vim.lsp.handlers.signature_help, {
    		border = _border
  	}
)

vim.diagnostic.config{
  	float={border=_border}
}


require('lspconfig.ui.windows').default_options = {
  	border = _border
}

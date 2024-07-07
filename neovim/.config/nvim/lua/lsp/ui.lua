-- UI customizations for LSP

--------------------------
-- floating windows borders
--------------------------

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

--------------------------
-- Completition Kinds icons
--------------------------

local _icons = {
  Class = " ",
  Color = " ",
  Constant = " ",
  Constructor = " ",
  Enum = " ",
  EnumMember = " ",
  Field = "󰄶 ",
  File = " ",
  Folder = " ",
  Function = " ",
  Interface = "󰜰",
  Keyword = "󰌆 ",
  Method = "ƒ ",
  Module = "󰏗 ",
  Property = " ",
  Snippet = "󰘍 ",
  Struct = " ",
  Text = " ",
  Unit = " ",
  Value = "󰎠 ",
  Variable = " ",
}


local kinds = vim.lsp.protocol.CompletionItemKind
for i, kind in ipairs(kinds) do
	kinds[i] = _icons[kind] or kind
end


--------------------------
-- Diagnostics display
--------------------------
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = true,
  severity_sort = true,
})


--------------------------
-- Diagnostics symbols on gutter
--------------------------
local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

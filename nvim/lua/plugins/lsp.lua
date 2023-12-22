require('mason').setup()
local servers = {
	'lua_ls',
	'rust_analyzer',
	'tsserver',
	'clangd',
	'bashls',
	'cmake',
	'pyright',
	'cssls',
	'html',
}
local mason_lsp = require('mason-lspconfig')
mason_lsp.setup {
	ensure_installed = servers,
	automatic_installation = true,
}
-- mason_lsp.setup_handlers()

local on_attach = function(_, _)
	vim.keymap.set('n', '<leader>R', vim.lsp.buf.rename, {})
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

local lsp = require('lspconfig')
for _, server in pairs(servers) do
	lsp[server].setup {
		on_attach = on_attach,
	}
end

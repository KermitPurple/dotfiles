require('mason').setup()
local mason_lsp = require('mason-lspconfig')
mason_lsp.setup {
	ensure_installed = {
		'lua_ls',
		'rust_analyzer',
		'tsserver',
		'clangd',
		'bashls',
		'cmake',
		'pyright',
	},
	automatic_installation = true,
}
-- mason_lsp.setup_handlers()

local on_attach = function(_, _)
	vim.keymap.set('n', '<leader>R', vim.lsp.buf.rename, {})
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

local lsp = require('lspconfig')
lsp.lua_ls.setup {
	on_attach = on_attach
}
lsp.rust_analyzer.setup {}
lsp.tsserver.setup {}
lsp.clangd.setup {}
lsp.bashls.setup {}
lsp.cmake.setup {}
lsp.pyright.setup {}

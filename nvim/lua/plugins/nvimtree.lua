-- https://github.com/nvim-tree/nvim-tree.lua
local function my_on_attatch(bufnr)
	local api = require 'nvim-tree.api'

	local function opts(desc)
		return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- default mappings
	api.config.mappings.default_on_attach(bufnr)

	-- custom mappings
	vim.keymap.set('n', 's', api.node.open.horizontal, opts('Vertical Split'))
	vim.keymap.set('n', 'v', api.node.open.vertical, opts('Horizontal Split'))
	vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
	vim.keymap.set('n', '<leader>t', api.tree.close, opts('Help'))
end

require('nvim-tree').setup {
	on_attach = my_on_attatch
}

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.keymap.set('n', '<leader>t', ':NvimTreeFocus<CR>')

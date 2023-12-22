local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	-- grandfathered in vim plugins
	'tpope/vim-surround',
	'tpope/vim-repeat',
	'tpope/vim-fugitive',
	'rstacruz/vim-closer',
	'tpope/vim-endwise',
	'dkarter/bullets.vim',
	-- nvim plugins
	'numToStr/Comment.nvim',
	'nvim-tree/nvim-tree.lua',
	'nvim-tree/nvim-web-devicons',
	'nvim-treesitter/nvim-treesitter',
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.5',
		dependencies = { 'nvim-lua/plenary.nvim' },
	},
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	'neovim/nvim-lspconfig',
}

local opts = {}

require('lazy').setup(plugins, opts)
require 'plugins/nvimtree'
require 'plugins/Comment'
require 'plugins/telescope'
require 'plugins/treesitter'
require 'plugins/lsp'

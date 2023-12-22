local home = '/Users/shane/'
local vim_base = home .. '.vim/'
local nvim_base = home .. 'dotfiles/nvim/'
vim.o.runtimepath = vim.o.runtimepath .. string.format(',%s,%safter', vim_base, vim_base)
vim.o.packpath = vim.o.runtimepath
vim.cmd(string.format('source %s/shared.vim', vim_base))
vim.o.directory = nvim_base .. 'trash'
vim.o.undodir = vim.o.directory
vim.o.backupdir = vim.o.directory
vim.o.viewdir = vim.o.directory

require('plugins')

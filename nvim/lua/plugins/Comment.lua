require('Comment').setup()
local opts = { remap = true }
vim.keymap.set('', '<leader><space>', 'gc', opts)
vim.keymap.set('', '<leader><s-space>', 'gb', opts)
vim.keymap.set('', '<s-space><s-space>', 'gb', opts)
vim.keymap.set('', '<c-/>', 'gcc', opts)
vim.keymap.set('n', '<leader><space><space>', 'gcc', opts)

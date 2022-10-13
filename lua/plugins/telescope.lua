local stats, telescope = pcall(require, 'telescope.builtin')
if not stats then print('Telescope is not installed') return end

local map = vim.keymap.set
local opt = {noremap = true, silent = true}

map('n', '<leader>ff', telescope.find_files, opt)
map('n', '<leader>fg', telescope.live_grep, opt)
map('n', '<leader>fb', telescope.buffers, opt)
map('n', '<leader>fh', telescope.help_tags, opt)

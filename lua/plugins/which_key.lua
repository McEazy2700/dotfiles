local stats, wk = pcall(require, 'which-key')
if not stats then print('Which-key') return end

-- wk.register({
--   f = {
--     name = 'Files',
--     f={"<cmd>Telescope find_files<cr>", "Find File"},
--     r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap=false, buffer = 123 }, -- additional options for creating the keymap
--   },
-- }, { prefix = '<leader>'})

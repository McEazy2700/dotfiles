--[[
==============================================
  --------------- EazyVim -------------------
  The Amazinest Vim config on the planet.
  Use responsibly!
==============================================
--]]

--------------- The Basic Stuff --------------
local set = vim.opt
set.relativenumber = true			-- set relativenumber
set.number = true             -- shows the current line number
set.shell = 'zsh'				      -- zsh as default shell
set.ignorecase = true
set.cmdheight = 1

set.backup = false
set.writebackup = false

set.updatetime = 300
set.signcolumn = 'yes'
set.ignorecase = true
set.smartcase = true
set.scrolloff = 7
set.wrap = true             -- Scroll offset
set.numberwidth = 2
set.termguicolors = true    -- Terminal gui colors
set.cursorline = true       -- Horizontal cursorline
set.spell = false           -- Do not check spelling. Get's annoying
set.mouse = 'a'
set.showcmd = true
set.showmode = true
set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 4
set.autoindent = true
set.smarttab = true
set.smartindent = true
set.hlsearch = false       -- stops search highlight after searching.
set.hidden = true
set.incsearch = true
set.signcolumn = 'yes'
set.colorcolumn = '100'
set.timeoutlen = 200
set.backup = false
set.writebackup = false
-- set.guicursor=

-- function _G.check_back_space()
-- local col = vim.fn.col('.') - 1
-- return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
-- end

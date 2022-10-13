local status, packer = pcall(require, 'packer')
if not status then
  print('Packer not found')
  return
end

packer.startup(function(use)
  -- Packer itself
  use 'wbthomason/packer.nvim'

  -- Telescope
  use 'nvim-telescope/telescope.nvim'
  use "nvim-lua/plenary.nvim"
  use { 'nvim-telescope/telescope-fzf-native.nvim',
    run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  }
  use {
    'nvim-treesitter/nvim-treesitter',
  }

  -- Which Key
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup()
    end
  }

  -- LSP
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }

  -- -- Snippets
  -- use {
  --   'SirVer/ultisnips',
  --   'honza/vim-snippets',
  --   'rafamadriz/friendly-snippets',
  --   'honza/vim-snippets',
  -- }
  -- -- Auto completion
  use { 'neoclide/coc.nvim', branch = 'master', run = 'yarn install --frozen-lockfile' }

  -- Themes
  use {
    'catppuccin/nvim',
    as = 'catpuccin',
    config = function()
      vim.g.catpuccin_flavour = 'mocha'
      local catppuccin_status, catppuccin = pcall(require, 'catppuccin')
      if not catppuccin_status then print('catppuccin is not installed') return end
      catppuccin.setup()
      vim.api.nvim_command("colorscheme catppuccin")
    end
  }
end)

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- treesitter
  -- use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- which-key
  use {
    'folke/which-key.nvim',
    config = function()
      require('plugin-config/which-key')
    end
  }

  -- -- telescope
  -- use 'nvim-lua/popup.nvim'
  -- use 'nvim-lua/plenary.nvim'
  -- use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} } }

  -- -- lspconfig
  -- use 'neovim/nvim-lspconfig'

  -- -- rust-tools
  -- use 'simrat39/rust-tools.nvim'

  -- nvim-cmp
  -- use 'hrsh7th/cmp-nvim-lsp'
  -- use 'hrsh7th/cmp-buffer'
  -- use 'hrsh7th/cmp-path'
  -- use 'hrsh7th/cmp-cmdline'
  -- use 'hrsh7th/nvim-cmp'
  -- use 'hrsh7th/cmp-vsnip'

  -- vsnip
  -- use 'hrsh7th/vim-vsnip'
  -- use "rafamadriz/friendly-snippets"

  -- -- use 'nvim-autopairs'
  -- use "windwp/nvim-autopairs"

  -- nvim-tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() 
      require('plugin-config/nvim-tree')
    end
  }

  -- -- bufferline
  -- use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}

  -- -- surround
  -- use "blackCauldron7/surround.nvim"

  -- Comment
  -- use 'numToStr/Comment.nvim'

  -- -- nvim-coloizer
  -- use 'norcalli/nvim-colorizer.lua'

  -- -- gruvbox theme
  -- use {
  --   "ellisonleao/gruvbox.nvim",
  --   requires = { "rktjmp/lush.nvim" },
  --   config = function()
  --     vim.o.background = "dark" -- or "light" for light mode
  --     vim.cmd([[colorscheme gruvbox]])
  --   end
  -- }

  -- nord theme
  use {
    "shaunsingh/nord.nvim",
    config = function()
      vim.cmd[[colorscheme nord]]
    end
  }

end)


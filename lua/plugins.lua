local status, packer = pcall(require, 'packer')

if(not status) then
  print('Packer is not installed')
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  -- Packer itself
  use 'wbthomason/packer.nvim'

  -- Theme
  use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  }
  use 'hoob3rt/lualine.nvim'

  -- LSP & Autocomplete
  use 'neovim/nvim-lspconfig'
  use 'L3MON4D3/LuaSnip'
  use 'onsails/lspkind-nvim'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'


  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use 'nvim-tree/nvim-web-devicons'

  -- Telescope
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'

  -- Auto closing tags
  use 'windwp/nvim-ts-autotag'

  -- Tabline
  use 'nanozuki/tabby.nvim'

  -- Autocomment
  use { 'numToStr/Comment.nvim',
    requires = {
      'JoosepAlviste/nvim-ts-context-commentstring'
    }
  }

  -- Colorizer
  use 'norcalli/nvim-colorizer.lua'
end)

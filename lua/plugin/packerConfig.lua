local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- plugins here

use { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    requires = {
      'williamboman/mason.nvim', -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason-lspconfig.nvim',
      'j-hui/fidget.nvim', -- Useful status updates for LSP
      'folke/neodev.nvim', -- Additional lua configuration, makes nvim stuff amazing
    },
  }

  use { -- Autocompletion
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'octaltree/cmp-look',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'onsails/lspkind-nvim', --> vscode-like pictograms for neovim lsp completion items
      'neovim/nvim-lspconfig',
    },
  }

use { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }
  use { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }
  use 'p00f/nvim-ts-rainbow' -- rainbow braces
  use 'nvim-treesitter/playground'

  -- Git related plugins
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'lewis6991/gitsigns.nvim'

  -- Interface
  use 'nvim-lualine/lualine.nvim' -- better status bar
  use 'kyazdani42/nvim-web-devicons' -- fancy icons required by many things
  use 'romgrk/barbar.nvim' -- tab for open buffers
  use 'nvim-tree/nvim-tree.lua' -- file explorer/tree
  use 'norcalli/nvim-colorizer.lua' -- hilight color codes
  use 'mbbill/undotree' --TODO
  use 'rcarriga/nvim-notify' -- fancy notification popups
  use 'navarasu/onedark.nvim' -- Theme inspired by Atom
  use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
  use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
  use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically


  -- Fuzzy Finder (files, lsp, etc)
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }
  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }


  -- Language Server
 --  use("neovim/nvim-lspconfig") --> Collection of configurations for built-in LSP client
	-- use("williamboman/nvim-lsp-installer") --> Companion plugin for lsp-config, allows us to seamlesly install language servers
	-- use("hrsh7th/nvim-cmp") --> Autocompletion plugin
	-- use("hrsh7th/cmp-nvim-lsp") --> LSP source for nvim-cmp
	-- use("jose-elias-alvarez/null-ls.nvim") --> inject lsp diagnistocs, formattings, code actions, and more ...
	-- use("tami5/lspsaga.nvim") --> icons for LSP diagnostics
  -- use("saadparwaiz1/cmp_luasnip") --> Snippets source for nvim-cmp
	-- use("L3MON4D3/LuaSnip") --> Snippets plugin
	--
 --> treesitter & treesitter modules/plugins
	-- use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }) --> treesitter 



  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

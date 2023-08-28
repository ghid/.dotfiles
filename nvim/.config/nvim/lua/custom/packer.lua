-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.2',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({
      'rose-pine/neovim',
      as = 'rose-pine',
      config = function()
    	  require('rose-pine').setup({
    		  disable_background = true,
    		  disable_italics = false,
              highlight_groups = {
                  Include = { fg = 'love' },
              }
    	  })
    	  vim.cmd('colorscheme rose-pine')
      end
  })

--   use({
--       "catppuccin/nvim",
--       as = "catppuccin",
--       config = function()
--           require("catppuccin").setup({
--               flavour = "mocha",
--               transparent_background = true,
--               no_italic = false,
--           })
--     	  --vim.cmd("colorscheme catppuccin")
--       end
--  })

    -- use({
    --     'rebelot/kanagawa.nvim',
    --     as = "kanagawa",
    --     config = function ()
    --         require("kanagawa").setup({
    --             print("kanagawa setup"),
    --             statementStyle = { bold = true },
    --             keywordStyle = { bold = true },
    --             functionStyle = { bold = true },
    --             typeStyle = { bold = true },
    --         })
    -- 	    vim.cmd('colorscheme kanagawa')
    --     end
    -- })

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use("nvim-treesitter/playground")

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v2.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},             -- Required
		  {                                      -- Optional
		  'williamboman/mason.nvim',
		  run = function()
			  pcall(vim.cmd, 'MasonUpdate')
		  end,
	  },
	  {'williamboman/mason-lspconfig.nvim'}, -- Optional

	  -- Autocompletion
	  {'hrsh7th/nvim-cmp'},     -- Required
	  {'hrsh7th/cmp-nvim-lsp'}, -- Required
	  {'L3MON4D3/LuaSnip'},     -- Required
      {'rafamadriz/friendly-snippets'},
  }
}
end)

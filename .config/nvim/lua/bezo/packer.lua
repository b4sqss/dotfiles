-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

	use ('FeiyouG/commander.nvim')

	use('folke/tokyonight.nvim')

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	use 'Rahlir/nvim-matlab'

	use 'NvChad/nvim-colorizer.lua'

	use('nvim-treesitter/playground')

	use("hiphish/rainbow-delimiters.nvim")

	use {'nvim-orgmode/orgmode', config = function()
  require('orgmode').setup{}
end
}
  --
  -- use ("lukas-reineke/indent-blankline.nvim")

	use {
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		requires = { 
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			"3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		}
	}

	use ("stevearc/oil.nvim")

	use('theprimeagen/harpoon')
	use('mbbill/undotree')
	use('tpope/vim-fugitive')

	use {
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup {
			}
		end
	}

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			--- top line
			{'SmiteshP/nvim-navic'},

			-- LSP Support
			{'neovim/nvim-lspconfig'},
			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'L3MON4D3/LuaSnip'},
			-- debugger
			{'mfussenegger/nvim-dap'}
		}
	}
	use {
		'williamboman/mason.nvim',
		requires = {'williamboman/mason-lspconfig.nvim'},
		config = require("mason").setup({
      ensure_installed = {
        lsp = {
          "clangd",
          "lua-language-server",
          "pyright",
          "rust_analyzer",
          "gopls"
        },
        dap = {
          "debugpy",
          "cpptools"
        }
      }
    })

	}

  use {
    "tpope/vim-dadbod",
    requires = {
      {"kristijanhusak/vim-dadbod-completion"},
      {"kristijanhusak/vim-dadbod-ui"}
    }
  }

	use {
		"akinsho/toggleterm.nvim", tag = '*', config = function()
		require("toggleterm").setup()
	end}

	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	}

	use('folke/trouble.nvim')

	use('ThePrimeagen/vim-be-good')

	use {'kawre/leetcode.nvim',
	requires = { {'MunifTanjim/nui.nvim'},
	{'rcarriga/nvim-notify'},
	{'nvim-tree/nvim-web-devicons'} }
}
end)

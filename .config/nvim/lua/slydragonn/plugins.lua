-- Automatically run: PackerCompile whenever plugins.lua is updated with an autocommand:
vim.api.nvim_create_autocmd("BufWritePost", {
	group = vim.api.nvim_create_augroup("PACKER", { clear = true }),
	pattern = "plugins.lua",
	command = "source <afile> | PackerCompile",
})

return require("packer").startup(function(use)
	-- Packer
	use("wbthomason/packer.nvim")

	-- Colorschema
	use("rebelot/kanagawa.nvim")

	-- Statusline
	use({
		"nvim-lualine/lualine.nvim",
		event = "BufEnter",
		config = function()
			require("slydragonn.configs.lualine")
		end,
		requires = { "nvim-web-devicons" },
	})

	-- Common utilities
	use("nvim-lua/plenary.nvim")

	-- LSP
	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("slydragonn.configs.lsp")
		end,
	})

	-- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("slydragonn.configs.null-ls")
		end,
		requires = { "nvim-lua/plenary.nvim" },
	})

	use({
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	})

	use({
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				automatic_installation = true,
			})
		end,
	})

	-- File manager
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
	})

	use("norcalli/nvim-colorizer.lua")

	-- Icons
	use("nvim-tree/nvim-web-devicons")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		event = "CursorHold",
		run = ":TSUpdate",
		config = function()
			require("slydragonn.configs.treesitter")
		end,
	})

	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })

	use("onsails/lspkind-nvim")

	-- cmp
	use({
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		config = function()
			require("slydragonn.configs.cmp")
		end,
	})

	use("hrsh7th/cmp-nvim-lsp")

	use({ "hrsh7th/cmp-path", after = "nvim-cmp" })

	use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- Terminal
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("slydragonn.configs.toggleterm")
		end,
	})

	-- Git
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("slydragonn.configs.gitsigns")
		end,
	})

	-- Markdown Preview
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	-- autopairs
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("slydragonn.configs.autopairs")
		end,
	})
end)

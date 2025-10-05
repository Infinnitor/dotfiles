-- lazy.vim boilerplate
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins
require("lazy").setup({
	"folke/tokyonight.nvim",
	"neovim/nvim-lspconfig",

	{ "nvim-mini/mini.comment", version = false },
	{ "nvim-mini/mini.surround", version = false },
	{ "nvim-mini/mini.pairs", version = false },
	{ "nvim-mini/mini.trailspace", version = false },
	{ "nvim-mini/mini.base16", version = false },

	{
		"nanozuki/tabby.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function ()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "gdscript", "c", "rust", "lua", "vim", "vimdoc", "python", "javascript", "html" },
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
				format = { enable = true }
			})
		end
	},

	-- Telescope
	{
		"nvim-telescope/telescope.nvim", tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" }
	},

	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons", -- optional, but recommended
		},
		lazy = false, -- neo-tree will lazily load itself
	},

	-- nvim-cmp (completion)
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-vsnip",
			"hrsh7th/vim-vsnip",
			"hrsh7th/cmp-cmdline",
			"rafamadriz/friendly-snippets"
		}
	}
})

require("mini.comment").setup()
require("mini.surround").setup()
require("mini.pairs").setup()
require("mini.trailspace").setup()


require("neo-tree").setup({
	window = {
		position = "current"
	},
	filesystem = {
		filtered_items = {
			hide_dotfiles = false,
			hide_gitignored = true,
			hide_by_pattern = {
				"*.gd.uid"
			}
		}
	}
})

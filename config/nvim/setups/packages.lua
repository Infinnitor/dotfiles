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
	{ "nvim-mini/mini.base16", version = false },
	{ "nvim-mini/mini.icons", version = false },

	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			picker = {
				enabled = true,
				layout = "telescope",
				on_show = function(_)
					vim.cmd[[stopinsert]]
				end,
				win = {
					input = {
						keys = {
							["<Tab>"] = { "list_up", mode = { "i", "n" } },
							["<S-Tab>"] = { "list_down", mode = { "i", "n" } },
						}
					}
				}
			},
			explorer = { enabled = true},
			input = { enabled = true },
			quickfile = { enabled = true },
		},
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function ()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "gdscript", "cpp", "c", "rust", "lua", "vim", "vimdoc", "python", "javascript", "html", "css", "go", "toml" },
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

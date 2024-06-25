-- Basic options
vim.opt.clipboard = "unnamedplus"
vim.opt.cindent = false
vim.opt.expandtab = false
vim.opt.copyindent = true
vim.opt.indentexpr = ""
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.cinoptions = "m1"

-- Visual options
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.wrap = false

-- Mappings
vim.g.mapleader = " "
vim.keymap.set("n", "<Leader>a", "<cmd>tabp<CR>")
vim.keymap.set("n", "<Leader>d", "<cmd>tabn<CR>")
vim.keymap.set("n", "<Leader>t", "<cmd>tabe<CR><cmd>Neotree position=current<CR>")
vim.keymap.set("n", "<Leader>p", "<cmd>Neotree toggle position=left<CR>")
vim.keymap.set("n", "<Leader>/", "<cmd>Commentary<CR>")
vim.keymap.set("n", "<Leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap=true, silent=true })

-- Custom commands
vim.cmd[[command W update]]

-- Autocmds
-- Trim trailing whitespace
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = { "*" },
	callback = function(_)
		local pos = vim.api.nvim_win_get_cursor(0)
		vim.cmd[[%s/\s\+$//e]]
		vim.api.nvim_win_set_cursor(0, pos)
		vim.cmd[[nohlsearch]]
	end
})

-- Trim trailing whitespace
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	pattern = { "*.md", "*.txt" },
	callback = function(_)
		print("hello")
		vim.cmd[[setlocal wrap spell linebreak]]
	end
})

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
	-- Tokyonight (theme)
	"folke/tokyonight.nvim",

	-- Commentary
	"tpope/vim-commentary",

	-- CSS colors
	"brenoprata10/nvim-highlight-colors",

	"neovim/nvim-lspconfig",

	"smolck/command-completion.nvim",

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
			})
		end
	},

	-- Neotree (file browser)
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		}
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
	},
})

-- Setup theme
require("tokyonight").setup({
	terminal_colors = true,
	style = "night",

	-- Custom colours
	on_colors = function(colors)
		colors.bg = "#0a0a0f"
		colors.bg_dark = "#01010a"
	end
})

-- Set colorscheme
vim.cmd[[colorscheme tokyonight]]

-- Setup python LSP
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require("lspconfig").pylsp.setup{
	settings = {
		pylsp = {
			plugins = {
				pycodestyle = {
					enabled = false,
					ignore = {"F401","W191","E501","E402","E701","F405","F403"},
					maxLineLength = 100
				}
			}
		}
	},

	capabilities = capabilities
}

-- Setup completion
local cmp = require("cmp")
cmp.setup({
	-- Menu navigation bindings
	mapping = cmp.mapping.preset.insert({
		["<Tab>"] = cmp.mapping.confirm({ select = true }),
		-- ["<Tab>"] = cmp.mapping.select_next_item(),
		["<S-Tab>"] = cmp.mapping.select_next_item(),
	}),

	-- Use vsnip
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},

	-- Sources to use for completion
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "buffer",
			option = {
				get_bufnrs = function()
					return vim.api.nvim_list_bufs()
				end
			}
		},
		{ name = "vsnip" },
		{ name = "path" }
	})
})

-- Autocomplete for words in current file
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" }
	}
})

-- Use cmdline & path source for ":" (if you enabled `native_menu`, this won"t work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
		{ name = "cmdline" }
	}),
	matching = { disallow_symbol_nonprefix_matching = false }
})

require("nvim-highlight-colors").setup()
require("neo-tree").setup({
	window = {
		position = "current"
	},
	mappings = {
		["o"] = "open"
	},
	hide_dotfiles = false,
	hide_gitignored = true
})

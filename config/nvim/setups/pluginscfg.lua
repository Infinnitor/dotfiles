require("nvim-highlight-colors").setup()

-- Setup completion
local cmp = require("cmp")
cmp.setup({
	-- Menu navigation bindings
	mapping = cmp.mapping.preset.insert({
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
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

local recall = require("recall")
recall.setup({
	sign = ""
})

vim.keymap.set("n", "<leader>rr", recall.toggle, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>rj", recall.goto_next, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>rk", recall.goto_prev, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>rc", recall.clear, { noremap = true, silent = true })

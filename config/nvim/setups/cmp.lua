-- Setup completion
local cmp = require("cmp")
cmp.setup({
	preselect = cmp.PreselectMode.None,

	-- Menu navigation bindings
	mapping = cmp.mapping.preset.insert({
		["<CR>"] = function(fallback)
			if cmp.visible() then
				cmp.confirm({select = false}, function()
					vim.cmd("stopinsert")
				end)
			else
				fallback()
			end
		end,

		["<Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
				cmp.complete()
			else
				fallback()
			end
		end,
		["<S-Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
				cmp.complete()
			else
				fallback()
			end
		end
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

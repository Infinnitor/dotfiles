require("mini.comment").setup()
require("mini.surround").setup()
require("mini.pairs").setup({
	modes = { insert = true, command = false, terminal = false },
	mappings = {
		['<'] = { action = 'open', pair = '<>', neigh_pattern = '[^\\].' },
		['>'] = { action = 'close', pair = '<>', neigh_pattern = '[^\\].' },

		["'"] = { action = 'close', pair = "''", neigh_pattern = '[^%a\\].', register = { cr = false } }
	}
})

require("telescope").setup{
	defaults = {
		borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
		-- selection_strategy = "follow"

		mappings = {
			i = {
				["<Tab>"] = "move_selection_previous",
				["<S-Tab>"] = "move_selection_next"
			}
		}
	}
}

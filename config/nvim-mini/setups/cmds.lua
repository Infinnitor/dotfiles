-- Custom commands
vim.cmd[[command! W update]]

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

-- Set spellcheck and word wrap for text and markdown files
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	pattern = { "*.md", "*.txt" },
	callback = function(_)
		vim.cmd[[setlocal wrap spell linebreak]]
	end
})

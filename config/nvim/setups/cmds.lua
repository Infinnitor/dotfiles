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
	pattern = { "*.md", ".txt" },
	callback = function(_)
		vim.cmd[[setlocal wrap spell linebreak]]
	end
})


-- vim.api.nvim_create_autocmd({ "VimEnter" }, {
-- 	pattern = { "*" },
-- 	callback = function(_)
-- 		local buf = vim.api.nvim_buf_get_name(0)
-- 		if vim.fn.isdirectory(buf) ~= 0 then
-- 			vim.cmd[[bdelete]]
-- 			vim.fn.chdir(buf)
-- 			require("telescope.builtin").find_files()
-- 		end
-- 	end
-- })

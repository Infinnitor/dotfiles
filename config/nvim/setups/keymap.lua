--nil Mappings
vim.g.mapleader = " "

vim.keymap.set("n", "gh", "_")
vim.keymap.set("n", "gl", "$")

vim.keymap.set("n", "<Esc>", "<cmd>noh<CR>")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

vim.keymap.set("n", "<Leader>h", "<C-w>h")
vim.keymap.set("n", "<Leader>j", "<C-w>j")
vim.keymap.set("n", "<Leader>k", "<C-w>k")
vim.keymap.set("n", "<Leader>l", "<C-w>l")

vim.keymap.set("n", "<Leader>1", "1gt")
vim.keymap.set("n", "<Leader>2", "2gt")
vim.keymap.set("n", "<Leader>3", "3gt")
vim.keymap.set("n", "<Leader>4", "5gt")
vim.keymap.set("n", "<Leader>5", "5gt")
vim.keymap.set("n", "<Leader>6", "6gt")

-- LSP
vim.keymap.set("n", "<Leader>ee", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap=true, silent=true })
vim.keymap.set("n", "<Leader>ef", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap=true, silent=true })
vim.keymap.set("n", "<Leader>eg", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap=true, silent=true })

-- Telescope
vim.keymap.set("n", "<Leader>ff", function() Snacks.picker.files() end , { noremap=true, silent=true })
vim.keymap.set("n", "<Leader>fs", function() Snacks.picker.treesitter() end, { noremap=true, silent=true })
vim.keymap.set("n", "<Leader>fd", function() Snacks.picker.diagnostics() end, { noremap=true, silent=true })
vim.keymap.set("n", "<Leader>fb", function() Snacks.picker.buffers() end, { noremap=true, silent=true })
vim.keymap.set("n", "<Leader>fp", function() Snacks.explorer.reveal() end, { noremap=true, silent=true })

-- Format files based on filetype
vim.keymap.set("n", "<Leader>fm", function(_)
	vim.cmd[[w]]
	if vim.lsp.status() ==# "" then

	else
		vim.lsp.buf.format()
	end
	vim.cmd[[w]]
end)

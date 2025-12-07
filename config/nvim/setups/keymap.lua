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


for i=1,9 do
	vim.keymap.set("n", "<Leader>" .. i, i .. "gt")
end

vim.keymap.set("n", "<Leader>tn", "<cmd>tabnew<CR>")

vim.keymap.set("n", "<Leader>tf", function()
	vim.cmd[[tabnew]]
	Snacks.picker.files()
end)

vim.keymap.set("n", "<Leader>tb", function()
	vim.cmd[[tabnew]]
	Snacks.picker.buffers()
end)

vim.keymap.set("n", "<Leader>te", function()
	vim.cmd[[tabnew]]
	Snacks.explorer.reveal()
end)

vim.keymap.set("n", "<Leader>tr", "<cmd>tab term<CR>")

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
vim.keymap.set("n", "<Leader>fq", function() Snacks.picker.pickers() end, { noremap=true, silent=true })

-- Format files based on filetype
vim.keymap.set("n", "<Leader>fm", function()
	vim.cmd[[w]]
	if vim.lsp.status() ==# "" then

	else
		vim.lsp.buf.format()
	end
	vim.cmd[[w]]
end)

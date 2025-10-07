-- Mappings
vim.g.mapleader = " "

vim.keymap.set("n", "gh", "_")
vim.keymap.set("n", "gl", "$")

vim.keymap.set("n", "<Esc>", "<cmd>noh<CR>")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- LSP
vim.keymap.set("n", "<Leader>ee", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap=true, silent=true })
vim.keymap.set("n", "<Leader>ef", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap=true, silent=true })
vim.keymap.set("n", "<Leader>eg", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap=true, silent=true })

-- Telescope
vim.keymap.set("n", "<Leader>ff", "<cmd>Telescope find_files<CR>", { noremap=true, silent=true })
vim.keymap.set("n", "<Leader>fs", "<cmd>Telescope treesitter<CR>", { noremap=true, silent=true })
vim.keymap.set("n", "<Leader>fd", "<cmd>Telescope diagnostics<CR>", { noremap=true, silent=true })

-- Format files based on filetype
vim.keymap.set("n", "<Leader>fm", function(_)
	vim.cmd[[w]]
	vim.lsp.buf.format()
	vim.cmd[[w]]
end)

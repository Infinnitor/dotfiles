-- Mappings
vim.g.mapleader = " "

-- Tab navigation
vim.keymap.set("n", "<Leader>a", "<cmd>tabp<CR>")
vim.keymap.set("n", "<Leader>d", "<cmd>tabn<CR>")
vim.keymap.set("n", "<Leader>te", "<cmd>tabe<CR><cmd>terminal<CR><cmd>tabm 1<CR>")
vim.keymap.set("n", "<Leader>tr", "<cmd>tabe<CR><cmd>Neotree position=current<CR><cmd>tabm 0<CR>")
vim.keymap.set("n", "<Esc>", "<cmd>noh<CR>")

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

for i=1,9 do
	vim.keymap.set("n", "<Leader>"..i, i.."gt")
end

-- Open diagnostic float for LSP errors
vim.keymap.set("n", "<Leader>ee", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap=true, silent=true })
vim.keymap.set("n", "<Leader>ef", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap=true, silent=true })
vim.keymap.set("n", "<Leader>eg", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap=true, silent=true })

-- Telescope
vim.keymap.set("n", "<Leader>ff", "<cmd>Telescope find_files<CR>", { noremap=true, silent=true })
vim.keymap.set("n", "<Leader>ft", "<cmd>tabnew<CR><cmd>Telescope find_files<CR>", { noremap=true, silent=true })

-- Format files based on filetype
vim.keymap.set("n", "<Leader>fm", function(_)
	vim.cmd[[w]]
	if vim.bo.filetype == "python" then
		print("Running black")
		vim.cmd[[silent !black %]]
	elseif vim.bo.filetype == "go" then
		print("Running go fmt %")
		vim.cmd[[silent !go fmt]]
	elseif vim.bo.filetype == "rust" then
		print("Running rustfmt")
		vim.cmd[[silent !rustfmt %]]
	elseif vim.bo.filetype == "gdscript" then
		print("Running gdformat")
		vim.cmd[[silent !gdformat %]]
	elseif vim.bo.filetype == "javascript" or vim.bo.filetype == "html" or vim.bo.filetype == "css" then
		print("Running prettier")
		vim.cmd[[silent !prettier % --write --use-tabs]]
	end
end)

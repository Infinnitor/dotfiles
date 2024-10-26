-- Mappings
vim.g.mapleader = " "

-- Tab navigation
vim.keymap.set("n", "<Leader>a", "<cmd>tabp<CR>")
vim.keymap.set("n", "<Leader>d", "<cmd>tabn<CR>")
vim.keymap.set("n", "<Leader>t", "<cmd>tabe<CR><cmd>Neotree position=current<CR><cmd>tabm 0<CR>")
for i=1,9 do
	vim.keymap.set("n", "<Leader>"..i, i.."gt")
end

-- Open diagnostic float for LSP errors
vim.keymap.set("n", "<Leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap=true, silent=true })

-- Format files based on filetype
vim.keymap.set("n", "<Leader>fm", function(_)
	vim.cmd[[w]]
	if vim.bo.filetype == "python" then
		print("Running black")
		vim.cmd[[silent !black %]]
	elseif vim.bo.filetype == "rust" then
		print("Running rustfmt")
		vim.cmd[[silent !rustfmt %]]
	elseif vim.bo.filetype == "javascript" or vim.bo.filetype == "html" or vim.bo.filetype == "css" then
		print("Running prettier")
		vim.cmd[[silent !prettier % --write --use-tabs]]
	end
end)

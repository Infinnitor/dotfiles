function handle_load(path)
	ok, err = pcall(vim.cmd, "luafile" .. path)
	if not ok then
		vim.notify(":E " .. err .. " error loading config at " .. path)
	end
end

handle_load("$HOME/.config/nvim/setups/options.lua")
handle_load("$HOME/.config/nvim/setups/keymap.lua")
handle_load("$HOME/.config/nvim/setups/cmds.lua")
handle_load("$HOME/.config/nvim/setups/packages.lua")
handle_load("$HOME/.config/nvim/setups/theme.lua")
handle_load("$HOME/.config/nvim/setups/cmp.lua")
handle_load("$HOME/.config/nvim/setups/lsps.lua")

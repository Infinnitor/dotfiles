function handle_load(path)
	ok, err = pcall(vim.cmd, "luafile" .. path)
	if not ok then
		vim.notify(":E " .. err .. " error loading config at " .. path)
	end
end

paths = {
	"setups/options.lua",
	"setups/keymap.lua",
	"setups/cmds.lua",
	"setups/packages.lua",
	"setups/configure.lua",
	"setups/theme.lua",
	"setups/cmp.lua",
	"setups/lsps.lua"
}

for _, p in pairs(paths) do
	handle_load("$HOME/.config/nvim/" .. p)
end

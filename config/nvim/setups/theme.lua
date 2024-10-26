-- Setup tokyonight overrides for darker background
require("tokyonight").setup({
	terminal_colors = true,
	style = "night",

	-- Custom colours
	on_colors = function(colors)
		colors.bg = "#0a0a0f"
		colors.bg_dark = "#01010a"
	end
})

-- Set colorscheme
local set_colourscheme = "tokyonight"
-- Check if installed
local is_ok, _ = pcall(vim.cmd, "colorscheme " .. set_colourscheme)
if not is_ok then
    vim.notify("E: Colorscheme " .. set_colourscheme .. " not found!")
end

-- Set some overrides for search highlighting to make it useable
vim.cmd[[hi Search guibg=#283457]]
vim.cmd[[hi CurSearch guibg=#283457]]
vim.cmd[[hi IncSearch guibg=#384467 guifg=white]]


-- Tabline config
local theme = {
	fill = "TabLineFill",
	head = "TabLine",
	current_tab = "TabLineSel",
	tab = "TabLine",
	win = "TabLine",
	tail = "TabLine",
}

require("tabby").setup({
	line = function(line)
		return {
			{
				{ " ", hl = theme.head },
				line.sep("", theme.head, theme.fill),
			},
			line.tabs().foreach(function(tab)
				local hl = tab.is_current() and theme.current_tab or theme.tab
				local tabname = tab.name()
				local name = string.sub(tabname,1,string.len("neo-tree")) == "neo-tree" and "tree" or tab.name()
				return {
					line.sep("", hl, theme.fill),
					tab.is_current() and "" or "󰆣",
					tab.number(),
					name,
					line.sep("", hl, theme.fill),
					hl = hl,
					margin = " ",
				}
			end),
			{
				line.sep("", theme.tail, theme.fill),
				{ "  ", hl = theme.tail },
			},
			hl = theme.fill,
		}
	end
})

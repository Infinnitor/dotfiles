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

vim.cmd[[hi NeoTreeNormal guibg=#0a0a0f guifg=white]]

-- require("mini.base16").setup{
-- 	palette = {
-- 		base00 = "#444b6a",
-- 		base01 = "#7da6ff",
-- 		base02 = "#0db9d7",
-- 		base03 = "#b9f27c",
-- 		base04 = "#bb9af7",
-- 		base05 = "#ff7a93",
-- 		base06 = "#acb0d0",
-- 		base07 = "#ff9e64",
-- 		base08 = "#32344a",
-- 		base09 = "#7aa2f7",
-- 		base0A = "#449dab",
-- 		base0B = "#9ece6a",
-- 		base0C = "#ad8ee6",
-- 		base0D = "#f7768e",
-- 		base0E = "#787c99",
-- 		base0F = "#e0af68",
-- 	}
-- }

-- Setup tokyonight overrides for darker background
require("tokyonight").setup({
	terminal_colors = true,
	style = "storm",

	-- Custom colours
	on_colors = function(colors)
		colors.bg = "#0a0a0f"
		colors.bg_dark = "#01010a"
	end
})

-- Set colorscheme
local set_colourscheme = "tokyonight"
-- -- Check if installed
local is_ok, _ = pcall(vim.cmd, "colorscheme " .. set_colourscheme)
if not is_ok then
    vim.notify("E: Colorscheme " .. set_colourscheme .. " not found!")
end
--

-- local test = {
-- 	base04="#d6d0f6",
-- 	base06="#d6d0f6",
-- 	base07="#d6d0f6",
-- 	base05="#d6d0f6",
-- 	base08="#D34F4F",
-- 	base09="#A43647",
-- 	base0B="#9ece6a",
-- 	base0D="#707aD6",
-- 	base0A="#8773ED",
-- 	base0E="#a174c3",
-- 	base0C="#6f5190",
-- 	base03 = "#272a3f",
-- 	base0F = "#373a4f",
-- 	base02 = "#161828",
-- 	base01 = "#050510",
-- 	base00 = "#000a0d",
-- }

require("mini.base16").setup{
	palette = {
		base00 = "#0a0a0f", -- Background
		base01 = "#0f0f15", -- Status column / autocomplete background
		base02 = "#202238", -- Highlight / statusline background
		base03 = "#444b6a", -- Comments / numbers
		base04 = "#a9b1d6", -- Statusline text
		base05 = "#a9b1d6", -- Variables / cmdline
		base06 = "#ff00ff", -- unknown
		base07 = "#9ece6a", -- autocomplete
		base08 = "#f7768e", -- statuscolumn errors, attribute
		base09 = "#e0af68", -- booleans
		base0A = "#ff9e64", -- types
		base0B = "#9ece6a", -- strings
		base0C = "#ff9e64", -- Enum variants
		base0D = "#7aa2f7", -- function declarations
		base0E = "#ad8ee6", -- keywords
		base0F = "#787c99", -- symbols
	}
}

vim.cmd[[hi Search guibg=#0f0f15 guifg=#a9b1d6]]
vim.cmd[[hi CurSearch guibg=#0f0f15 guifg=#a9b1d6]]
vim.cmd[[hi IncSearch guibg=#0f0f15 guifg=#a9b1d6]]

vim.cmd[[hi SignColumn guibg=#0a0a0f]]
vim.cmd[[hi LineNr guibg=#0a0a0f]]
vim.cmd[[hi FoldColumn guibg=#0a0a0f]]

vim.cmd[[hi StatusLine guibg=#0a0a0f guifg=#a9b1d6]]
vim.cmd[[hi MsgArea guibg=#0a0a0f guifg=#a9b1d6]]

vim.o.showtabline = 1
vim.o.tabline = "%!v:lua.CustomTabline()"

function _G.CustomTabline()
	local s = ""
	local tabs = vim.api.nvim_list_tabpages()
	local current = vim.api.nvim_get_current_tabpage()

	for i, tab in ipairs(tabs) do
		local is_active = (tab == current)

		if is_active then
			s = s .. "%#MiniStatuslineModeInsert#   " .. i .. "   %#Pmenu#"
		else
			s = s .. "%#Pmenu#   " .. i .. "   "
		end
	end

	return s
end

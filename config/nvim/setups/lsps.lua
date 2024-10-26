-- Setup python LSP
local capabilities = require("cmp_nvim_lsp").default_capabilities()
require("lspconfig").pylsp.setup{
	settings = {
		pylsp = {
			plugins = {
				pycodestyle = {
					enabled = false,
					ignore = {"F401","W191","E501","E402","E701","F405","F403"},
					maxLineLength = 100
				}
			}
		}
	},

	capabilities = capabilities
}

-- Setup gdscript lsp
require("lspconfig").gdscript.setup{capabilities=capabilities}

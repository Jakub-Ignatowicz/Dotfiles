local M = {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
	},
}

function M.config()
	local servers = {
		"lua_ls",
		"cssls",
		"html",
		"ts_ls",
		"bashls",
		"jsonls",
	}

	require("mason").setup({
		ui = {
			border = "rounded",
		},
	})

	require("mason-lspconfig").setup({
		ensure_installed = servers,
		automatic_installation = true,
	})

	require("mason-lspconfig").setup_handlers({
		function(server_name)
			require("lspconfig")[server_name].setup({})
		end,

		["omnisharp"] = function()
			local lspconfig = require("lspconfig")
			lspconfig.omnisharp.setup({
				cmd = {
					"/Users/admin/.local/share/nvim/mason/bin/omnisharp",
				},
			})
		end,
	})
end

return M

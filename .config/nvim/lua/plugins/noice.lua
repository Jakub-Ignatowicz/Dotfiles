local M = {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		{
			"rcarriga/nvim-notify",
			config = function()
				require("notify").setup({
					background_colour = "#000000",
				})
			end,
		},
	},
}

function M.config()
	require("noice").setup({
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
		presets = {
			bottom_search = true,
			command_palette = true,
			long_message_to_split = true,
			inc_rename = false,
			lsp_doc_border = false,
		},
		views = {
			mini = {
				win_options = {
					winblend = 0,
					winhighlight = "Normal:Normal,FloatBorder:Normal",
				},
			},
			popup = {
				win_options = {
					winblend = 0,
					winhighlight = "Normal:Normal,FloatBorder:Normal",
				},
			},
			popupmenu = {
				win_options = {
					winblend = 0,
					winhighlight = "Normal:Normal,FloatBorder:Normal",
				},
			},
			cmdline_popup = {
				win_options = {
					winblend = 0,
					winhighlight = "Normal:Normal,FloatBorder:Normal",
				},
			},
		},
	})

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
end

return M

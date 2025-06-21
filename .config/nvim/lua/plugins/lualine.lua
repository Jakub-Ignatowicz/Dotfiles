local M = {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"AndreM222/copilot-lualine",
	},
}

function M.config()
	require("lualine").setup({
		options = {
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			ignore_focus = { "NvimTree" },
			theme = {
				normal = {
					a = { bg = "none", fg = "#ffffff" },
					b = { bg = "none", fg = "#ffffff" },
					c = { bg = "none", fg = "#ffffff" },
				},
				insert = {
					a = { bg = "none", fg = "#ffffff" },
					b = { bg = "none", fg = "#ffffff" },
					c = { bg = "none", fg = "#ffffff" },
				},
				visual = {
					a = { bg = "none", fg = "#ffffff" },
					b = { bg = "none", fg = "#ffffff" },
					c = { bg = "none", fg = "#ffffff" },
				},
				replace = {
					a = { bg = "none", fg = "#ffffff" },
					b = { bg = "none", fg = "#ffffff" },
					c = { bg = "none", fg = "#ffffff" },
				},
				command = {
					a = { bg = "none", fg = "#ffffff" },
					b = { bg = "none", fg = "#ffffff" },
					c = { bg = "none", fg = "#ffffff" },
				},
				inactive = {
					a = { bg = "none", fg = "#ffffff" },
					b = { bg = "none", fg = "#ffffff" },
					c = { bg = "none", fg = "#ffffff" },
				},
			},
		},
		sections = {
			lualine_a = {},
			lualine_b = { "branch" },
			lualine_c = { "diagnostics" },
			lualine_x = { "copilot", "filetype" },
			lualine_y = { "progress" },
			lualine_z = {},
		},
		extensions = { "quickfix", "man", "fugitive" },
	})
end

return M

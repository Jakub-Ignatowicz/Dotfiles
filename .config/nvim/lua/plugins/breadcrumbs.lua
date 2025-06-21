local M = {
	"LunarVim/breadcrumbs.nvim",
}

function M.config()
	vim.api.nvim_set_hl(0, "WinBar", { bg = "none" })
	vim.api.nvim_set_hl(0, "WinBarNC", { bg = "none" })
	require("breadcrumbs").setup()
end

return M

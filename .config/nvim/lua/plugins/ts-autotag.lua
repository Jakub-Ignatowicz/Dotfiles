local M = {
	"windwp/nvim-ts-autotag",
}

function M.config()
	require("nvim-treesitter.configs").setup({
		autotag = {
			enable = true,
		},
	})

	require("nvim-ts-autotag").setup()
end

return M

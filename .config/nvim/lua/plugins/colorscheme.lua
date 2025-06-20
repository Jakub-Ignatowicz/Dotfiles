local M = {
  "LunarVim/darkplus.nvim",
  lazy = false,   -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
}

function M.config()
  vim.cmd([[
  hi Normal guibg=NONE ctermbg=NONE
  hi NormalNC guibg=NONE ctermbg=NONE
  hi VertSplit guibg=NONE ctermbg=NONE
  hi StatusLine guibg=NONE ctermbg=NONE
  hi LineNr guibg=NONE ctermbg=NONE
]])
end

return M

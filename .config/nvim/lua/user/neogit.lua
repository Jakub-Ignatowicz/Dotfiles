local M = {
  "neogitorg/neogit",
  event = "VeryLazy",
}

M.keys = {
  { "<leader>gg", "<cmd>Neogit<CR>", opts },
}

function M.config()
  local icons = require "user.icons"
  local neogit = require('neogit')

  neogit.setup {
    auto_refresh = true,
    disable_builtin_notifications = false,
    use_magit_keybindings = false,
    -- Change the default way of opening neogit
    kind = "tab",
    -- Change the default way of opening the commit popup
    commit_popup = {
      kind = "split",
    },
    -- Change the default way of opening popups
    popup = {
      kind = "split",
    },
    -- customize displayed signs
    signs = {
      -- { CLOSED, OPENED }
      section = { icons.ui.ChevronRight, icons.ui.ChevronShortDown },
      item = { icons.ui.ChevronRight, icons.ui.ChevronShortDown },
      hunk = { "", "" },
    },
  }
end

return M

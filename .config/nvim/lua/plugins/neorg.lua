local M = {
  "nvim-neorg/neorg",
  lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
  version = "*", -- Pin Neorg to the latest stable release
  config = true,
}

function M.config()
  require("neorg").setup({
    load = {
      ["core.defaults"] = {},
      ["core.completion"] = { config = { engine = "nvim-cmp", name = "[Norg]" } },
      ["core.integrations.nvim-cmp"] = {},
      ["core.concealer"] = { config = { icon_preset = "diamond" } },
      ["core.dirman"] = {
        config = {
          workspaces = {
            notes = "~/Documents/Notes",
          },
          index = "index.norg",
        },
      },
    },
  })
end

return M

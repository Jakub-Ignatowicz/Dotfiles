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
    automatic_enable = true,
  })
end

return M

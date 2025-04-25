local M = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      "folke/neodev.nvim",
    },
  },
}

M.keys = {
  {"gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts},
  {"gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts},
  {"K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts},
  {"gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts},
  {"gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts},
  {"gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts},
  { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts},
  {
    "<leader>lf",
    "<cmd>lua vim.lsp.buf.format({async = true, filter = function(client) return client.name ~= 'typescript-tools' end})<cr>",
    opts,
  },
  { "<leader>lh", "<cmd>lua require('user.lspconfig').toggle_inlay_hints()<cr>", opts},
  { "<leader>li", "<cmd>LspInfo<cr>", opts},
  { "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts},
  { "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts},
  { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", opts},
  { "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", opts},
  { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts},
  { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts},
}

M.on_attach = function(client, bufnr)
  if client.supports_method "textDocument/inlayHint" then
    vim.lsp.inlay_hint.enable(true, { bufnr })
  end
end

function M.common_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  return capabilities
end

M.toggle_inlay_hints = function()
  local bufnr = vim.api.nvim_get_current_buf()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr }, { bufnr })
end

function M.config()
  local icons = require "user.icons"

  local default_diagnostic_config = {
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = icons.diagnostics.Error,
        [vim.diagnostic.severity.WARN]  = icons.diagnostics.Warning,
        [vim.diagnostic.severity.HINT]  = icons.diagnostics.Hint,
        [vim.diagnostic.severity.INFO]  = icons.diagnostics.Information,
      },
      active = true,
      values = {
        { name = "DiagnosticSignError", text = icons.diagnostics.Error },
        { name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
        { name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
        { name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
      },
    },
    virtual_text = false,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(default_diagnostic_config)

  for _, sign in ipairs(vim.tbl_get(vim.diagnostic.config(), "signs", "values") or {}) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
  end

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
  require("lspconfig.ui.windows").default_options.border = "rounded"
end

return M

local M = {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "vim-test/vim-test",
    "nvim-neotest/neotest-vim-test",
    "marilari88/neotest-vitest",
    "nvim-neotest/neotest-python",
    "nvim-neotest/neotest-plenary",
    "nvim-neotest/neotest-go",
    "rouge8/neotest-rust",
    "nvim-neotest/nvim-nio",
    "lawrence-laz/neotest-zig",
    "rcasia/neotest-bash",
    "rcasia/neotest-java",
    "olimorris/neotest-rspec",
  },
}

M.keys = {
    { "<leader>ta", "<cmd>lua require('neotest').run.attach()<cr>", desc = "Attach Test" },
    { "<leader>td", "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", desc = "Debug Test" },
    { "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", desc = "Test File" },
    { "<leader>ts", "<cmd>lua require('neotest').run.stop()<cr>", desc = "Test Stop" },
    { "<leader>tt", "<cmd>lua require'neotest'.run.run()<cr>", desc = "Test Nearest" },
}

function M.config()

  ---@diagnostic disable: missing-fields
  require("neotest").setup {
    adapters = {
       require("neotest-rspec"),
      require "neotest-java" {
        ignore_wrapper = false,
      },
      require "neotest-go",
      require "neotest-python" {
        dap = { justMyCode = false },
      },
      require "neotest-vitest",
      require "neotest-zig",
      require "neotest-vim-test" {
        ignore_file_types = { "python", "vim", "lua", "javascript", "typescript" },
      },
    },
  }
end

return M

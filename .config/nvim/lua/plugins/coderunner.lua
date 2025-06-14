local M = {
  "CRAG666/code_runner.nvim",
}

M.keys = {
  { "<leader>rr",  ":RunCode<CR>",     opts },
  { "<leader>rf",  ":RunFile<CR>",     opts },
  { "<leader>rft", ":RunFile tab<CR>", opts },
  { "<leader>rp",  ":RunProject<CR>",  opts },
  { "<leader>rc",  ":RunClose<CR>",    opts },
  { "<leader>crf", ":CRFiletype<CR>",  opts },
  { "<leader>crp", ":CRProjects<CR>",  opts },
}

function M.config()
  require("code_runner").setup({
    filetype = {
      java = {
        "cd $dir &&",
        "javac $fileName &&",
        "java $fileNameWithoutExt",
      },
      python = "python -u",
      typescript = "npm run dev",
      rust = {
        "cd $dir &&",
        "rustc $fileName &&",
        "$dir/$fileNameWithoutExt",
      },
      c = function(...)
        c_base = {
          "cd $dir &&",
          "gcc $fileName -o",
          "/tmp/$fileNameWithoutExt",
        }
        local c_exec = {
          "&& /tmp/$fileNameWithoutExt &&",
          "rm /tmp/$fileNameWithoutExt",
        }
        vim.ui.input({ prompt = "Add more args:" }, function(input)
          c_base[4] = input
          vim.print(vim.tbl_extend("force", c_base, c_exec))
          require("code_runner.commands").run_from_fn(vim.list_extend(c_base, c_exec))
        end)
      end,
    },
  })
end

return M

local keymap = vim.keymap.set
opts = { noremap = true, silent = true }

keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = ";"

keymap("n", "<C-i>", "<C-i>", opts)

keymap("i", "jk", "<Esc>", opts)

-- Split navigation
keymap("n", "<m-h>", "<C-w>h", opts)
keymap("n", "<m-j>", "<C-w>j", opts)
keymap("n", "<m-k>", "<C-w>k", opts)
keymap("n", "<m-l>", "<C-w>l", opts)
keymap("n", "<m-tab>", "<c-6>", opts)
keymap("n", "<leader>v", "<cmd>vsplit<CR>", opts)

-- Tab navigation

keymap("n", "<C-N>", "<cmd>tabnew %<cr>", opts)
keymap("n", "<C-h>", "<cmd>tabprevious<cr>", opts)
keymap("n", "<C-l>", "<cmd>tabnext<cr>", opts)

-- Quitting and saving

keymap("n", "<leader>qQ", "<cmd>qa!<CR>", opts)
keymap("n", "<leader>qW", "<cmd>wqa!<CR>", opts)
keymap("n", "<leader>qq", "<cmd>confirm q<CR>", opts)
keymap("n", "<leader>qw", "<cmd>wq<CR>", opts)

vim.keymap.set("n", "<leader>w", function()
	vim.lsp.buf.format()
	vim.cmd("w")
end, opts)

keymap("n", "<leader>W", "<cmd>w<CR>", opts)

-- Mason

keymap("n", "<leader>m", "<cmd>Mason<CR>", opts)

-- Center on search

keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Don't yank on X
keymap("x", "p", [["_dP]])

-- Mouse
vim.cmd([[:amenu 10.100 mousemenu.Goto\ Definition <cmd>lua vim.lsp.buf.definition()<CR>]])
vim.cmd([[:amenu 10.110 mousemenu.References <cmd>lua vim.lsp.buf.references()<CR>]])
-- vim.cmd [[:amenu 10.120 mousemenu.-sep- *]]

vim.keymap.set("n", "<RightMouse>", "<cmd>:popup mousemenu<CR>")
vim.keymap.set("n", "<Tab>", "<cmd>:popup mousemenu<CR>")

-- Move to end and front of the line
keymap({ "n", "o", "x" }, "<s-h>", "^", opts)
keymap({ "n", "o", "x" }, "<s-l>", "g_", opts)

-- tailwind bearable to work with
keymap({ "n", "x" }, "j", "gj", opts)
keymap({ "n", "x" }, "k", "gk", opts)

-- Normal mode in terminal
vim.api.nvim_set_keymap("t", "<C-;>", "<C-\\><C-n>", opts)

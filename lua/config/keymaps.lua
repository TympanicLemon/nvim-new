vim.keymap.set({ "n", "t" }, "<C-h>", "<C-w>h", { desc = "Move to left split" })
vim.keymap.set({ "n", "t" }, "<C-j>", "<C-w>j", { desc = "Move to below split" })
vim.keymap.set({ "n", "t" }, "<C-k>", "<C-w>k", { desc = "Move to above split" })
vim.keymap.set({ "n", "t" }, "<C-l>", "<C-w>l", { desc = "Move to right split" })

vim.keymap.set("n", "<S-h>", "<CMD>bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<S-l>", "<CMD>bnext<CR>", { desc = "Next buffer" })

vim.keymap.set("n", "<leader>w", "<CMD>w<CR><ESC>")
vim.keymap.set("n", "<leader>q", "<CMD>qa<CR>", { desc = "Quit all" })

vim.keymap.set("i", "<S-CR>", "<ESC>o", { desc = "Insert new line below" })

vim.keymap.set("v", "<", "<gv", { desc = "Better indenting" })
vim.keymap.set("v", ">", ">gv", { desc = "Better indenting" })

vim.keymap.set({ "i", "n" }, "<ESC>", "<CMD>noh<CR><ESC>", { desc = "Clear search highlights" })

vim.keymap.set("n", "<leader>e", "<CMD>Ex<CR>")

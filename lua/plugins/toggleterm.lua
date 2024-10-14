return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({})
		vim.keymap.set("n", "<leader>tt", "<CMD>ToggleTerm size=16 direction=horizontal<CR>")
	end,
}

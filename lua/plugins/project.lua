return {
	"ahmedkhalf/project.nvim",
	config = function()
		require("project_nvim").setup({})
		require("telescope").load_extension("projects")

		vim.keymap.set("n", "<leader>pr", "<CMD>Telescope projects<CR>")
	end,
}

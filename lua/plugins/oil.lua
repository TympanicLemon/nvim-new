return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			keymaps = {
				["?"] = "actions.show_help",
				["<CR>"] = "actions.select",
				["s"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
				["S"] = {
					"actions.select",
					opts = { horizontal = true },
					desc = "Open the entry in a horizontal split",
				},
				["t"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" },
				["p"] = "actions.preview",
				["<C-c>"] = "actions.close",
				["<C-l>"] = "actions.refresh",
				["<BS>"] = "actions.parent",
				["_"] = "actions.open_cwd",
				["-"] = "actions.cd",
				["~"] = {
					"actions.cd",
					opts = { scope = "tab" },
					desc = ":tcd to the current oil directory",
					mode = "n",
				},
				["gs"] = "actions.change_sort",
				["gx"] = "actions.open_external",
				["g."] = "actions.toggle_hidden",
				["g\\"] = "actions.toggle_trash",
			},
		})
		vim.keymap.set("n", "<leader>o", "<CMD>Oil<CR>")
	end,
}

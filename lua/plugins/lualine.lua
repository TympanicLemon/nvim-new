return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			theme = "auto",
			globalstatus = vim.o.laststatus == 3,
			disabled_filetypes = { statusline = { "dashboard" } },
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch" },
			lualine_c = {},
			lualine_x = {},
			lualine_y = {
				{ "progress", separator = " ", padding = { left = 1, right = 0 } },
				{ "location", padding = { left = 0, right = 1 } },
			},
			lualine_z = {
				function()
					return " " .. os.date("%R")
				end,
			},
		},
		extensions = { "neo-tree", "lazy" },
	},
}

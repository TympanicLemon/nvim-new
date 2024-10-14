return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
	config = function()
		require("dashboard").setup({
			theme = "hyper",
			config = {
				project = { enable = false },
				week_header = {
					enable = true,
				},
				shortcut = {
					{ desc = "󰒲 Lazy", group = "@property", action = "Lazy", key = "l" },
					{
						icon = " ",
						icon_hl = "@variable",
						desc = "Find files",
						group = "Label",
						action = "Telescope find_files",
						key = "f",
					},
					{
						desc = " Projects",
						group = "DiagnosticHint",
						action = "Telescope projects",
						key = "p",
					},
					{
						desc = "Find Word",
						group = "Number",
						action = "Telescope live_grep",
						key = "g",
					},
				},
			},
		})

		-- Open dashboard if lazy opens first
		if vim.o.filetype == "lazy" then
			vim.api.nvim_create_autocmd("WinClosed", {
				pattern = tostring(vim.api.nvim_get_current_win()),
				once = true,
				callback = function()
					vim.schedule(function()
						vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
					end)
				end,
			})
		end
	end,
}

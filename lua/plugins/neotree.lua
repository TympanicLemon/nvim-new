return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
		vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
		vim.fn.sign_define("DiagnosticSignInfo", { text = "󰋼", texthl = "DiagnosticSignInfo" })
		vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })

		require("neo-tree").setup({
			open_files_do_not_replace_types = { "terminal", "qf", "Outline" },
			filesystem = {
				filtered_items = {
					always_show = {
						".zshrc",
						".ideavimrc",
						".gitignore",
					},
				},
				follow_current_file = { enabled = true },
			},
			default_component_configs = {
				indent = {
					padding = 0,
					with_expanders = true,
					expander_collapsed = "",
					expander_expanded = "",
				},
				icon = {
					folder_closed = "",
					folder_open = "",
					folder_empty = "",
					folder_empty_open = "",
					default = "󰈙",
				},
				modified = { symbol = "" },
				git_status = {
					symbols = {
						added = "",
						deleted = "",
						modified = "",
						renamed = "➜",
						untracked = "★",
						ignored = "◌",
						unstaged = "✗",
						staged = "✓",
						conflict = "",
					},
				},
				diagnostics = {
					symbols = {
						hint = "󰌵",
						info = "󰋼",
						warn = "",
						error = "",
					},
					highlights = {
						hint = "DiagnosticSignHint",
						info = "DiagnosticSignInfo",
						warn = "DiagnosticSignWarn",
						error = "DiagnosticSignError",
					},
				},
			},
			window = {
				position = "left",
			},
		})

		-- Key mapping to toggle Neo-tree
		vim.keymap.set("n", "<leader>e", function()
			require("neo-tree.command").execute({
				toggle = true,
				position = "left",
			})
		end)

		-- Refresh Neo-tree git status when lazygit is closed
		vim.api.nvim_create_autocmd("TermClose", {
			pattern = "*lazygit",
			callback = function()
				if package.loaded["neo-tree.sources.git_status"] then
					require("neo-tree.sources.git_status").refresh()
				end
			end,
		})

		-- Autocmd to open Neo-tree in the current window if opening Neovim with a directory
		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function()
				local arg = vim.fn.argv(0)
				if vim.fn.isdirectory(arg) == 1 then
					require("neo-tree").setup({
						window = {
							position = "current",
						},
					})
					vim.cmd("Neotree reveal")
				end
			end,
		})
	end,
}

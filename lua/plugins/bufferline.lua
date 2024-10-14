local icons = require("utils.icons")

return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	dependencies = {
		{
			"echasnovski/mini.bufremove",
			version = false,
		},
	},
	keys = {
		{ "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
		{ "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
	},
	opts = {
		options = {
			close_command = function(buf_id)
				require("mini.bufremove").delete(buf_id, false)
			end,
			right_mouse_command = function(buf_id)
				require("mini.bufremove").delete(buf_id, false)
			end,
			always_show_bufferline = false,
			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(_, _, diag)
				local ret = (diag.error and icons.diagnostics.Error .. diag.error .. " " or "")
					.. (diag.warn and icons.diagnostics.Warn .. diag.warn or "")

				return vim.trim(ret)
			end,
			offsets = {
				{
					filetype = "neo-tree",
					text = "Neo-tree",
					highlight = "Directory",
					text_align = "left",
				},
			},
		},
	},
	config = function(_, opts)
		require("bufferline").setup(opts)
		vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, {
			callback = function()
				vim.schedule(function()
					pcall(nvim_bufferline)
				end)
			end,
		})

		-- Delete all buffers to the right of the current one
		vim.keymap.set("n", "<leader>bl", function()
			local current_buf = vim.fn.bufnr("%")
			local buffers = vim.fn.getbufinfo({ buflisted = 1 })
			for _, buf in ipairs(buffers) do
				if buf.bufnr > current_buf then
					require("mini.bufremove").delete(buf.bufnr, true)
				end
			end
		end, { noremap = true, silent = true })

		-- Delete all buffers to the left of the current one
		vim.keymap.set("n", "<leader>bh", function()
			local current_buf = vim.fn.bufnr("%")
			local buffers = vim.fn.getbufinfo({ buflisted = 1 })
			for _, buf in ipairs(buffers) do
				if buf.bufnr < current_buf then
					require("mini.bufremove").delete(buf.bufnr, true)
				end
			end
		end, { noremap = true, silent = true })

		-- Delete all buffers except the current one
		vim.keymap.set("n", "<leader>ba", function()
			local current_buf = vim.fn.bufnr("%")
			local buffers = vim.fn.getbufinfo({ buflisted = 1 })
			for _, buf in ipairs(buffers) do
				if buf.bufnr ~= current_buf then
					require("mini.bufremove").delete(buf.bufnr, true)
				end
			end
		end, { noremap = true, silent = true })

		vim.keymap.set("n", "<leader>c", function()
			require("mini.bufremove").delete(0, false)
		end)
	end,
}

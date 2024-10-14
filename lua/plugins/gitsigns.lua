return {
	"lewis6991/gitsigns.nvim",
	opts = {
		signs = {
			add = { text = "▎" },
			change = { text = "▎" },
			delete = { text = "" },
			topdelete = { text = "" },
			changedelete = { text = "▎" },
			untracked = { text = "▎" },
		},
		signs_staged = {
			add = { text = "▎" },
			change = { text = "▎" },
			delete = { text = "" },
			topdelete = { text = "" },
			changedelete = { text = "▎" },
		},
		on_attach = function(buffer)
			local gs = package.loaded.gitsigns

			local function map(mode, l, r, desc)
				vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
			end

			map({ "n", "v" }, "<leader>gs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
			map({ "n", "v" }, "<leader>gr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
			map("n", "<leader>gS", gs.stage_buffer, "Stage Buffer")
			map("n", "<leader>gu", gs.undo_stage_hunk, "Undo Stage Hunk")
			map("n", "<leader>gR", gs.reset_buffer, "Reset Buffer")
			map("n", "<leader>gp", gs.preview_hunk_inline, "Preview Hunk Inline")
			map("n", "<leader>gb", function()
				gs.blame_line({ full = true })
			end, "Blame Line")
			map("n", "<leader>gB", function()
				gs.blame()
			end, "Blame Buffer")
			map("n", "<leader>gd", gs.diffthis, "Diff This")
		end,
	},
}

return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	main = "nvim-treesitter.configs",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "css", "diff", "html", "javascript", "lua", "markdown", "python", "query", "vimdoc" },
			sync_install = false,

			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
		})
	end,
}

return{
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"c", "lua", "rust", "python", "vim", "vimdoc", "zig", "c", "html", "wgsl", "json", "yaml", "sql", "wgsl"
			},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
      modules ={},
      auto_install = true,
		})
	end
}

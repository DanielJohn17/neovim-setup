return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		icons_enabled = true,
		theme = "tokyonight-night",
		sections = {
			lualine_a = {
				{
					"filename",
					path = 1,
					"diff",
					colored = true,
				},
			},
		},
	},
}

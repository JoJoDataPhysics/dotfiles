return {
	{
		"echasnovski/mini.nvim",
		version = false,
		config = function()
			require("mini.jump2d").setup()
			require("mini.jump").setup()
		end,
	},
}

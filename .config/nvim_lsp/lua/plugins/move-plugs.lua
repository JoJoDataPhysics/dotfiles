return {
	{ "unblevable/quick-scope" },
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").create_default_mappings()
		end,
	},
}

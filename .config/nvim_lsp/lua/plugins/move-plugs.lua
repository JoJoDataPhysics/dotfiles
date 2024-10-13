return {
    {
        "phaazon/hop.nvim",
        lazy = false,
        branch = "v2", -- optional but strongly recommended
        config = function()
            local hop = require("hop")
            local directions = require("hop.hint").HintDirection
            vim.keymap.set("", "<leader>ü", function()
                hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false })
            end, { desc = "f whole text", remap = true })
            vim.keymap.set("", "<leader>ö", function()
                hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false, hint_offset = -1 })
            end, { desc = "t whole text", remap = true })
            vim.keymap.set("", "<leader>Ü", function()
                hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false })
            end, { desc = "f whole text bw", remap = true })
            vim.keymap.set("", "<leader>Ö", function()
                hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false, hint_offset = -1 })
            end, { desc = "t whole text bw", remap = true })
            require("hop").setup()
        end,
    },
	{ "unblevable/quick-scope" },
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").create_default_mappings()
		end,
	},
}

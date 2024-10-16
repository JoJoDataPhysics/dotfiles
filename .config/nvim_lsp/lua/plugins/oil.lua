return {
    {
        'stevearc/oil.nvim',
            lazy = false,
            dependencies = { 'nvim-tree/nvim-web-devicons' },
            config = function()
                vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
                require('oil').setup {}
        end,
    },
}

return {
    {
        'echasnovski/mini.nvim',
        version = false,
        config = function()
            require('mini.jump').setup()
            require('mini.jump2d').setup()
        end,
    },

}


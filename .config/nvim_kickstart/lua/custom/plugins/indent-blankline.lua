return {
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    commit = '29be0919b91fb59eca9e90690d76014233392bef',
    config = function()
      require 'custom.configs.indent_blankline'
    end,
  },
}

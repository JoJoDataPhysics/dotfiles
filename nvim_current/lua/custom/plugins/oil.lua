return {
  {
    'stevearc/oil.nvim',
    lazy = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require 'custom.configs.oil_config'
      require('oil').setup {}
    end,
  },
}

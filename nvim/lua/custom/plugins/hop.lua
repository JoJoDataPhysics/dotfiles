return {
  {
    'phaazon/hop.nvim',
    lazy = false,
    branch = 'v2', -- optional but strongly recommended
    config = function()
      require 'custom.configs.hop_conf'
      require('hop').setup()
    end,
  },
}

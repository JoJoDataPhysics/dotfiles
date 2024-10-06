return {
  {
    'nvim-orgmode/orgmode',
    ft = { 'org' },
    config = function()
      require 'custom.configs.org_config'
    end,
  },
}

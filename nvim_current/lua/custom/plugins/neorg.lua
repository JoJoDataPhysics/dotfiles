return {
  {
    'nvim-neorg/neorg',
    ft = 'norg',
    config = function()
      require('neorg').setup {
        load = {
          ['core.defaults'] = {},
          ['core.concealer'] = {},
          ['core.export.markdown'] = {},
          ['core.dirman'] = {
            config = {
              workspaces = {
                notes = '~/notes',
                code = '~/notes/code', -- Format: <name_of_workspace> = <path_to_workspace_root>
                tools = '~/notes/tools',
              },
              index = 'index.norg',
              default_workspace = 'notes',
            },
          },
        },
      }
    end,
    run = 'Neorg sync-parsers',
    requires = 'nvim-lua/plenary.nvim',
  },
}

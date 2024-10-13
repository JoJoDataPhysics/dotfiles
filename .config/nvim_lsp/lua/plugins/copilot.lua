return {
  {
    'github/copilot.vim',
    lazy = false,
    config = function() -- Mapping tab is already used by NvChad
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
      vim.g.copilot_tab_fallback = ''
      vim.g.copilot_no_tab_map = true
      vim.api.nvim_set_keymap('i', '<M-y>', 'copilot#Accept("<CR>")', { silent = true, expr = true })
      vim.keymap.set('i', '<M-k>', '<Plug>(copilot-next)')
      vim.keymap.set('i', '<M-l>', '<Plug>(copilot-prev)')
      vim.keymap.set('i', '<M-q>', '<Plug>(copilot-dismiss)')
    end,
  },
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    lazy = false,
    branch = 'canary',
    dependencies = {
      { 'zbirenbaum/copilot.lua' }, -- or github/copilot.vim
      { 'nvim-lua/plenary.nvim' }, -- for curl, log wrapper
    },
    build = 'make tiktoken', -- Only on MacOS or Linux
    opts = {
      debug = true, -- Enable debugging
      -- See Configuration section for rest
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}

return {
  {
    'robitx/gp.nvim',
    config = function()
      local conf = {
        openai_api_key = { 'pass', 'coding/chatGPT' },

        providers = {
          -- openai = {
          --   endpoint = 'https://api.openai.com/v1/chat/completions',
          --   secret = { 'pass', 'coding/chatGPT' },
          -- },
          --
          -- azure = {...},

          copilot = {
            endpoint = 'https://api.githubcopilot.com/chat/completions',
            secret = {
              'bash',
              '-c',
              "cat ~/.config/github-copilot/hosts.json | sed -e 's/.*oauth_token...//;s/\".*//'",
            },
          },
        },
      }
      require('gp').setup(conf)

      -- Setup shortcuts here (see Usage > Shortcuts in the Documentation/Readme)
    end,
  },
}

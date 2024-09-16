return {
  {
    'folke/twilight.nvim',
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    'junegunn/fzf',
    run = function()
      vim.fn['fzf#install']()
    end,
  },
  {
    'chipsenkbeil/distant.nvim',
    lazy = false,
    branch = 'v0.3',
    config = function()
      require('distant'):setup()
    end,
  },
  {
    'tpope/vim-dadbod',
    event = 'VeryLazy',
  },
  { 'nvim-lua/plenary.nvim' },
  {
    'kristijanhusak/vim-dadbod-ui',
    event = 'VeryLazy',
  },
  {
    'folke/persistence.nvim',
    event = 'BufReadPre',
    config = function()
      require('persistence').setup {
        dir = vim.fn.expand(vim.fn.stdpath 'state' .. '/sessions/'),
        options = { 'buffers', 'curdir', 'tabpages', 'winsize' },
      }
    end,
  },
  { 'tpope/vim-speeddating' },
  { 'kevinhwang91/nvim-bqf', ft = 'qf' },
  {
    'Wansmer/treesj',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('treesj').setup {
        use_default_keymaps = true,
      }
    end,
  },
  {
    'dhruvasagar/vim-dotoo',
    ft = 'dotoo',
  },
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  -- commented out because plugin crashes nvim in wsl ...
  -- {
  --   'ziontee113/icon-picker.nvim',
  --   config = function()
  --     require('icon-picker').setup { disable_legacy_commands = true }

  -- local opts = { noremap = true, silent = true }

  -- vim.keymap.set('n', '<Leader>ii', '<cmd>IconPickerNormal<cr>', opts)
  -- vim.keymap.set('n', '<Leader>iy', '<cmd>IconPickerYank<cr>', opts) --> Yank the selected icon into register
  --     vim.keymap.set('n', '<C-i>', '<cmd>IconPickerInsert<cr>', opts)
  --   end,
  -- },
  { 'folke/zen-mode.nvim' },
  {
    'folke/trouble.nvim',
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = 'Trouble',
    keys = {
      {
        '<leader>xx',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics (Trouble)',
      },
      {
        '<leader>xX',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = 'Buffer Diagnostics (Trouble)',
      },
      {
        '<leader>cs',
        '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = 'Symbols (Trouble)',
      },
      {
        '<leader>cl',
        '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
        desc = 'LSP Definitions / references / ... (Trouble)',
      },
      {
        '<leader>xL',
        '<cmd>Trouble loclist toggle<cr>',
        desc = 'Location List (Trouble)',
      },
      {
        '<leader>xQ',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Quickfix List (Trouble)',
      },
    },
  },
  {
    'williamboman/mason.nvim',
    opts = {
      ensure_installed = {
        -- 'pyright',
        'clj-kondo',
        'clangd',
        'clang-format',
        'jsond',
        'codelldb',
      },
    },
  },
  { 'tpope/vim-fugitive' },
  { 'tpope/vim-surround' },
  { 'tpope/vim-sensible' },
  { 'ThePrimeagen/vim-be-good' },
  {
    'goolord/alpha-nvim',
    -- dependencies = { 'echasnovski/mini.icons' },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local startify = require 'alpha.themes.startify'
      -- available: devicons, mini, default is mini
      -- if provider not loaded and enabled is true, it will try to use another provider
      startify.file_icons.provider = 'devicons'
      require('alpha').setup(startify.config)
    end,
  },
  { 'tpope/vim-scriptease' },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    commit = '29be0919b91fb59eca9e90690d76014233392bef',
    config = function()
      require 'custom.configs.indent_blankline'
    end,
  },
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
  {
    'willothy/nvim-cokeline',
    dependencies = {
      'nvim-lua/plenary.nvim', -- Required for v0.4.0+
      'nvim-tree/nvim-web-devicons', -- If you want devicons
      'stevearc/resession.nvim', -- Optional, for persistent history
    },
    config = true,
  },
  {
    'jackMort/ChatGPT.nvim',
    event = 'VeryLazy',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      require('chatgpt').setup {
        api_key_cmd = 'pass show coding/chatGPT',
      }
    end,
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    lazy = false, -- This plugin is already lazy
    ft = 'rust',
    config = function()
      local mason_registry = require 'mason-registry'
      local codelldb = mason_registry.get_package 'codelldb'
      local extension_path = codelldb:get_install_path() .. '/extension/'
      local codelldb_path = extension_path .. 'adapter/codelldb'
      local liblldb_path = extension_path .. 'lldb/lib/liblldb.dylib'
      local cfg = require 'rustaceanvim.config'

      vim.g.rustaceanvim = {
        dap = {
          adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
        },
      }
    end,
  },

  {
    'rust-lang/rust.vim',
    ft = 'rust',
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },

  {
    'mfussenegger/nvim-dap',
    config = function()
      local dap, dapui = require 'dap', require 'dapui'
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
  },

  {
    'rcarriga/nvim-dap-ui',
    dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
    config = function()
      require('dapui').setup()
    end,
  },

  {
    'saecki/crates.nvim',
    ft = { 'toml' },
    config = function()
      require('crates').setup {
        completion = {
          cmp = {
            enabled = true,
          },
        },
      }
      require('cmp').setup.buffer {
        sources = { { name = 'crates' } },
      }
    end,
  },
  {
    'github/copilot.vim',
    lazy = false,
    config = function() -- Mapping tab is already used by NvChad
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
      vim.g.copilot_tab_fallback = ''
      -- The mapping is set to other key, see custom/lua/mappings
      -- or run <leader>ch to see copilot mapping section
    end,
  },
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
  { 'tpope/vim-repeat' },
  {
    'epwalsh/obsidian.nvim',
    version = '*', -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = 'markdown',
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --   -- refer to `:h file-pattern` for more examples
    --   "BufReadPre path/to/my-vault/*.md",
    --   "BufNewFile path/to/my-vault/*.md",
    -- },
    dependencies = {
      -- Required.
      'nvim-lua/plenary.nvim',

      -- see below for full list of optional dependencies 👇
    },
    opts = {
      workspaces = {
        {
          name = 'obsidian',
          path = '~/Documents/obsidian',
        },
      },

      -- see below for full list of options 👇
    },
  },
  { 'godlygeek/tabular' },
  {
    'nvim-orgmode/orgmode',
    ft = { 'org' },
    config = function()
      require 'custom.configs.org_config'
    end,
  },
  {
    'folke/todo-comments.nvim',
    event = 'BufRead',
    config = function()
      require('todo-comments').setup()
    end,
  },
  { 'unblevable/quick-scope' },
  {
    'phaazon/hop.nvim',
    lazy = false,
    branch = 'v2', -- optional but strongly recommended
    config = function()
      require 'custom.configs.hop_conf'
      require('hop').setup()
    end,
  },
  {
    'nvim-orgmode/orgmode',
    ft = { 'org' },
    config = function()
      require 'custom.configs.org_config'
    end,
  },
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

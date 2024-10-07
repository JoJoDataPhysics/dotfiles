-- Highlight, edit, and navigate code
return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
        require('nvim-treesitter.configs').setup {
            -- Add languages to be installed here that you want installed for treesitter
            ensure_installed = {
                'lua',
                'python',
                'rust',
                'c',
                'commonlisp',
                'cpp',
                'c_sharp',
                'haskell',
                'clojure',
                'javascript',
                'typescript',
                'vimdoc',
                'vim',
                'regex',
                'terraform',
                'sql',
                'dockerfile',
                'toml',
                'json',
                'java',
                'groovy',
                'go',
                'gitignore',
                'graphql',
                'yaml',
                'make',
                'cmake',
                'markdown',
                'markdown_inline',
                'bash',
                'tsx',
                'css',
                'html',
            },

            -- Autoinstall languages that are not installed
            auto_install = true,

            highlight = { enable = true },
            indent = { enable = true },
        }

        -- Register additional file extensions
        vim.filetype.add { extension = { tf = 'terraform' } }
        vim.filetype.add { extension = { tfvars = 'terraform' } }
        vim.filetype.add { extension = { pipeline = 'groovy' } }
        vim.filetype.add { extension = { multibranch = 'groovy' } }
    end,
}

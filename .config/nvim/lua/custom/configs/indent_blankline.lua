vim.opt.list = true
vim.opt.listchars:append 'space:⋅'
vim.opt.listchars:append 'eol:↴'

vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guibg=#0a0a40 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guibg=#03033f gui=nocombine]]

local highlight = {
  'CursorColumn',
  'Whitespace',
}
require('ibl').setup {
  indent = { highlight = highlight, char = '' },
  whitespace = {
    highlight = highlight,
    remove_blankline_trail = false,
  },
  scope = { enabled = false },
}

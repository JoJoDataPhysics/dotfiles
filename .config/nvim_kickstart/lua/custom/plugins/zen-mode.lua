return {
  {
    'folke/zen-mode.nvim',
    opts = {
      on_open = function(_)
        require('noice').disable()
        require('ufo').disable()
        vim.o.foldcolumn = '0'
        vim.o.foldenable = false
      end,
      on_close = function()
        require('noice').enable()
        require('ufo').enable()
        vim.o.foldcolumn = '1'
        vim.o.foldenable = true
      end,
    },
  },
}

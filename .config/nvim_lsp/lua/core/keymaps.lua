vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opts = { noremap = true, silent = true }

-- esc remap for my comfort
vim.keymap.set("i", "jj", "<ESC>")

-- scroll page wise and recenter
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-b>", "<C-b>zz")
vim.keymap.set("n", "<C-f>", "<C-f>zz")

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x', opts)

-- Resize with arrows
vim.keymap.set("n", "<M-Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<M-Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<M-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<M-Right>", ":vertical resize +2<CR>", opts)

-- Buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", opts)
vim.keymap.set("n", "<leader>x", "<cmd>bd<CR>", opts) -- close buffer
vim.keymap.set("n", "<leader>b", "<cmd> enew <CR>", opts) -- new buffer

-- Window management
vim.keymap.set("n", "<leader>v", "<C-w>v", opts) -- split window vertically
vim.keymap.set("n", "<leader>h", "<C-w>s", opts) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", opts) -- make split windows equal width & height
vim.keymap.set("n", "<leader>xs", ":close<CR>", opts) -- close current split window

-- disallow arrow keys
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Navigate between splits
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", opts)
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", opts)
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", opts)
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", opts)

-- Tabs
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", opts) -- open new tab
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", opts) -- close current tab
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", opts) --  go to next tab
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", opts) --  go to previous tab

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Move text up and down
vim.keymap.set("v", "<A-k>", ":m .-2<CR>== V", opts)
vim.keymap.set("v", "<A-j>", ":m .+1<CR>== V", opts)

-- Keep last yanked when pasting
vim.keymap.set("v", "p", '"_dP', opts)

-- twilight
vim.keymap.set("n", "<leader>tt", ":Twilight<cr>", { desc = "[T]oggle [T]wilight" })

-- zen mode
vim.keymap.set("n", "<leader>tz", ":ZenMode<cr>", { desc = "[T]oggle [Z]en Mode" })

-- Togle language server
vim.keymap.set("n", "<leader>cle", "<cmd>LspStop<CR>", { desc = "[C]ode LSP [E]nd" })
vim.keymap.set("n", "<leader>cls", "<cmd>LspStart<CR>", { desc = "[C]ode LSP [S]tart" })
vim.keymap.set("n", "<leader>cce", "<cmd>lua require('cmp').setup.buffer { enabled = false }<CR>",{ desc = "[C]ode [C]mp [E]nd" })
vim.keymap.set("n", "<leader>ccs", "<cmd>lua require('cmp').setup.buffer { enabled = true }<CR>",{ desc = "[C]ode [C]mp [S]tart" })
--
-- load the session for the current directory
vim.keymap.set("n", "<leader>yL", function()
	require("persistence").load()
end, { desc = "Load session" })

vim.keymap.set("n", "<leader>ys", function()
	require("persistence").select()
end, { desc = "Select session" })

-- load the last session
vim.keymap.set("n", "<leader>yl", function()
	require("persistence").load({ last = true })
end, { desc = "Load last session" })

-- stop Persistence => session won't be saved on exit
vim.keymap.set("n", "<leader>yd", function()
	require("persistence").stop()
end, { desc = "Stop Persistence" })

-- Terminal use
vim.keymap.set('t','<leader><ESC>','<C-\\><C-n>',{desc = "Esc in terminal", noremap = true})
vim.keymap.set('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

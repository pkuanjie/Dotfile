local opts = { noremap = true, silent = true }

vim.g.mapleader = ';'

-- quick quit and esc
vim.keymap.set('n', 'qq', ':x<CR>', opts)
vim.keymap.set('i', 'jj', '<ESC>', opts)

-- buffer navigation
vim.keymap.set('n', '<C-n>', ':bnext<CR>', opts)
vim.keymap.set('n', '<C-p>', ':bprevious<CR>', opts)

-- window navigation
vim.keymap.set('n', '<C-h>', '<C-w>W', opts)
vim.keymap.set('n', '<C-l>', '<C-w>w', opts)

-- resize windows with ctrl-up, ctrl-down, ctrl-left, ctrl-right
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- move to the head and end of lines with ctrl-a and ctrl-e following linux keybindings
vim.keymap.set("n", "<C-a>", "0", opts)
vim.keymap.set("n", "<C-e>", "$", opts)
vim.keymap.set("i", "<C-a>", "<ESC>0i", opts)
vim.keymap.set("i", "<C-e>", "<ESC>$a", opts)

-- move lines up and down with ctrl-j and ctrl-k
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv", opts)
vim.keymap.set("x", "K", ":move '<-1<CR>gv-gv", opts)

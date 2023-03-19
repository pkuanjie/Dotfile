local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

-- quick quit and esc
vim.keymap.set('n', 'qq', ':x<CR>', opts)
vim.keymap.set('i', 'jj', '<ESC>', opts)

-- buffer navigation
vim.keymap.set('n', '<C-n>', ':bnext<CR>', opts)
vim.keymap.set('n', '<C-p>', ':bprevious<CR>', opts)

-- resize windows with ctrl-up, ctrl-down, ctrl-left, ctrl-right
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- move to the head and end of lines with ctrl-a and ctrl-e following linux keybindings
vim.keymap.set("n", "<C-a>", "^", opts)
vim.keymap.set("n", "<C-e>", "g_", opts)
vim.keymap.set("v", "<C-a>", "^", opts)
vim.keymap.set("v", "<C-e>", "g_", opts)
vim.keymap.set("i", "<C-a>", "<ESC>I", opts)
vim.keymap.set("i", "<C-e>", "<ESC>A", opts)

-- move lines up and down with ctrl-j and ctrl-k
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv", opts)
vim.keymap.set("x", "K", ":move '<-1<CR>gv-gv", opts)

-- add or minus numbers with <leader>a and <leader>x
vim.keymap.set("n", "<leader>a", "<C-a>", opts)
vim.keymap.set("n", "<leader>x", "<C-x>", opts)

-- split window navigation
vim.keymap.set("n", "<leader>sv", "<C-w>v", opts) -- vertical split
vim.keymap.set("n", "<leader>sh", "<C-w>s", opts) -- horizontal split
vim.keymap.set("n", "<leader>sc", "<C-w>c", opts) -- close window
vim.keymap.set("n", "<leader>so", "<C-w>o", opts) -- close other windows
vim.keymap.set("n", "<leader>se", "<C-w>=", opts) -- equalize window sizes
vim.keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", opts) -- maximize window

-- tab navigation
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", opts) -- new tab
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", opts) -- close tab
vim.keymap.set("n", "<leader>tn", ":tabnext<CR>", opts) -- next tab
vim.keymap.set("n", "<leader>tp", ":tabprevious<CR>", opts) -- previous tab

-- telescope git commands
vim.keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
vim.keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
vim.keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
vim.keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server
vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

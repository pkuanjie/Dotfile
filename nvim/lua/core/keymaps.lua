local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- quick quit and esc
vim.keymap.set("n", "<leader>q", ":x<CR>", opts)
vim.keymap.set("n", "<leader>w", ":w<CR>", opts)
vim.keymap.set({ "i", "v" }, "jk", "<ESC>", opts)

-- buffer navigation
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", opts)
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", opts)
vim.keymap.set("n", "<leader>bc", ":bdelete<CR>", opts)

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
vim.keymap.set("i", "<C-f>", "<ESC>la", opts)
vim.keymap.set("i", "<C-e>", "<ESC>A", opts)

-- move lines up and down with ctrl-j and ctrl-k
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv", opts)
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv", opts)

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

-- restart lsp server
vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

-- copy to system clipboard
vim.keymap.set("v", "<leader>y", '"+y') -- copy to system clipboard
vim.keymap.set("n", "<leader>y", '"+y') -- copy to system clipboard
vim.keymap.set("n", "<leader>Y", '"+yg_') -- copy to system clipboard

--paste from system clipboard
vim.keymap.set("n", "<leader>p", '"+p') -- paste from system clipboard
vim.keymap.set("v", "<leader>p", '"+p') -- paste from system clipboard
vim.keymap.set("n", "<leader>P", '"+P') -- paste from system clipboard
vim.keymap.set("v", "<leader>P", '"+P') -- paste from system clipboard

-- toggle undo tree
vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>:UndotreeFocus<CR>", opts)

-- multiple cursors
vim.g.multi_cursor_use_default_mapping = 0
vim.cmd("let g:VM_maps = {}")
vim.cmd("let g:VM_maps['Find Under'] = '<leader>n'")
vim.cmd("let g:VM_maps['Find Subword Under'] = '<leader>n'")

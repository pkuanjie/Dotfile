local telescope_setup, telescope = pcall(require, 'telescope')
if not telescope_setup then
    return
end

local actions_setup, actions = pcall(require, 'telescope.actions')
if not actions_setup then
    return
end

local builtin_setup, builtin = pcall(require, 'telescope.builtin')
if not builtin_setup then
    return
end

-- import telescope-ui-select safely
local themes_setup, themes = pcall(require, "telescope.themes")
if not themes_setup then
    return
end

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

telescope.setup {
    defaults = {
        mappings = {
            i = {
                ["C-q"] = actions.smart_send_to_qflist + actions.open_qflist,
            },
        },
    },
    extensions = {
        ["ui-select"] = {
            themes.get_dropdown({}),
        },
    },
}

telescope.load_extension("fzf")
telescope.load_extension("ui-select")

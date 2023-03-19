local setup, treesitter = pcall(require, 'nvim-treesitter.configs')
if not setup then
    return
end
treesitter.setup {
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = {
        "lua",
        "vim",
        "python",
        "yaml",
        "json",
        "yaml",
        "html",
        "css",
        "markdown",
        "bash",
        "dockerfile",
        "gitignore",
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    highlight = {
        enable = true,
    },

    indent = {
        enable = true,
    },
}

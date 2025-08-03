local setup, auto_pairs = pcall(require, 'nvim-autopairs')
if not setup then
    return
end

auto_pairs.setup()

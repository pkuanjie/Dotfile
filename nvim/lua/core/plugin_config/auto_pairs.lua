-- Plugin: nvim-autopairs

-- Setup
local ok, autopairs = pcall(require, "nvim-autopairs")
if not ok then
	return
end

autopairs.setup()

-- Integrate with nvim-cmp: auto-insert closing pair on confirm.
local cmp_ok, cmp = pcall(require, "cmp")
if cmp_ok then
	local cmp_autopairs = require("nvim-autopairs.completion.cmp")
	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end

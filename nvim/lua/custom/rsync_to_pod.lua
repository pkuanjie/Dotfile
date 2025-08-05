local M = {}

function M.RsyncToPod()
	local local_root = "/Users/jiean/Documents/repos/"
	local remote_root = "/scratch/xyz/Developer/project/"
	local pod_name = "xyz-nemo-workspace-hs9g-worker-0"
	local helper_script = "/Users/jiean/.local/bin/rsync-helper.sh"

	local full_path = vim.fn.expand("%:p") -- 当前编辑文件的绝对路径
	if not full_path:find(local_root, 1, true) then
		vim.notify("Current file is not under " .. local_root, vim.log.levels.WARN)
		return
	end

	-- 相对于 local_root 的路径
	local relative_path = full_path:sub(#local_root + 1)
	local remote_path = pod_name .. ":" .. remote_root .. relative_path

	local rsync_cmd = string.format("rsync -az -e '%s' '%s' '%s'", helper_script, full_path, remote_path)

	vim.notify("Rsyncing " .. relative_path .. " to pod...", vim.log.levels.INFO)

	vim.fn.jobstart(rsync_cmd, {
		stdout_buffered = true,
		on_stdout = function(_, data)
			if data and #data > 0 then
				vim.notify(table.concat(data, "\n"))
			end
		end,
		on_stderr = function(_, data)
			if data and #data > 0 then
				vim.notify("Rsync error:\n" .. table.concat(data, "\n"), vim.log.levels.ERROR)
			end
		end,
	})
end

-- define keymap <leader>w
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>w", M.RsyncToPod, opts)

return M

local M = {}

local rsync_pod_suffix = "4i6f"

function M.RsyncToPod()
	vim.cmd("write")

	local local_root = "/Users/jiean/Documents/repos/"
	local remote_root = "/code-fsx/jiean/repos"

	-- local pod_name = "jiean-nemo-workspace-2jds-worker-0"
	-- 只设置 workspace-xxxx 中的 xxxx 部分
	local suffix = rsync_pod_suffix or ""
	if suffix == "" then
		vim.notify("rsync_pod_suffix not set", vim.log.levels.ERROR)
		return
	end

	-- 自动补全完整 pod name
	local pod_name = "jiean-nemo-workspace-" .. suffix .. "-worker-0"

	local helper_script = "/Users/jiean/.local/bin/rsync-helper.sh"

	local full_path = vim.fn.expand("%:p") -- 当前编辑文件的绝对路径
	if not full_path:find(local_root, 1, true) then
		vim.notify("Current file is not under " .. local_root, vim.log.levels.WARN)
		return
	end

	-- 相对于 local_root 的路径
	local relative_path = full_path:sub(#local_root + 1)
	local remote_path = pod_name .. ":" .. remote_root .. relative_path

	-- local rsync_cmd = string.format("rsync -az -e '%s' '%s' '%s'", helper_script, full_path, remote_path)
	-- 从 local_root 同步整个项目目录
	local rsync_cmd =
		string.format("rsync -az --delete -e '%s' '%s' '%s'", helper_script, local_root, pod_name .. ":" .. remote_root)

	-- vim.notify("Rsyncing " .. relative_path .. " to pod...", vim.log.levels.INFO)

	vim.fn.jobstart(rsync_cmd, {
		stdout_buffered = true,
		on_stdout = function(_, data)
			if data and #data > 0 then
				-- vim.notify(table.concat(data, "\n"))
			end
		end,
		on_stderr = function(_, data)
			if data and #data > 0 then
				-- vim.notify("Rsync error:\n" .. table.concat(data, "\n"), vim.log.levels.ERROR)
			end
		end,
		on_exit = function()
			vim.notify("--- Rsync finished! ---")
		end,
	})
end

function M.RsyncToPodAndQuit()
	vim.cmd("write") -- 保存当前文件

	local local_root = "/Users/jiean/Documents/repos/"
	local remote_root = "/code-fsx/jiean/repos"

	-- local pod_name = "jiean-nemo-workspace-boej-worker-0"
	-- 只设置 workspace-xxxx 中的 xxxx 部分
	local suffix = rsync_pod_suffix or ""
	if suffix == "" then
		vim.notify("rsync_pod_suffix not set", vim.log.levels.ERROR)
		return
	end

	-- 自动补全完整 pod name
	local pod_name = "jiean-nemo-workspace-" .. suffix .. "-worker-0"

	local helper_script = "/Users/jiean/.local/bin/rsync-helper.sh"

	local full_path = vim.fn.expand("%:p")
	if not full_path:find(local_root, 1, true) then
		return
	end

	local relative_path = full_path:sub(#local_root + 1)
	local remote_path = pod_name .. ":" .. remote_root .. relative_path

	-- local rsync_cmd = string.format("rsync -az --delete -e '%s' '%s' '%s'", helper_script, full_path, remote_path)
	-- 从 local_root 同步整个项目目录
	local rsync_cmd =
		string.format("rsync -az --delete -e '%s' '%s' '%s'", helper_script, local_root, pod_name .. ":" .. remote_root)

	vim.fn.jobstart(rsync_cmd, {
		stdout_buffered = false,
		on_stdout = function() end,
		on_stderr = function() end,
		on_exit = function()
			-- 在 rsync 完成后退出当前窗口（相当于 :q）
			vim.schedule(function()
				vim.cmd("q")
			end)
		end,
	})
end

-- define keymap <leader>w
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>w", M.RsyncToPod, opts)
vim.keymap.set("n", "<leader>q", M.RsyncToPodAndQuit, opts)

return M

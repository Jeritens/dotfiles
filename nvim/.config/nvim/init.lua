require("config.vim-config")
require("config.lazy")

-- paths to check for project.godot file
-- local paths_to_check = {'/', '/../'}
-- local is_godot_project = false
-- local godot_project_path = ''
-- local cwd = vim.fn.getcwd()
--
-- -- iterate over paths and check
-- for key, value in pairs(paths_to_check) do
--     if vim.uv.fs_stat(cwd .. value .. 'project.godot') then
--         is_godot_project = true
--         godot_project_path = cwd .. value
--         break
--     end
-- end

-- check if server is already running in godot project path
--local is_server_running = vim.uv.fs_stat(godot_project_path .. '/server.pipe')
-- start server, if not already running
-- if is_godot_project and not is_server_running then
--     vim.fn.serverstart(godot_project_path .. '/server.pipe')
-- end
-- if is_godot_project then
--     local pipe_path = godot_project_path .. 'server.pipe'
--     if vim.uv.fs_stat(pipe_path) then
--         os.remove(pipe_path)
--     end
--     vim.fn.serverstart(pipe_path)
-- end

local function setup_godot_server()
    local root = vim.fs.root(0, { "project.godot" })
    if root then
        local pipe_path = root .. "/server.pipe"
        if not vim.v.servername:find("server.pipe") then
            if vim.uv.fs_stat(pipe_path) then
                os.remove(pipe_path)
            end
            vim.fn.serverstart(pipe_path)
        end
    end
end

vim.api.nvim_create_autocmd({ "VimEnter", "DirChanged" }, {
    callback = setup_godot_server,
})

require("config.vim-config")
require("config.lazy")


local function setup_godot_server()
    local pipe_path = "/tmp/godot.pipe"
    if not vim.v.servername:find("godot.pipe") then
        if vim.uv.fs_stat(pipe_path) then
            os.remove(pipe_path)
        end
        vim.fn.serverstart(pipe_path)
    end
end

vim.api.nvim_create_autocmd({ "VimEnter" }, {
    callback = setup_godot_server,
})

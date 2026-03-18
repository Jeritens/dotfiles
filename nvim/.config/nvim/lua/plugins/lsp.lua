return {
    {
        "neovim/nvim-lspconfig",
        dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim", "mfussenegger/nvim-jdtls", },
        config = function()
            require("mason").setup()
            local lspconfig = require("lspconfig")
            require("mason-lspconfig").setup({
                ensure_installed = { "vtsls", "angularls", "lua_ls" },
                handlers = {
                    function(server_name)
                        lspconfig[server_name].setup({})
                    end,
                    ["vtsls"] = function()
                        lspconfig.vtsls.setup({
                            settings = { typescript = { inlayHints = { parameterNames = { enabled = "all" } } } }
                        })
                    end,
                },
            })
            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(ev)
                    local opts = { buffer = ev.buf }
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                    vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, opts)
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                    vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, opts)
                    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
                    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
                    vim.keymap.set('n', '<leader>cf', function()
                        vim.lsp.buf.format { async = true }
                    end, opts)
                    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
                    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
                    vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)
                end,
            })
        end,
    },
}

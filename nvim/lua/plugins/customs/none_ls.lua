local api = vim.api
local null_ls = require("null-ls")

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.black,
        -- không thêm diagnostic sources
    },
    on_attach = function(client, bufnr)
        -- Tắt diagnostic của null-ls để tránh chồng chéo
        client.handlers["textDocument/publishDiagnostics"] = function() end

        if client.supports_method("textDocument/formatting") then
            api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end,
})

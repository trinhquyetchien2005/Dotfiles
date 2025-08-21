local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.prettierd.with({
            extra_args = { "--config", vim.fn.expand("~/.config/prettier/config.json") },
        }),
        null_ls.builtins.formatting.black,
    },
    on_attach = function(client, bufnr)
        if client.name ~= "null-ls" then
            client.server_capabilities.documentFormattingProvider = false
        end
    end,
})

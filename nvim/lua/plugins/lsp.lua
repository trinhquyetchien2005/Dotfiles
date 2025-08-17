local lspconfig = require("lspconfig")

local on_attach = function(client, bufnr)
end

local servers = {
    "lua_ls",
    "clangd",
    "jdtls",
    "pyright",
    "jsonls",
    "marksman",
    "html",
    "cssls",
    "tailwindcss",
    "kotlin_language_server",
    "ts_ls",
    "dartls",
}
for _, server in ipairs(servers) do
    local opts = { on_attach = on_attach }

    if server == "html" then
        opts.filetypes = { "html" }
        opts.init_options = {
            configurationSection = { "html", "css", "javascript" },
            embeddedLanguages = {
                css = true,
                javascript = true,
            },
        }
    elseif server == "dartls" then
        opts.cmd = { "dart", "language-server", "--protocol=lsp" }
        opts.filetypes = { "dart" }
        opts.init_options = {
            closingLabels = true,
            outline = true,
            flutterOutline = true,
        }
        opts.settings = {
            dart = {
                completeFunctionCalls = true,
                showTodos = true,
            }
        }
    end
    lspconfig[server].setup(opts)
end

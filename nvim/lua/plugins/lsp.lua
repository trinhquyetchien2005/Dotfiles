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
}


for _, server in ipairs(servers) do
  lspconfig[server].setup {
    on_attach = on_attach,
  }
end

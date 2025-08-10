require("mason").setup()

require("mason-lspconfig").setup {
ensure_installed = {
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
},

  automatic_installation = true,
}

local cmp_nvim_lsp = require("cmp_nvim_lsp")

-- Nâng cấp capabilities cho LSP để cmp hoạt động tốt
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Hàm on_attach không map key nữa, chỉ giữ để làm những việc khác sau này
local on_attach = function(client, bufnr)
  -- Có thể thêm logic khác nếu cần
end

-- Mason setup
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "tsserver",
    "pyright",
    "clangd",
    "kotlin_language_server",
  },
})

local lspconfig = require("lspconfig")

local servers = {
  "lua_ls",
  "tsserver",
  "pyright",
  "clangd",
  "kotlin_language_server",
}

for _, server in ipairs(servers) do
  lspconfig[server].setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })
end


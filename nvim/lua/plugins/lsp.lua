local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local on_attach = function(client, bufnr)
  -- Tùy chỉnh nếu cần
end

require("mason").setup()

local servers = {
  "lua_ls",
  "ts_ls",           -- dùng tên mới
  "pyright",
  "clangd",
  "kotlin_language_server",
}

mason_lspconfig.setup({
  ensure_installed = servers,
})

for _, server in ipairs(servers) do
  local lsp = lspconfig[server]
  if lsp then
    lsp.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
  else
    vim.notify("Server " .. server .. " không tồn tại trong lspconfig", vim.log.levels.ERROR)
  end
end


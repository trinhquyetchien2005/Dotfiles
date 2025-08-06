local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local on_attach = function(client, bufnr)
  print("LSP started: " .. client.name)
end

require("mason").setup()

local servers = {
  "lua_ls",
  "ts_ls",
  "pyright",
  "clangd",
  "kotlin_language_server",
  "jsonls",
  "html",
  "cssls",
  "emmet_ls",
  "tailwindcss", 
  "angularls",
}

mason_lspconfig.setup({
  ensure_installed = servers,
})

for _, server in ipairs(servers) do
  local lsp = lspconfig[server]
  if lsp then
    local opts = {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    -- Thêm config riêng cho kotlin
    if server == "kotlin_language_server" then
      opts.settings = {
        kotlin = {
          -- Đây là config mặc định, có thể thay đổi theo nhu cầu
          compiler = {
            jvm = {
              target = "1.8"
            }
          }
        }
      }
    end

    lsp.setup(opts)
  else
    vim.notify("Server " .. server .. " không tồn tại trong lspconfig", vim.log.levels.ERROR)
  end
end


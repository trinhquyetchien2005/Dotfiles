local cmp_nvim_lsp = require("cmp_nvim_lsp")

-- Nâng cấp capabilities cho LSP để cmp hoạt động tốt
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Hàm on_attach để map key khi LSP attach buffer
local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  local keymap = vim.api.nvim_buf_set_keymap
  keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "tsserver", "pyright" },
})

local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

lspconfig.tsserver.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

lspconfig.pyright.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}


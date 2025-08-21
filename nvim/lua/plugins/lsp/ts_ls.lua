-- ~/.config/nvim/lua/lsp/ts_ls.lua
local lspconfig = require("lspconfig")
local util = require("lspconfig.util")

lspconfig.ts_ls.setup({
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "typescript.tsx" },
    single_file_support = true,
    root_dir = function(fname)
        local root = util.root_pattern("tsconfig.json", "jsconfig.json", "package.json", ".git")(fname)
        if type(root) == "table" then
            return root[1] -- lấy path đầu tiên nếu lỡ trả về table
        end
        return root
    end,
    init_options = { hostInfo = "neovim" },
})

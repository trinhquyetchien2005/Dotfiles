local lspconfig = require("lspconfig")
local util = require("lspconfig.util")

local root_pattern_fn = util.root_pattern('tsconfig.json', 'jsconfig.json', 'package.json', '.git')

local safe_root_dir = function(fname)
    local ok, root = pcall(root_pattern_fn, fname)
    if not ok then
        root = nil
    end

    -- Nếu root là table, lấy phần tử đầu
    if type(root) == "table" then
        root = root[1]
    elseif root == nil then
        root = vim.loop.cwd()
    end

    -- Double check: đảm bảo luôn là string
    if type(root) ~= "string" then
        root = vim.loop.cwd()
    end

    return root
end

lspconfig.ts_ls.setup{
    cmd = { 'typescript-language-server', '--stdio' },
    filetypes = { 'javascript','javascriptreact','javascript.jsx',
                  'typescript','typescriptreact','typescript.tsx' },
    root_dir = safe_root_dir,
    single_file_support = true,
}

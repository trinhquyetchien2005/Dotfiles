local api = vim.api

--auto save
api.nvim_create_autocmd("InsertLeave", {
    callback = function()
        if vim.bo.modifiable and vim.bo.filetype ~= "gitcommit" then
            pcall(function()
                vim.lsp.buf.format({ async = false })
            end)
            vim.cmd("silent! write")
        end
    end
})

--auto terminal
vim.api.nvim_create_autocmd('TermOpen', {
    pattern = 'term://*',
    callback = function()
        vim.api.nvim_buf_set_keymap(0, 't', '<Esc>', [[<C-\><C-n>]], { noremap = true })
        vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-w>h]], { noremap = true })
        vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-w>j]], { noremap = true })
        vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-w>k]], { noremap = true })
        vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-w>l]], { noremap = true })
    end,
})

--auto lsp lualine
vim.api.nvim_create_autocmd({ "LspAttach", "LspDetach" }, {
    callback = function()
        vim.cmd("redrawstatus")
    end
})

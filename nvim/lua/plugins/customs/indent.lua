-- Tạo bảng highlight cho 10 cấp indent với màu nền khác nhau
local highlight = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
    "IndentBlanklineIndent3",
    "IndentBlanklineIndent4",
    "IndentBlanklineIndent5",
    "IndentBlanklineIndent6",
    "IndentBlanklineIndent7",
    "IndentBlanklineIndent8",
    "IndentBlanklineIndent9",
    "IndentBlanklineIndent10",
}

-- Định nghĩa màu nền cho từng group highlight (màu bạn có thể chỉnh theo ý)
vim.api.nvim_set_hl(0, "IndentBlanklineIndent1", { bg = "#1e222a" })
vim.api.nvim_set_hl(0, "IndentBlanklineIndent2", { bg = "#282c34" })
vim.api.nvim_set_hl(0, "IndentBlanklineIndent3", { bg = "#313644" })
vim.api.nvim_set_hl(0, "IndentBlanklineIndent4", { bg = "#3b4150" })
vim.api.nvim_set_hl(0, "IndentBlanklineIndent5", { bg = "#454b5c" })
vim.api.nvim_set_hl(0, "IndentBlanklineIndent6", { bg = "#4f5568" })
vim.api.nvim_set_hl(0, "IndentBlanklineIndent7", { bg = "#595f74" })
vim.api.nvim_set_hl(0, "IndentBlanklineIndent8", { bg = "#636981" })
vim.api.nvim_set_hl(0, "IndentBlanklineIndent9", { bg = "#6d738d" })
vim.api.nvim_set_hl(0, "IndentBlanklineIndent10", { bg = "#777c99" })

-- Setup indent-blankline
require("ibl").setup {
    indent = {
        highlight = highlight, -- dùng mảng highlight màu nền cho indent
        char = "",         -- không hiển thị gạch đứng
    },
    whitespace = {
        highlight = highlight, -- màu giống indent cho khoảng trắng cuối dòng
        remove_blankline_trail = false,
    },
    scope = {
        enabled = false, -- tắt phần scope highlight (nếu muốn bật thì sửa thành true)
    },
}

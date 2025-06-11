-- Lazy init
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim", lazypath
    })
end

vim.opt.rtp:prepend(lazypath)
vim.diagnostic.config({
    virtual_text = true,              -- tắt lỗi hiện bên cạnh dòng
    signs = true,                     -- vẫn giữ dấu hiệu lỗi bên lề trái
    underline = true,
    update_in_insert = true,         -- đỡ giật khi đang gõ
})

require("lazy").setup({
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("catppuccin")
        end,
    },

    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup({})
        end,
    },

    {
        'mfussenegger/nvim-jdtls',
        ft = { 'java' },
        dependencies = {
            'neovim/nvim-lspconfig',
            'mfussenegger/nvim-dap', -- debug support nếu cần
        },
    },
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("nvim-tree").setup({})
        end,
    },

    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
        config = function()
            require("nvim-web-devicons").setup({ default = true })
        end,
    },

    -- LSP
    {
        "neovim/nvim-lspconfig",
    },
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup()
        end,
    },

    -- Autocomplete
    {
        "hrsh7th/nvim-cmp",
        dependencies = { "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip" },
        config = function()
            require("plugins.cmp")
        end,
    },
    { "hrsh7th/cmp-nvim-lsp" },
    { "L3MON4D3/LuaSnip" },

    -- Buffer linedefined
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = {
            "nvim-tree/nvim-web-devicons", -- icon cho bufferline
        },
        config = function()
            require("bufferline").setup({
                options = {
                    mode = "buffers",      -- hiển thị theo buffer chứ không phải tabs
                    diagnostics = "nvim_lsp", -- hiển thị lỗi/warning từ LSP
                    show_buffer_close_icons = true, -- ẩn icon đóng từng buffer
                    show_close_icon = false, -- ẩn icon đóng toàn bộ bufferline
                    separator_style = "thin", -- kiểu đường kẻ phân cách buffer
                    always_show_bufferline = false, -- luôn hiển thị bufferline, không ẩn khi chỉ 1 buffer
                    diagnostics_update_in_insert = false, -- không cập nhật diagnostics khi đang insert (giúp giảm giật lag)
                },
            })
        end,
    },

    -- Treesitter
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    -- UI
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup({
                options = {
                    theme = "tokyonight",
                    icons_enabled = true,
                },
            })
        end,
    },

    -- Git
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end,
    },
    { "tpope/vim-fugitive" },

    -- Terminal
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            require("toggleterm").setup()
        end,
    },

    -- Comment
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    },
    {
        "folke/tokyonight.nvim",
        lazy = false, -- load ngay khi nvim khởi động
        priority = 1000,
        config = function()
            require("tokyonight").setup({
                transparent = true,  -- nếu muốn nền trong suốt
            })
            vim.cmd.colorscheme("tokyonight") -- bật theme tokyo night
        end,
    },
})
require("plugins.lsp")

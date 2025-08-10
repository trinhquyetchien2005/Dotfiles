local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        lazyrepo,
        lazypath,
    })

    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        --lualine
        {
            'nvim-lualine/lualine.nvim',
            dependencies = { 'nvim-tree/nvim-web-devicons' },
            config = function()
                require("plugins.customs.lualine")
            end,
        },
        --error-lens
        {
            "chikko80/error-lens.nvim",
            event = "BufRead",
            dependencies = { "nvim-telescope/telescope.nvim" },
            config = function()
                require("plugins.customs.error")
            end,
        },
        --neotree
        {
            "nvim-neo-tree/neo-tree.nvim",
            branch = "v3.x",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "nvim-tree/nvim-web-devicons",
                "MunifTanjim/nui.nvim",
            },
            config = function()
                require("plugins.customs.neotree")
            end,
        },

        --themes
        {
            "folke/tokyonight.nvim",
            priority = 1000,
            config = function()
                vim.cmd.colorscheme("tokyonight-moon")
            end,
        },

        --transparent
        {
            'tribela/transparent.nvim',
            event = 'VimEnter',
            config = true,
        },

        --animate
        {
            "echasnovski/mini.animate",
            config = function()
                require("mini.animate").setup(require("plugins.customs.animation"))
            end,
        },

        --telescope
        {
            "nvim-telescope/telescope.nvim",
            branch = "0.1.x",
            dependencies = { "nvim-lua/plenary.nvim" },
            config = function()
                require("plugins.customs.telescope")
            end
        },

        --treesitter
        {
            "nvim-treesitter/nvim-treesitter",
            run = "TSUpdate",
            config = function()
                require("plugins.customs.treesitter")
            end,
        },

        --indent
        {
            "lukas-reineke/indent-blankline.nvim",
            main = "ibl",
            ---@module "ibl"
            ---@type ibl.config
            opts = {},
            config = function()
                require("plugins.customs.indent")
            end,
        },

        --cmp
        {
            "hrsh7th/nvim-cmp",
            event = "InsertEnter",
            dependencies = {
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                "saadparwaiz1/cmp_luasnip",
                "L3MON4D3/LuaSnip",
                "rafamadriz/friendly-snippets",
            },
            config = function()
                require("plugins.customs.cmp")
            end,
        },

        --bufferline
        {
            'akinsho/bufferline.nvim',
            version = "*",
            dependencies = 'nvim-tree/nvim-web-devicons',
            config = function()
                require("plugins.customs.bufferline")
            end,
        },

        --dashboard
        {
            "goolord/alpha-nvim",
            config = function()
                require("plugins.customs.alpha") -- file config bạn tự tạo
            end,
        },

        --auto pairs
        {
            "windwp/nvim-autopairs",
            event = "InsertEnter",
            config = function()
                require("nvim-autopairs").setup {}
            end,
        },

        --lsp and masion
        {
            "williamboman/mason.nvim",
            config = function()
                require("plugins.mason")
            end,
        },
        {
            "williamboman/mason-lspconfig.nvim",
            dependencies = { "mason.nvim" },
        },
        {
            "neovim/nvim-lspconfig",
            config = function()
                require("plugins.lsp")
            end,
        }

    },

    defaults = {
        lazy = false,
        version = false,
    },

    install = {
        colorscheme = { "tokyonight", "habamax" },
    },

    checker = {
        enabled = true,
        notify = false,
    },

    performance = {
        rtp = {
            disabled_plugins = {
                "gzip",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})

local catppuccin = require("catppuccin")

catppuccin.setup({
    flavour = "mocha", -- hoặc latte, frappe, macchiato
    transparent_background = true,
    term_colors = false,
    styles = {
        comments = { "italic" },
        functions = { "italic" },
        keywords = { "italic" },
        strings = {},
        variables = {},
    },
    show_end_of_buffer = false,

    integrations = {
        treesitter = true,
        lualine = false,
        native_lsp = {
            enabled = true,
            virtual_text = {
                errors = { "italic" },
                hints = { "italic" },
                warnings = { "italic" },
                information = { "italic" },
            },
            underlines = {
                errors = { "underline" },
                hints = { "underline" },
                warnings = { "underline" },
                information = { "underline" },
            },
        },
        gitsigns = true,
        telescope = true,
        nvimtree = { enabled = true, show_root = true },
        which_key = true,
        indent_blankline = { enabled = true, colored_indent_levels = true },
        dashboard = true,
        bufferline = true,
        ts_rainbow = true,
    },
    custom_highlights = function(colors)
        return {
            -- Số dòng tương đối
            LineNr = { fg = colors.subtext1 },

            -- Số dòng hiện tại (nổi bật hơn)
            CursorLineNr = { fg = colors.green, style = { "bold" } },

            -- Nền dòng hiện tại
            CursorLine = { bg = colors.surface0 },
        }
    end,
})
vim.cmd.colorscheme "catppuccin"

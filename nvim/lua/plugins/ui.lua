-- ~/.config/nvim/lua/core/ui.lua

-- Enable true colors
vim.o.termguicolors = true

-- Set theme
vim.cmd("colorscheme catppuccin")

-- Lualine (statusline)
require("lualine").setup({
    options = {
        theme = "catppuccin",
        section_separators = { left = "", right = "" },
        component_separators = { left = "│", right = "│" },
        globalstatus = true,
    }
})

-- Bufferline (tab đầu)
require("bufferline").setup({
    options = {
        mode = "buffers",
        diagnostics = "nvim_lsp",
        separator_style = "slant",
        show_buffer_close_icons = false,
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                text_align = "left"
            }
        }
    }
})

-- Icons
require("nvim-web-devicons").setup({ default = true })

-- Indent-blankline (đường thụt lề)
require("ibl").setup({
    indent = { char = "│" },
    scope = { enabled = true },
})

-- Notify UI
require("notify").setup({
    background_colour = "#1e1e2e",
    timeout = 3000,
    render = "compact",
})
vim.notify = require("notify") -- override mặc định

-- Dressing (popup UI)
require("dressing").setup({})

-- Noice (hiện cmdline đẹp + LSP UI)
require("noice").setup({
    presets = {
        bottom_search = true, -- cmdline tìm kiếm ở dưới
        command_palette = true, -- cmdline dạng palette
        long_message_to_split = true,
    },
})

-- Optional: Transparent background nếu bạn dùng terminal trong suốt
vim.cmd([[
  highlight Normal guibg=NONE ctermbg=NONE
  highlight NormalNC guibg=NONE ctermbg=NONE
  highlight EndOfBuffer guibg=NONE ctermbg=NONE
]])

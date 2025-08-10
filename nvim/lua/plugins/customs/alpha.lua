local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
  
" ██████╗██╗  ██╗██╗███████╗███╗   ██╗",
"██╔════╝██║  ██║██║██╔════╝████╗  ██║",
"██║     ███████║██║█████╗  ██╔██╗ ██║",
"██║     ██╔══██║██║██╔══╝  ██║╚██╗██║",
"╚██████╗██║  ██║██║███████╗██║ ╚████║",
" ╚═════╝╚═╝  ╚═╝╚═╝╚══════╝╚═╝  ╚═══╝",
}

-- Các lựa chọn menu
dashboard.section.buttons.val = {
  dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
  dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
  dashboard.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("p", "  Open project", ":Telescope projects<CR>"),
  dashboard.button("l", "  Lazy", ":Lazy<CR>"),
  dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

dashboard.section.footer.val = ""

alpha.setup(dashboard.config)

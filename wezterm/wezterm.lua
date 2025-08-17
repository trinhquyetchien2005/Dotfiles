local wezterm = require 'wezterm'
local config = {}

config.font = wezterm.font_with_fallback({
    { family = "JetBrains Mono", weight = "Medium" },
    { family = "Fira Code" },
})
config.font_size = 13.0
config.line_height = 1.2

config.color_scheme = "Catppuccin Mocha"

config.window_padding = { left = 2, right = 2, top = 0, bottom = 0 }
config.window_background_opacity = 0.7
config.macos_window_background_blur = 20
config.win32_system_backdrop = "Acrylic"

config.enable_tab_bar = false

config.warn_about_missing_glyphs = false

config.keys = {
    { key = "Enter", mods = "CTRL|SHIFT", action = "ToggleFullScreen" },
    { key = "C",     mods = "CTRL|SHIFT", action = wezterm.action.CopyTo("Clipboard") },
    { key = "V",     mods = "CTRL|SHIFT", action = wezterm.action.PasteFrom("Clipboard") },
}

--wezterm.on("gui-startup", function(cmd)
--    local mux = wezterm.mux
--    local tab, pane, window = mux.spawn_window(cmd or {})
--    pane:send_text("tmux attach || tmux\n")
--end)

config.default_prog = { "/bin/zsh", "-l" }

return config

local wezterm = require("wezterm")
local config = wezterm.config_builder()
local io = require("io")
local os = require("os")

local brightness = 0.03

-- Thư mục background
local home = os.getenv("HOME")
local background_folder = home .. "/bg"

-- Hàm chọn random ảnh background
local function pick_random_background(folder)
    local handle = io.popen('ls "' .. folder .. '" 2>/dev/null')
    if handle then
        local files = handle:read("*a")
        handle:close()

        local images = {}
        for file in string.gmatch(files, "[^\n]+") do
            table.insert(images, file)
        end

        if #images > 0 then
            return folder .. "/" .. images[math.random(#images)]
        else
            return nil
        end
    end
end

-- Mặc định background
local bg_image = home .. "/Dotfiles/wezterm/bg.jpg"
config.window_background_image = bg_image

config.window_background_image_hsb = {
    brightness = brightness,
    hue = 1.0,
    saturation = 0.8,
}

-- Cửa sổ
config.window_background_opacity = 0.90
config.window_padding = { left=0, right=0, top=0, bottom=0 }
config.color_scheme = "Tokyo Night"
config.font = wezterm.font("Inconsolata Nerd Font Mono", { weight = "Medium", stretch = "Expanded" })
config.font_size = 16



-- Bỏ tab bar vì dùng tmux
config.enable_tab_bar = false

-- Window decorations chỉ resize, không có nút đóng thu nhỏ
config.window_decorations = "RESIZE"

config.window_frame = {
    border_left_width = "0.28cell",
    border_right_width = "0.28cell",
    border_bottom_height = "0.15cell",
    border_top_height = "0.15cell",
    border_left_color = "pink",
    border_right_color = "pink",
    border_bottom_color = "pink",
    border_top_color = "pink",
}

-- Keybindings giữ lại chỉnh background và mở link chuột
config.keys = {
    {
        key = "b",
        mods = "CTRL|SHIFT",
        action = wezterm.action_callback(function(window)
            bg_image = pick_random_background(background_folder)
            if bg_image then
                window:set_config_overrides({
                    window_background_image = bg_image,
                })
                wezterm.log_info("New bg: " .. bg_image)
            else
                wezterm.log_error("Could not find bg image")
            end
        end),
    },
	{
	  key = "f",
 	 mods = "CTRL|SHIFT",
	  action = wezterm.action.ToggleFullScreen,
	},
    {
        key = "L",
        mods = "CTRL|SHIFT",
        action = wezterm.action.OpenLinkAtMouseCursor,
    },
    {
        key = ">",
        mods = "CTRL|SHIFT",
        action = wezterm.action_callback(function(window)
            brightness = math.min(brightness + 0.01, 1.0)
            window:set_config_overrides({
                window_background_image_hsb = {
                    brightness = brightness,
                    hue = 1.0,
                    saturation = 0.8,
                },
                window_background_image = bg_image,
            })
        end),
    },
    {
        key = "<",
        mods = "CTRL|SHIFT",
        action = wezterm.action_callback(function(window)
            brightness = math.max(brightness - 0.01, 0.01)
            window:set_config_overrides({
                window_background_image_hsb = {
                    brightness = brightness,
                    hue = 1.0,
                    saturation = 0.8,
                },
                window_background_image = bg_image,
            })
        end),
    },
}

-- Các tùy chỉnh khác
config.default_cursor_style = "BlinkingUnderline"
config.cursor_thickness = 2
config.max_fps = 120

return config


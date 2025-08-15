require("neo-tree").setup({
    close_if_last_window = true,
    popup_border_style = "rounded",
    enable_git_status = true,
    enable_diagnostics = false,
    visible = true,
    never_show = {},

    default_component_configs = {
        indent = { padding = 1 },

        -- Icons cho folder/file
        icon = {
            folder_closed = "",
            folder_open   = "",
            folder_empty  = "",
            default       = "",
            symlink       = "",
        },

        -- Git status icons
        git_status = {
            symbols = {
                added     = "",
                modified  = "",
                deleted   = "",
                renamed   = "➜",
                untracked = "★",
                ignored   = "◌",
                unstaged  = "",
                staged    = "",
                unmerged  = "",
                conflict  = "⚡",
            }
        },
    },

    window = {
        position = "left",
        width = 40,
        use_default_keybindings = false,
        mappings = {
            ["h"] = "close_node",
            ["l"] = "open",
            ["a"] = "add",
            ["d"] = "delete",
            ["r"] = "rename",
            ["q"] = "close_window",
        },
    },

    filesystem = {
        filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = true,
        },
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
    },
})

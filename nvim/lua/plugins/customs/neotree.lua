local function open_or_toggle(state)
    local node = state.tree:get_node()
    if node.type == "file" then
        return "open"
    else
        return "toggle_node"
    end
end


require("neo-tree").setup({
    close_if_last_window = true,
    popup_border_style = "rounded",
    enable_git_status = true,
    enable_diagnostics = true,
    default_component_configs = {
        indent = {
            padding = 1,
        },
        icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "",
            default = "",
            symlink = "",
            git_untracked = "★",
            git_modified = "✹",
            git_staged = "✓",
            git_renamed = "➜",
            git_unmerged = "═",
            git_conflict = "",
            git_deleted = "",
        },
        git_status = {
            symbols = {
                added     = "✚",
                modified  = "",
                deleted   = "✖",
                renamed   = "➜",
                untracked = "★",
                ignored   = "◌",
                unstaged  = "✗",
                staged    = "✔",
                conflict  = "",
            },
        },
    },
    window = {
        position = "left",
        width = 30,
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
        follow_current_file = {
            enabled = true,
        },
        use_libuv_file_watcher = true,
    },
})

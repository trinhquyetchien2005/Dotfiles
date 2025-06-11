require("plugins.init")

require("core.options")

require("core.mappings")

require("core.colorscheme")

vim.api.nvim_create_user_command("ShowKeymaps", function()
  local modes = {
    n = "Normal",
    i = "Insert",
    v = "Visual",
    x = "Visual Block",
    t = "Terminal",
    c = "Command",
  }

  for mode, name in pairs(modes) do
    print("----- " .. name .. " Mode -----")
    local keymaps = vim.api.nvim_get_keymap(mode)
    for _, map in ipairs(keymaps) do
      print(string.format(" %s → %s [%s]", map.lhs, map.rhs, map.desc or ""))
    end
  end
end, {})



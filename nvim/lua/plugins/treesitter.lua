-- lua/plugins/treesitter.lua
require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "lua", "vim", "bash", "python", "html", "css", "javascript", "typescript", "java", "json"
  },
  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  indent = {
    enable = true,
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      node_incremental = "<CR>",
      scope_incremental = "<TAB>",
      node_decremental = "<BS>",
    },
  },
})


local telescope = require("telescope")
telescope.setup({
  defaults = {nano
    file_ignore_patterns = { ".git/", "node_modules/" },
  },
})

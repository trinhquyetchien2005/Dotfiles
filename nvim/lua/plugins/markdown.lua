return {
  -- Vim-Markdown + TOC + bảng
  {
    "preservim/vim-markdown",
    ft = { "markdown" },
    dependencies = { "godlygeek/tabular" },
    config = function()
      vim.g.vim_markdown_folding_disabled = 1
      vim.g.vim_markdown_conceal = 2
      vim.g.vim_markdown_math = 1
      vim.g.vim_markdown_toc_autofit = 1
    end,
  },

  -- Markdown Preview
  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    build = "cd app && npm install",
    config = function()
      vim.g.mkdp_auto_start = 0
      vim.g.mkdp_auto_close = 1
      vim.g.mkdp_browser = ""
    end,
  },

  -- Prettier format Markdown
  {
    "MunifTanjim/prettier.nvim",
    cmd = { "Prettier" },
    config = function()
      require("prettier").setup({
        bin = "prettier",
        filetypes = { "markdown", "json", "yaml", "html", "css", "javascript", "typescript" },
      })
    end,
  },
}


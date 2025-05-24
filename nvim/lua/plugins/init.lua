-- Lazy init
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
{
  "catppuccin/nvim",
  name = "catppuccin",
  config = function()
    vim.cmd.colorscheme("catppuccin")
  end,
},

{
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("nvim-tree").setup {}
  end
},
  -- LSP
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("lspconfig").lua_ls.setup({})
    end,
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup()
    end,
  },
  -- Autocomplete
  -- Autocomplete plugins trong lazy.nvim config
{
  "hrsh7th/nvim-cmp",
  dependencies = { "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip" },
  config = function()
    require("plugins.cmp")
  end,
},

  { "hrsh7th/cmp-nvim-lsp" },
  { "L3MON4D3/LuaSnip" },

  -- Treesitter
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- Telescope
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

  -- UI
{
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "catppuccin", -- hoặc "auto"
          icons_enabled = true,
        },
      })
    end,
  },

  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({})
    end,
  },

  -- Icons cho file (dùng chung với cả lualine, nvim-tree)
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
    config = function()
      require("nvim-web-devicons").setup({ default = true })
    end,
  },

  -- Git
  { "lewis6991/gitsigns.nvim" },
  { "tpope/vim-fugitive" },

  -- Terminal
  { "akinsho/toggleterm.nvim" },

  -- Comment
  { "numToStr/Comment.nvim" },

  -- Colorscheme
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
})

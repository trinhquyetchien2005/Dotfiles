local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = ' '
keymap('n', '<Space>', '', {})  -- disable mặc định space

-- Window
keymap('n', '<Leader>sv', '<C-w>v', opts)
keymap('n', '<Leader>sh', '<C-w>s', opts)
keymap('n', '<Leader>se', '<C-w>=', opts)
keymap('n', '<Leader>sx', ':close<CR>', opts)

-- Buffer
keymap('n', '<Leader>bn', ':bnext<CR>', opts)
keymap('n', '<Leader>bp', ':bprevious<CR>', opts)
keymap('n', '<Leader>bd', ':bdelete<CR>', opts)

-- Telescope (fuzzy finder)
keymap('n', '<Leader>ff', '<cmd>Telescope find_files<cr>', opts)
keymap('n', '<Leader>fg', '<cmd>Telescope live_grep<cr>', opts)
keymap('n', '<Leader>fb', '<cmd>Telescope buffers<cr>', opts)
keymap('n', '<Leader>fh', '<cmd>Telescope help_tags<cr>', opts)

-- Nvim-tree (file explorer)
keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', opts)

-- LSP
keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
keymap('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
keymap('n', '<Leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
keymap('n', '<Leader>f', '<cmd>lua vim.lsp.buf.format()<CR>', opts)

-- Treesitter
keymap('n', '<Leader>ts', ':TSHighlightCapturesUnderCursor<CR>', opts)
-- Bạn có thể thêm incremental selection nếu config treesitter enable
-- keymap('v', '<Leader>ti', ':TSIncrementalSelection<CR>', opts)
-- keymap('v', '<Leader>tr', ':TSNodeRemoveSelection<CR>', opts)

-- Git (gitsigns & fugitive)
keymap('n', '<Leader>gs', ':Gitsigns toggle_signs<CR>', opts)
keymap('n', '<Leader>gd', ':Gitsigns diffthis<CR>', opts)
keymap('n', '<Leader>gb', ':Gitsigns blame_line<CR>', opts)
keymap('n', '<Leader>gc', ':Gitsigns toggle_current_line_blame<CR>', opts)
keymap('n', '<Leader>gf', ':Git fetch<CR>', opts)  -- vim-fugitive

-- Completion (nvim-cmp) không cần keymap mặc định, nhưng bạn có thể thêm:
-- (tùy setup, ví dụ trong insert mode)
-- keymap('i', '<C-Space>', 'compe#complete()', {expr = true, noremap = true})

-- Comment.nvim
keymap('n', '<Leader>/', '<cmd>CommentToggle<CR>', opts)
keymap('v', '<Leader>/', '<esc><cmd>CommentToggle<CR>', opts)

-- Terminal (toggleterm)
keymap('n', '<Leader>tt', ':ToggleTerm<CR>', opts)
keymap('t', '<Esc>', [[<C-\><C-n>]], opts) -- thoát terminal mode về normal mode

-- Lualine (statusline) thường ko cần keymap đặc biệt, config tự chạy 

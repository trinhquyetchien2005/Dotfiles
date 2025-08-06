local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = ' '
keymap('n', '<Space>', '', {}) -- disable mặc định space

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

--markdown
keymap("n", "<leader>mp", ":MarkdownPreview<CR>", { desc = "Preview Markdown" })
keymap("n", "<leader>mf", ":Prettier<CR>", { desc = "Format Markdown" })
-- LSP
keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
keymap('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
keymap('n', '<Leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
keymap('n', '<Leader>f', '<cmd>lua vim.lsp.buf.format()<CR>', opts)

-- Treesitter
keymap('n', '<Leader>ts', ':TSHighlightCapturesUnderCursor<CR>', opts)
-- Git (gitsigns & fugitive)
keymap('n', '<Leader>gs', ':Gitsigns toggle_signs<CR>', opts)
keymap('n', '<Leader>gd', ':Gitsigns diffthis<CR>', opts)
keymap('n', '<Leader>gb', ':Gitsigns blame_line<CR>', opts)
keymap('n', '<Leader>gc', ':Gitsigns toggle_current_line_blame<CR>', opts)
keymap('n', '<Leader>gf', ':Git fetch<CR>', opts) -- vim-fugitive

-- Resize cửa sổ bằng Ctrl + mũi tên
keymap('n', '<C-Up>', ':resize -2<CR>', opts)           -- Giảm chiều cao
keymap('n', '<C-Down>', ':resize +2<CR>', opts)         -- Tăng chiều cao
keymap('n', '<C-Left>', ':vertical resize -2<CR>', opts) -- Giảm chiều ngang
keymap('n', '<C-Right>', ':vertical resize +2<CR>', opts) -- Tăng chiều ngang

--custom
vim.keymap.set('n', '<leader>d', ':t.<CR>', {noremap = true, silent = true})

-- Comment.nvim keymaps
local api = require("Comment.api")
local opts = { noremap = true, silent = true }

-- Toggle comment dòng hiện tại (normal mode)
vim.keymap.set("n", "<leader>/", api.toggle.linewise.current, opts)

-- Toggle comment vùng chọn (visual mode)
vim.keymap.set("v", "<leader>/", function()
  -- dùng visual mode hiện tại
  api.toggle.linewise(vim.fn.visualmode())
end, opts)



-- Terminal (toggleterm)
keymap('n', '<Leader>tt', ':ToggleTerm<CR>', opts)
keymap('t', '<Esc>', [[<C-\><C-n>]], opts) -- thoát terminal mode về normal mode

-- Keymap để mở ToggleTerm
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<Leader>tt', ':ToggleTerm<CR>', opts)
vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], opts)  -- Thoát terminal mode về normal mode

local function run_toggleterm_cmd(cmd)
  -- Chạy lệnh trong ToggleTerm #1 (hoặc bất kỳ id bạn muốn)
  vim.cmd('TermExec direction=float cmd="' .. cmd .. '" go_back=0')
  vim.cmd("startinsert")
end


-- Map <leader>r theo từng filetype
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "java", "cpp", "kotlin", "python", "dart", "javascript", "typescript" },
  callback = function(args)
    local ft = vim.bo[args.buf].filetype
    local file = vim.fn.expand("%:t")
    local full_path = vim.fn.expand("%:p")
    local cmd = ""

    if ft == "java" then
      vim.cmd("w")
      local project_root = vim.fn.getcwd()
      local relative_path = full_path:gsub(project_root .. "/", "")
      local classpath = relative_path:gsub("%.java$", ""):gsub("/", ".")
      cmd = "javac " .. relative_path .. " && java " .. classpath

    elseif ft == "cpp" then
      vim.cmd("w")
      local out = vim.fn.expand("%:t:r")
      cmd = "g++ " .. file .. " -o " .. out .. " && ./" .. out

    elseif ft == "kotlin" then
      vim.cmd("w")
      local base = vim.fn.expand("%:t:r")
      cmd = "kotlinc " .. file .. " -include-runtime -d " .. base .. ".jar && java -jar " .. base .. ".jar"

    elseif ft == "python" then
      vim.cmd("w")
      cmd = "python3 " .. full_path

    elseif ft == "dart" then
      vim.cmd("w")
      cmd = "dart run " .. full_path

    elseif ft == "javascript" then
      vim.cmd("w")
      cmd = "node " .. full_path

    elseif ft == "typescript" then
      vim.cmd("w")
      cmd = "ts-node " .. full_path
    end

    if cmd ~= "" then
      vim.api.nvim_buf_set_keymap(args.buf, "n", "<leader>r", "", {
        noremap = true,
        silent = true,
        callback = function()
          run_toggleterm_cmd(cmd)
        end
      })
    end
  end,
})

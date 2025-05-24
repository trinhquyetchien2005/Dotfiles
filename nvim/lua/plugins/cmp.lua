local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- mở rộng snippet với LuaSnip
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),       -- gọi gợi ý thủ công
    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- enter chọn item đầu tiên
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = {
    { name = "nvim_lsp" },  -- LSP source
    { name = "luasnip" },   -- snippet source
    { name = "buffer" },    -- gợi ý từ buffer
    { name = "path" },      -- gợi ý đường dẫn
  },
  experimental = {
    ghost_text = true, -- hiển thị chữ mờ gợi ý tiếp theo
  },
})


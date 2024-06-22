return {
  "hrsh7th/vim-vsnip",
  event = "InsertCharPre",
  config = function()
    vim.o.completeopt = "menuone,noselect"
  end,
}

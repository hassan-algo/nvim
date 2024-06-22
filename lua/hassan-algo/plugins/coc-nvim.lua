return {
  "neoclide/coc.nvim", -- or any other LSP plugin that supports gopls
  config = function()
    vim.cmd("autocmd FileType go setlocal omnifunc=v:lua.vim.lsp.omnifunc")
  end,
  event = "BufReadPre",
}

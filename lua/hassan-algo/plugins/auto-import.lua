return {
  "darrikonn/vim-gofmt",
  config = function()
    -- Directly use GoImports on save
    vim.cmd([[
        augroup GoImports
          autocmd!
          autocmd BufWritePre *.go silent! :GoImports
        augroup END
      ]])
  end,
  event = "BufReadPre *.go", -- Lazy load on opening Go files
}

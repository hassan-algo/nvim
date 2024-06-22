-- Load necessary plugins and configurations
return {
  "nvim-treesitter/nvim-treesitter", -- Load nvim-treesitter plugin
  event = { "BufReadPre", "BufNewFile" }, -- Trigger events
  build = ":TSUpdate", -- Build command for treesitter
  dependencies = {
    "windwp/nvim-ts-autotag", -- Autotagging plugin dependency
  },
  config = function()
    local treesitter = require("nvim-treesitter.configs") -- Load nvim-treesitter configs

    treesitter.setup({
      ensure_installed = { -- List of parsers to install
        "json",
        "javascript",
        "typescript",
        "tsx",
        "yaml",
        "html",
        "css",
        "prisma",
        "markdown",
        "markdown_inline",
        "svelte",
        "go",
        "graphql",
        "bash",
        "lua",
        "vim",
        "dockerfile",
        "gitignore",
        "query",
        "vimdoc",
        "c",
      },
      highlight = {
        enable = true, -- Enable syntax highlighting
      },
      indent = {
        enable = true, -- Enable indentation
      },
      autotag = {
        enable = true, -- Enable autotagging
      },
      auto_close = true,
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = "<C-space>",
          node_decremental = "<bs>",
        },
      },
    })

    -- Setup nvim-cmp for completion
    local cmp = require("cmp")
    cmp.setup({
      snippet = {
        expand = function(args)
          -- You can use a snippet engine here, such as `luasnip` or `vim-vsnip`
          vim.fn["vsnip#anonymous"](args.body)
        end,
      },
      mapping = {
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        }),
      },
      sources = {
        { name = "nvim_lsp" }, -- Use nvim-lsp source
        { name = "treesitter" }, -- Use treesitter source
      },
    })
    -- Autotag configuration
    require("nvim-ts-autotag").setup()
  end,
}

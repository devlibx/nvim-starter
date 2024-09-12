return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- Mason & Mason helpers
  {
    "williamboman/mason.nvim"
  },
  {
    "williamboman/mason-lspconfig.nvim"
  },

  -- Rust tolling
  {
    "mrcjkb/rustaceanvim",
    version = "^4",
    lazy = false,
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
    },
  },

  -- Tree-sitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
   		ensure_installed = {
 			"vim", "lua", "vimdoc",
       "html", "css", "rust",
   		},
   	},
   },
}

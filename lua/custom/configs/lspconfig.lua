local on_attach = require("plugins.configs.lspconfig").on_attach
local capibilities = require("plugins.configs.lspconfig").capibilities

local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

lspconfig.rust_analyzer.setup({
  on_attach = on_attach,
  capibilities = capibilities,
  filetypes = {"rust"},
  root_dir = util.root_pattenr("Cargo.toml"),
  settings = {
    ['rust-analyzer'] = {
      cargo = {
        allFeatures = true,
      },
    },
  },
})

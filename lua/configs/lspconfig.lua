-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }

require('lspconfig').lua_ls.setup({
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT', -- or 'Lua 5.1', 'Lua 5.2', etc.
      },
      diagnostics = {
        globals = {'vim'}, -- add any global variables you use
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true), -- includes runtime files
      },
      completion = {
        callSnippet = "Replace", -- or "Insert" if preferred
      },
    },
  },
})

local cmp = require('cmp')

cmp.setup({
  sources = {
    { name = 'nvim_lsp' },  -- For LSP completions
    { name = 'path' },      -- For file path completions
    -- Add other sources as needed
  },
  -- Add your completion settings here
})


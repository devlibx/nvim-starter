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


--- configuring rust lsp settings
lspconfig.rust_analyzer.setup({
  settings = {
    ["rust-analyzer"] = {
      hover = {
        enable = true,
      },
      inlayHints = {
        enable = true,
      },
      diagnostics = {
        enable = true,
      },
    },
  },
})

-- Space-h => Bring details of the symbole
vim.api.nvim_set_keymap('n', '<Leader>h', '<Cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }

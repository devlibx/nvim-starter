return {
  {
    "williamboman/mason.nvim",
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = { "rust_analyzer", "pyright", "tsserver" }
      })
    end,
    dependencies = { 'williamboman/mason.nvim', 'neovim/nvim-lspconfig' }
  }
}

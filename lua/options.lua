require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

vim.g.rustaceanvim = {
  -- Plugin configuration
  tools = {
  },
  -- LSP configuration
  server = {
    on_attach = function(client, bufnr)
      vim.api.nvim_set_keymap("n", "<Leader>i", "<cmd>lua require'dap'.step_into()<CR>", { desc = "Debugger step into" })
      vim.api.nvim_set_keymap("n", "<Leader>n", "<cmd>lua require'dap'.step_over()<CR>", { desc = "Debugger step next" })
      vim.api.nvim_set_keymap("n", "<Leader>c", "<cmd>lua require'dap'.continue()<CR>", { desc = "Debugger continue" })
      vim.api.nvim_set_keymap("n", "<Leader>b", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Debugger Breakpoint" })
      vim.api.nvim_set_keymap("n", "<Leader>s", "<cmd>lua require'dap'.stop()<CR>", { desc = "Debugger stop" })
    end,
    default_settings = {
      -- rust-analyzer language server configuration
      ['rust-analyzer'] = {
      },
    },
  },
  -- DAP configuration
  dap = {
  },
}

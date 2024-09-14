-- Add this to your Neovim configuration file (e.g., `init.lua`)
vim.api.nvim_set_keymap('n', '<C-S-r>', [[:lua RunCommand()<CR>]], { noremap = true, silent = true })

-- Define a Lua function to handle different languages
function RunCommand()
  local ft = vim.bo.filetype
  if ft == "rust" then
    vim.cmd("RustRun")    -- For Rust files
  elseif ft == "python" then
    vim.cmd("!python3 %") -- For Python files
  elseif ft == "javascript" then
    vim.cmd("!node %")    -- For JavaScript files
  elseif ft == "go" then
    vim.cmd("!go run %")  -- For Go files
  elseif ft == "lua" then
    vim.cmd("!lua %")     -- For Lua files
  else
    print("No run command for filetype: " .. ft)
  end
end

-- Add file specific keys
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'go', 'rust', 'typescript', 'javascript', 'python' },
  callback = function()
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(0, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(0, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(0, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(0, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  end
})


-- Automatically check for file changes when switching buffers
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*',
  callback = function()
    vim.cmd('checktime')
  end
})

-- Automatically check for file changes when Neovim is idle (optional)
vim.api.nvim_create_autocmd('CursorHold', {
  pattern = '*',
  callback = function()
    vim.cmd('checktime')
  end
})

return {}

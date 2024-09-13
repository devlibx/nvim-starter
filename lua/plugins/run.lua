
-- Add this to your Neovim configuration file (e.g., `init.lua`)
vim.api.nvim_set_keymap('n', '<C-S-r>', [[:lua RunCommand()<CR>]], { noremap = true, silent = true })

-- Define a Lua function to handle different languages
function RunCommand()
  local ft = vim.bo.filetype
  if ft == "rust" then
    vim.cmd("RustRun")  -- For Rust files
  elseif ft == "python" then
    vim.cmd("!python3 %")  -- For Python files
  elseif ft == "javascript" then
    vim.cmd("!node %")  -- For JavaScript files
  elseif ft == "go" then
    vim.cmd("!go run %")  -- For Go files
  elseif ft == "lua" then
    vim.cmd("!lua %")  -- For Lua files
  else
    print("No run command for filetype: " .. ft)
  end
end


return {}

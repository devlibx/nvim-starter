-- Add setup scripts here

-- Define a command to format code using LSP
vim.api.nvim_create_user_command('Fmt', function()
  vim.lsp.buf.format()
end, { desc = 'Format code using LSP' })

-- Define a command to add, commit, and push changes to Git
vim.api.nvim_create_user_command('GitPush', function()
  -- Add all changes
  vim.fn.system('git add .')

  -- Commit changes with a default message
  local commit_message = "[*] intermediate code change"
  vim.fn.system('git commit -m "' .. commit_message .. '"')

  -- Push changes
  vim.fn.system('git push')

  -- Notify user
  print("Git operations completed: add, commit, push")
end, { desc = 'Add, commit, and push changes to Git' })

-- No-op
return {}

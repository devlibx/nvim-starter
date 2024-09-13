-- Add setup scripts here

-- Define a command to format code using LSP
vim.api.nvim_create_user_command('Fmt', function()
  vim.lsp.buf.format()
end, { desc = 'Format code using LSP' })

-- Define a command to add, commit, and push changes to Git with user-provided commit message or default message
vim.api.nvim_create_user_command('GitPush', function()
  -- Prompt user for commit message
  vim.ui.input({ prompt = 'Enter commit message (leave empty for default): ' }, function(input)
    -- Set default message if no input is provided
    local commit_message = input and input ~= '' and input or "[*] intermediate code change"

    -- DO the add, commit, push
    vim.fn.system('git add .')
    vim.fn.system('git commit -m "' .. commit_message .. '"')
    vim.fn.system('git push')
    print("Git operations completed: add, commit, push")
  end)
end, { desc = 'Add, commit, and push changes to Git with user-provided or default commit message' })

-- No-op
return {
  {
    "mg979/vim-visual-multi",
  },
}

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


local function list_keymaps()
  local keymaps = vim.fn.execute("map")
  local lines = vim.split(keymaps, "\n")
  local mappings = {}
  for _, line in ipairs(lines) do
    if line ~= "" then
      table.insert(mappings, line)
    end
  end
  return mappings
end

local function search_keymaps()
  require('telescope').extensions.fzf_writer.fuzzy_sort({
    prompt_title = 'Search Key Mappings',
    results_title = 'Key Mappings',
    sorter = require('telescope.sorters').get_fuzzy_file(),
    previewer = require('telescope.previewers').new_buffer_previewer({
      define_preview = function(self, entry, status)
        local lines = list_keymaps()
        vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, lines)
      end
    }),
    finder = require('telescope.finders').new_table({
      results = list_keymaps()
    })
  }):find()
end

-- Bind the function to a key
vim.api.nvim_set_keymap('n', '<leader>km', ':lua search_keymaps()<CR>', { noremap = true, silent = true })


-- No-op
return {

  {
    "mg979/vim-visual-multi",
  }

}

local M = {}

local original_mappings = {}

-- Save the original key mappings
local function save_original_mappings()
    original_mappings['<leader>n'] = vim.api.nvim_get_keymap('n')['<leader>n'] or nil
    original_mappings['<leader>i'] = vim.api.nvim_get_keymap('n')['<leader>i'] or nil
    original_mappings['<leader>c'] = vim.api.nvim_get_keymap('n')['<leader>c'] or nil
    original_mappings['<leader>s'] = vim.api.nvim_get_keymap('n')['<leader>s'] or nil
end

-- Restore the original key mappings
local function restore_original_mappings()
    if original_mappings['<leader>n'] then
        vim.api.nvim_set_keymap('n', '<leader>n', original_mappings['<leader>n'].rhs, {
            noremap = true,
            silent = true,
            desc = original_mappings['<leader>n'].desc or ''
        })
    else
        vim.api.nvim_del_keymap('n', '<leader>n')
    end

    if original_mappings['<leader>i'] then
        vim.api.nvim_set_keymap('n', '<leader>i', original_mappings['<leader>i'].rhs, {
            noremap = true,
            silent = true,
            desc = original_mappings['<leader>i'].desc or ''
        })
    else
        vim.api.nvim_del_keymap('n', '<leader>i')
    end

    if original_mappings['<leader>c'] then
        vim.api.nvim_set_keymap('n', '<leader>c', original_mappings['<leader>c'].rhs, {
            noremap = true,
            silent = true,
            desc = original_mappings['<leader>c'].desc or ''
        })
    else
        vim.api.nvim_del_keymap('n', '<leader>c')
    end

    if original_mappings['<leader>s'] then
        vim.api.nvim_set_keymap('n', '<leader>s', original_mappings['<leader>s'].rhs, {
            noremap = true,
            silent = true,
            desc = original_mappings['<leader>s'].desc or ''
        })
    else
        vim.api.nvim_del_keymap('n', '<leader>s')
    end
end

-- Set key mappings for debugging
local function set_debug_keys()
    save_original_mappings()  -- Save current mappings

    vim.api.nvim_set_keymap('n', '<leader>n', ':lua require("dap").step_over()<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>i', ':lua require("dap").step_into()<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>c', ':lua require("dap").continue()<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>s', ':lua require("dap").stop()<CR>', { noremap = true, silent = true })
end

-- Remove key mappings for debugging
local function remove_debug_keys()
    vim.api.nvim_del_keymap('n', '<leader>n')
    vim.api.nvim_del_keymap('n', '<leader>i')
    vim.api.nvim_del_keymap('n', '<leader>c')
    vim.api.nvim_del_keymap('n', '<leader>s')

    restore_original_mappings()  -- Restore original mappings
end

M.set_debug_keys = set_debug_keys
M.remove_debug_keys = remove_debug_keys

return M


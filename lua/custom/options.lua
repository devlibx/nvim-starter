
local o = vim.opt

-- Enable relative number
o.relativenumber = true

-- Always open VimTree when we start
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require("nvim-tree.api").tree.open()
  end,
})

local M = {}

-- Define custom highlights for breakpoints
function M.setup_breakpoint_highlights()
  vim.cmd [[
        highlight DapBreakpoint guifg=#FF0000 gui=bold
        highlight DapStopped guifg=#00FF00 gui=bold
    ]]

  vim.fn.sign_define('DapBreakpoint', {
    text = '●', -- Symbol for breakpoints
    texthl = 'DapBreakpoint', -- Highlight group
    linehl = '',
    numhl = ''
  })

  vim.fn.sign_define('DapStopped', {
    text = '▶', -- Symbol for current line
    texthl = 'DapStopped', -- Highlight group
    linehl = 'DapCurrentLine', -- Highlight current line
    numhl = ''
  })
end

function M.customize_dap_ui()
  -- Customize the UI panel appearance
  vim.cmd [[
        highlight DapUIBreakpointsLine guifg=#FF0000 guibg=#1E1E1E
        highlight DapUIBreakpointsCurrentLine guifg=#00FF00 guibg=#1E1E1E
        highlight DapUIScopesLine guifg=#FFFF00 guibg=#1E1E1E
        highlight DapUIStackFrame guifg=#FF00FF guibg=#1E1E1E
    ]]

  -- Customize other UI elements if needed
  -- Example: customizing the UI window borders
  vim.cmd [[
        highlight DapUIWindowBorder guifg=#FF0000
    ]]
end

return M

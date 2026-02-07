local function send_visual_selection_to_terminal()
  -- Custom function to send visual selection to toggled terminal
  local current_window = vim.api.nvim_get_current_win()

  -- Get the start and the end of the visual selection
  local b_line, b_col = unpack(vim.fn.getpos "'<", 2, 3)
  local e_line, e_col = unpack(vim.fn.getpos "'>", 2, 3)
  local lines = vim.api.nvim_buf_get_lines(0, b_line - 1, e_line, 0)
  if #lines == 0 then
    return
  end

  -- Send each line to the terminal
  for _, v in ipairs(lines) do
    -- Trim string from spaces
    v = v:gsub('^%s+', ''):gsub('%s+$', '')
    require('toggleterm').exec(v, 1)
  end

  -- Jump back with the cursor where we were at the begiining of the selection
  vim.api.nvim_set_current_win(current_window)
  vim.fn.cursor(b_line, b_col)
end

vim.keymap.set('v', '<leader>st', send_visual_selection_to_terminal)

vim.api.nvim_create_autocmd('BufReadPost', {
  group = augroup,
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'cpp',
  callback = function()
    -- Compile to a temporary executable (e.g., 'a.out')
    vim.api.nvim_buf_set_keymap(0, 'n', '<F9>', ':w | !g++ % && ./a.out<CR>', { noremap = true, silent = true, buffer = true })
    -- Or, compile to an executable named after the source file (e.g., 'main')
    -- vim.api.nvim_buf_set_keymap(0, 'n', '<F9>', ':w | exec "!g++ % -o %:r"<CR>', { noremap = true, silent = true, buffer = true })

    -- Run the executable (assuming you compiled to 'a.out')
    vim.api.nvim_buf_set_keymap(0, 'n', '<F10>', ':!./a.out<CR>', { noremap = true, silent = true, buffer = true })
    -- Or, run the executable named after the source file
    -- vim.api.nvim_buf_set_keymap(0, 'n', '<F10>', ':!./%:r<CR>', { noremap = true, silent = true, buffer = true })
  end,
})

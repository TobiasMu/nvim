vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.expandtab = true
vim.opt_local.softtabstop = 2

vim.keymap.set('n', '<leader>sf', function()
  vim.cmd 'w'
  local compile_cmd = '!echo "" && g++ % -o %< && ./%<'
  vim.cmd(compile_cmd)
end, { desc = 'Save, Compile (g++), and Run C++' })

vim.keymap.set('n', '<leader>is', 'ostd::cout << "TEXT "<< <<"\\n"; <esc>5bce')

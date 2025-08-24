local map = vim.keymap.set

map('n', 'n', '%', { remap = true, buffer = true, desc = '' })
map('n', 'r', 'R', { remap = true, buffer = true, desc = '' })
map('n', '<ESC>', ':bdelete!<CR>', { remap = true, buffer = true, desc = '' })

map('n', 'l', '<CR>', { remap = true, buffer = true, desc = '' })
map('n', 'L', '<CR>:Lexplore<CR>', { remap = true, buffer = true, desc = '' })

map('n', 'h', '-', { remap = true, buffer = true, desc = '' })

map('n', 'P', '<C-w>z', { remap = true, buffer = true, desc = '' })

map('n', '.', 'gh', { remap = true, buffer = true, desc = '' })
map('n', 'ff', '%:w<cr>:buffer #<CR>', { remap = true, buffer = true, desc = '' })

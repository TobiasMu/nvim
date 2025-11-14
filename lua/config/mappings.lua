local map = vim.keymap.set
-- map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
map('n', ';', ':', { desc = 'CMD enter command mode' })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map('n', '<C-h>', '<C-w>h', { desc = 'switch window left' })
map('n', '<C-l>', '<C-w>l', { desc = 'switch window right' })
map('n', '<C-j>', '<C-w>j', { desc = 'switch window down' })
map('n', '<C-k>', '<C-w>k', { desc = 'switch window up' })

map('n', '<Esc>', '<cmd>noh<CR>', { desc = 'general clear highlights' })

map('n', 'YY', '<cmd>%y+<CR>', { desc = 'general copy whole file' })

map('n', '<leader>tn', '<cmd>set nu!<CR>', { desc = 'toggle line number' })
map('n', '<leader>trn', '<cmd>set rnu!<CR>', { desc = 'toggle relative number' })
map('n', '<leader>tch', '<cmd>NvCheatsheet<CR>', { desc = 'toggle nvcheatsheet' })

map({ 'n', 'x' }, '<leader>cf', function()
  require('conform').format { lsp_fallback = true }
end, { desc = 'general format file' })

-- global lsp mappings
map('n', '<leader>ds', vim.diagnostic.setloclist, { desc = 'LSP diagnostic loclist' })

map({ 'n', 'v' }, '<leader>dd', '"_d', {})
map({ 'n', 'v' }, '<leader>da', 'ggVG"_d', {})
-- tabufline
map('n', '<leader>bn', '<cmd>enew<CR>', { desc = 'buffer new' })

map('n', '<S-j>', '5j')
map('n', '<S-k>', '5k')
map('n', '<leader>k', 'K')

map('n', '<tab>', function()
  require('nvchad.tabufline').next()
end, { desc = 'buffer goto next' })

map('n', '<S-tab>', function()
  require('nvchad.tabufline').prev()
end, { desc = 'buffer goto prev' })

map('n', '<leader>x', function()
  require('nvchad.tabufline').close_buffer()
end, { desc = 'buffer close' })

-- Comment
map('n', '<leader>/', 'gcc', { desc = 'toggle comment', remap = true })
map('v', '<leader>/', 'gc', { desc = 'toggle comment', remap = true })
--aa
-- nvimtree
-- map('n', '<leader>e', ':Explore<CR>', { desc = 'nvimtree focus window' })
map('n', '<leader>e', '<cmd>Oil<cr>')

-- terminal
map('t', '<C-x>', '<C-\\><C-N>', { desc = 'terminal escape terminal mode' })

-- new terminals
map({ 'n', 't' }, '<A-t>', function()
  require('nvchad.term').toggle { pos = 'float', id = 'floatTerm' }
end, { desc = 'terminal toggle floating term' })

-- whichkey
map('n', '<leader>wK', '<cmd>WhichKey <CR>', { desc = 'whichkey all keymaps' })

map('n', '<leader>wk', function()
  vim.cmd('WhichKey ' .. vim.fn.input 'WhichKey: ')
end, { desc = 'whichkey query lookup' })

-- Copy Full File-Path
map('n', '<leader>pa', function()
  local path = vim.fn.expand '%:p'
  vim.fn.setreg('+', path)
  print('file:', path)
end, { desc = 'copy full path of file' })

-- Quick config editing
map({ 'n', 'v' }, 'm', '%', { desc = 'easier matching' })
map('n', '<leader>rc', ':e ~/.config/nvim/init.lua<CR>', { desc = 'Edit config' })
map('n', '<leader>rq', ':e ~/.config/nvim/cheatsheets/sqlite_cheatsheet.md<CR>', { desc = 'SQL cheathseet' })

map('n', '<leader><leader>x', '<cmd>source %<CR>')

map('i', 'jk', '<Right>', { desc = 'exit parenthesis' })

map('n', 'n', "'Nn'[v:searchforward].'zv'", { expr = true, desc = 'Next Search Result' })
map('x', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next Search Result' })
map('o', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next Search Result' })
map('n', 'N', "'nN'[v:searchforward].'zv'", { expr = true, desc = 'Prev Search Result' })
map('x', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev Search Result' })
map('o', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev Search Result' })

----------------------------------FZF LUA -----------------

local config = require 'fzf-lua.config'
local actions = require('trouble.sources.fzf').actions
config.defaults.actions.files['ctrl-t'] = actions.open

map('n', ',', '<CMD>FzfLua blines<CR>', { desc = 'Search Lines' })
map('n', '<leader>ff', '<CMD>FzfLua files<CR>', { desc = 'Find files' })
map('n', '<leader>fw', '<CMD>FzfLua grep_cWORD<CR>', { desc = 'Find String Cursor' })
map('n', '<leader>fd', '<CMD>FzfLua diagnostics_document<CR>', { desc = 'diagnostics' })
map('n', '<leader>fg', '<CMD>FzfLua live_grep<CR>', { desc = 'Live Grep' })
map('n', '<c-g>', '<CMD>FzfLua live_grep resume=true<CR>', { desc = 'help tags' })
map('n', '<leader>fp', '<CMD>FzfLua complete_path<CR>', { desc = 'find path' })

map('n', '<leader>fo', '<cmd>FzfLua oldfiles<CR>', { desc = 'find oldfiles' })
map('n', '<leader>fr', '<cmd>FzfLua resume<CR>', { desc = 'find oldfiles' })

map('n', '<leader>gc', '<cmd>FzfLua git_commits<CR>', { desc = 'git commits' })
map('n', '<leader>gs', '<cmd>FzfLua git_status<CR>', { desc = 'telescope git status' })

map('n', '<leader>fh', '<CMD>FzfLua helptags<CR>', { desc = 'help tags' })
map('n', '<leader>fh', '<CMD>FzfLua helptags<CR>', { desc = 'help tags' })

map('v', '<leader>fw', '<CMD>FzfLua grep_visual<CR>', { desc = 'Find visual selection' })

map('n', '<leader>fb', function()
  require('mini.pick').builtin.buffers()
end, { desc = 'files or buffers' })

map('n', '<leader>fi', [[<Cmd>lua require"fzf-lua".builtin()<CR>]], {})

map('n', '<leader>vc', [[<Cmd>CsvViewToggle delimiter=, quote_char=' comment=# display_mode=border<CR>]])
map('n', '<leader>vt', ':TypstPreview<CR>')

-- Function to close buffer but keep tab if it's the only buffer in tab
map('n', '<leader>bd', ':bdelete!<CR>', { desc = 'delete buffer' })

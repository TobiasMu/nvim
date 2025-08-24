return {
  'echasnovski/mini.nvim',
  config = function()
    require('mini.basics').setup()
    require('mini.ai').setup()
    require('mini.pairs').setup()
    require('mini.move').setup()
    require('mini.jump').setup()
    require('mini.jump2d').setup()
    require('mini.surround').setup {
      mappings = {
        add = 'gsa',
        delete = 'gsd',
        find = 'gsf',
        find_left = 'gsF',
        highlight = 'gsh',
        replace = 'gsr',
        update_n_lines = 'gsn',
      },
      search_method = 'cover_or_next',
    }

    require('mini.indentscope').setup()
  end,
}

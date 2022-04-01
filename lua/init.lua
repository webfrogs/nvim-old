require'nvim-tree'.setup {
  view = {
    mappings = {
      list = {
        { key = "t",                            action = "tabnew" },
        { key = "<C-t>",                        action = "" },
      },
    },
  },
}

-- toggleterm plugin settings
require("toggleterm").setup{
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<c-t>]],
  direction = 'float', -- 'vertical' | 'horizontal' | 'window' | 'float'
  float_opts = {
    border = 'curved', -- 'single' | 'double' | 'shadow' | 'curved'
  }
}

vim.g.do_filetype_lua = 1    -- use filetype.lua
vim.g.did_load_filetypes = 0 -- disable filetype.vim

vim.filetype.add({
  extension = {
    pn = "potion",
    sh = "sh",
    sql = "sql",
    xml = "xml",
    c = "c",
    go = "go",
    h = function(path, bufnr)
      local first_line = vim.api.nvim_buf_get_lines(bufnr, 0, 1, true);
      if first_line:match('<iostream>') then
        return "cpp"
      end
      return "c"
    end,
  },
  filename = {
    [".git/config"] = "gitconfig",
    ["~/.config/mutt/muttrc"] = "muttrc",
    -- ["README$"] = function(path, bufnr)
    --   if string.find("#", vim.api.nvim_buf_get_lines(bufnr, 0, 1, true)) then
    --     return "markdown"
    --   end
    --   -- no return means the filetype won't be set and to try the next method
    -- end,
  },
})

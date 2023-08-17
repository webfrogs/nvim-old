local status, guard = pcall(require, "guard")
if not status then
  vim.notify("plugin guard not found!")
  return
end

local ft = require("guard.filetype")

ft("go"):fmt("gofumpt")
  :append("goimports")
-- ft("go"):fmt("gofmt")
--   :append("goimports")

-- Call setup() LAST!
guard.setup({
    -- the only options for the setup function
    fmt_on_save = true,
    -- Use lsp if no formatter was defined for this filetype
    lsp_as_default_formatter = false,
})

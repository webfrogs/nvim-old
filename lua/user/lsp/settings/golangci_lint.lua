local util = require("lspconfig/util")

return {
  root_dir = util.root_pattern("go.mod", ".git"),
  cmd = { 'golangci-lint-langserver' },
  init_options = {
    command = { "golangci-lint", "run", "--enable-all", "--disable", "lll", "--out-format", "json", "--issues-exit-code=1" },
  },
}

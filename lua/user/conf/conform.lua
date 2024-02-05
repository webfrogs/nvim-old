local status, conform = pcall(require, "conform")
if not status then
  vim.notify("plugin conform not found!")
  return
end

conform.setup({
  formatters_by_ft = {
    go = { "goimports", "gofmt" },
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    python = { "isort", "black" },
    -- Use a sub-list to run only the first available formatter
    javascript = { { "prettierd", "prettier" } },
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
})

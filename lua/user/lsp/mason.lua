local status_ok, mason = pcall(require, "mason")
if not status_ok then
  vim.notify("mason not found!")
  return
end
mason.setup()


local mason_lspconfig
status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
  vim.notify("mason-lspconfig not found!")
  return
end

mason_lspconfig.setup {
  ensure_installed = {
    "lua_ls",
    "rust_analyzer",
    "gopls",
    "golangci_lint_ls",
    "clangd",
    "pylsp",
  },
}

local lspconfig
status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  vim.notify("lspconfig not found!")
  return
end

mason_lspconfig.setup_handlers {
  -- This is a default handler that will be called for each installed server (also for new servers that are installed during a session)
  function(server_name)
    local opts = {
      on_attach = require("user.lsp.handlers").on_attach,
      capabilities = require("user.lsp.handlers").capabilities,
    }

    if server_name == "lua_ls" then
      local lua_ls_opts = require("user.lsp.settings.lua_ls")
      opts = vim.tbl_deep_extend("force", lua_ls_opts, opts)
    end

    if server_name == "clangd" then
      local clangd_opts = require("user.lsp.settings.clangd")
      opts = vim.tbl_deep_extend("force", clangd_opts, opts)
    end

    if server_name == "jsonls" then
      local jsonls_opts = require("user.lsp.settings.jsonls")
      opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
    end

    if server_name == "pyright" then
      local pyright_opts = require("user.lsp.settings.pyright")
      opts = vim.tbl_deep_extend("force", pyright_opts, opts)
    end

    -- if server_name == "gopls" then
    --   local gopls_opts = require("user.lsp.settings.gopls")
    --   opts = vim.tbl_deep_extend("force", gopls_opts, opts)
    -- end

    -- if server_name == "golangci_lint_ls" then
    --   local customer_opts = require("user.lsp.settings.golangci_lint")
    --   opts = vim.tbl_deep_extend("force", customer_opts, opts)
    -- end

    lspconfig[server_name].setup(opts)
  end
}

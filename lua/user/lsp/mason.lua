local status_ok, mason = pcall(require, "mason")
if not status_ok then
  vim.notify("mason not found!")
	return
end
mason.setup()


local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
  vim.notify("mason-lspconfig not found!")
	return
end

mason_lspconfig.setup {
    ensure_installed = { "lua_ls", "rust_analyzer" },
}

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  vim.notify("lspconfig not found!")
  return
end

mason_lspconfig.setup_handlers {
  -- This is a default handler that will be called for each installed server (also for new servers that are installed during a session)
  function (server_name)
    lspconfig[server_name].setup {}
  end
}


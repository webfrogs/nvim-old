-- LSP
return {
  "neovim/nvim-lspconfig", -- enable LSP
  "williamboman/mason.nvim", -- lsp installer
  "williamboman/mason-lspconfig.nvim",
  "ray-x/lsp_signature.nvim", -- show function signature when typing
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = "go",
    opts = function ()
      return require("user.lsp.null-ls")
    end,
  },
}

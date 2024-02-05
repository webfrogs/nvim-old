-- LSP
return {
  "neovim/nvim-lspconfig", -- enable LSP
  "williamboman/mason.nvim", -- lsp installer
  "williamboman/mason-lspconfig.nvim",
  "ray-x/lsp_signature.nvim", -- show function signature when typing
  {
    'stevearc/conform.nvim',
    opts = {},
    event = "VeryLazy",
    config = function ()
      require("user.conf.conform")
    end
  }
}

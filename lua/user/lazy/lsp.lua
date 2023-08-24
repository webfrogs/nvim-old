-- LSP
return {
  "neovim/nvim-lspconfig", -- enable LSP
  "williamboman/mason.nvim", -- lsp installer
  "williamboman/mason-lspconfig.nvim",
  "ray-x/lsp_signature.nvim", -- show function signature when typing
  {
    "nvimdev/guard.nvim",
    event = "VeryLazy",
    config = function ()
      require("user.conf.guard")
    end,
  },
}

return {
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function (_, opts)
      require("gopher").setup(opts)
    end,
    keys = {
      {"<leader>gta", "<cmd>GoTestAdd<cr>", "n", desc="generate one test for current function/method"},
      {"<leader>gie", "<cmd>GoIfErr<cr>", "n", desc="generate 'if error'"},
    },
    -- build = function ()
    --   vim.cmd [[silent! GoInstallDeps]]
    -- end,
  }
}

return {
  -- My plugins
  {'akinsho/toggleterm.nvim', version = "*", config = true},
  "rcarriga/nvim-notify",
  "nvim-lua/plenary.nvim",
  "nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
  'f-person/git-blame.nvim',

  -- theme
  "projekt0n/github-nvim-theme",
  "EdenEast/nightfox.nvim",

  -- markdown, see: https://github.com/iamcco/markdown-preview.nvim
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    init = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" },
  },

  -- Editor enhance
  "windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
  "terrortylor/nvim-comment",
  "tpope/vim-repeat", --  . command enhance
  "tpope/vim-surround", -- vim surround
  -- use "andymass/vim-matchup"
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons', opt = true }
  },
  {
    'kyazdani42/nvim-tree.lua',
    dependencies = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    }
  },

  -- cmp plugins
  "hrsh7th/nvim-cmp", -- The completion plugin
  "hrsh7th/cmp-buffer", -- buffer completions
  "hrsh7th/cmp-path", -- path completions
  "hrsh7th/cmp-cmdline", -- cmdline completions
  "saadparwaiz1/cmp_luasnip", -- snippet completions
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lua",
  "f3fora/cmp-spell", -- spell check

  -- Telescpoe
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { {'nvim-lua/plenary.nvim'} }
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
  "nvim-telescope/telescope-dap.nvim",
  "lewis6991/nvim-treesitter-context", -- show class/function at the top

  -- dap
  "mfussenegger/nvim-dap",
  "theHamsta/nvim-dap-virtual-text",
  "rcarriga/nvim-dap-ui",

  -- snippets
  "L3MON4D3/LuaSnip", --snippet engine
}
local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
-- keymap("", ";", "<Nop>", opts)
-- vim.g.mapleader = ";"
-- vim.g.maplocalleader = ";"
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Modes normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t", command_mode = "c",
--

-- Editor
keymap("n", "<c-_>", ":CommentToggle<cr>", opts)
keymap("v", "<c-_>", ":CommentToggle<cr>", opts)


-- FileExpoler
keymap("n", "<c-n>", ":NvimTreeToggle<cr>", opts)
-- keymap("n", "<leader>f", ":NvimTreeFindFile<cr>", opts)


-- System clipboard
keymap("n", "<leader>y", "\"+y", opts)
keymap("n", "<leader>p", "\"+p", opts)



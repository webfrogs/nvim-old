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

-- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
keymap("n", "<leader>fn", "<cmd>Telescope help_tags<cr>", opts)

-- Editor
keymap("n", "<C-_>", ":CommentToggle<cr>", opts)
keymap("v", "<C-_>", ":CommentToggle<cr>", opts)
keymap("n", "<leader>1", ":noh<cr>", opts)
keymap("n", "<leader>2", ":cclose<cr>", opts)


-- FileExpoler
keymap("n", "<leader>t", ":NvimTreeToggle<cr>", opts)
-- keymap("n", "<leader>f", ":NvimTreeFindFile<cr>", opts)


-- System clipboard
keymap("n", "<leader>y", "\"+y", opts)
keymap("n", "<leader>p", "\"+p", opts)



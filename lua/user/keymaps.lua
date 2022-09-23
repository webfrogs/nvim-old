local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
-- keymap("", ";", "<Nop>", opts)
-- vim.g.mapleader = ";"
-- vim.g.maplocalleader = ";"
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- vim-go plugin settings
vim.g['go_def_mapping_enabled'] = 0
vim.g['go_fmt_command'] = 'goimports'

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
if vim.loop.os_uname().sysname == "Darwin" then
  keymap("n", "<C-/>", ":CommentToggle<cr>", opts)
  keymap("v", "<C-/>", ":CommentToggle<cr>", opts)
else
  keymap("n", "<C-_>", ":CommentToggle<cr>", opts)
  keymap("v", "<C-_>", ":CommentToggle<cr>", opts)
end
keymap("n", "<leader>1", ":noh<cr>", opts)
keymap("n", "<leader>2", ":cclose<cr>", opts)

-- Debug
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dB", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", opts)
-- keymap("n", "<leader>dr", "lua require'dap'.repl.open()<cr>", opts)
keymap("n", "<leader>dl", "lua require'dap'.run_last()<cr>", opts)
keymap('n', '<F10>', '<cmd>lua require"user.dap.dap-util".reload_continue()<CR>', opts)
keymap("n", "<F4>", "<cmd>lua require'dap'.terminate()<cr>", opts)
keymap("n", "<F5>", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<F6>", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<F7>", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<F8>", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "K", "<cmd>lua require'dapui'.eval()<cr>", opts)

-- FileExpoler
keymap("n", "<leader>t", ":NvimTreeToggle<cr>", opts)
keymap("n", "<leader>o", ":NvimTreeFindFile<cr>", opts)


-- System clipboard
keymap("n", "<leader>y", "\"+y", opts)
keymap("n", "<leader>p", "\"+p", opts)

-- copy current file and cursor line to clipboard
keymap("n", "<leader>l", ":let @+ = expand(\"%\") . \":\" . line(\".\")<CR>", opts)

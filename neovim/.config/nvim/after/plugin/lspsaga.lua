local keymap = vim.keymap.set
local saga = require('lspsaga')

saga.init_lsp_saga()

keymap("n", "<leader>pd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })
keymap("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", { silent = true })
keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { silent = true })

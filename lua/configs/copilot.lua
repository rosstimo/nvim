-- vim.cmd.[[imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")]]
vim.g.copilot_no_tab_map = true

-- Key mappings for GitHub Copilot
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
-- map("i", "<C-Space>", "copilot#complete()", opts)
-- map("i", "<CR>", "copilot#next()", opts)
-- map("i", "<C-e>", "copilot#cancel()", opts)
map("i", "<C-a>", ":copilot#Accept('<cr>')<cr>", opts)
-- map("i", "<C-k>", "copilot#cancel()", opts)
-- map("i", "<C-f>", "copilot#fill()", opts)
-- map("i", "<C-c>", "copilot#expand()", opts)
-- map("i", "<C-u>", "copilot#unexpand()", opts)
-- map("i", "<C-g>", "copilot#goto()", opts)


-- map copilot-suggest to <C-Space> 

map("i", "<C-g>", ":copilot#suggest()", opts)



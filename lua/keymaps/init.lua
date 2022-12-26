local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true}

vim.g.mapleader = ' ' -- leader key to space

map("n", "<leader>t", ":NvimTreeToggle<CR>", opts)
map("n", "<leader>gt", ":NvimTreeFocus<CR>", opts)

--move selected line(s) 
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)
map("v", "L", ">gv", opts)
map("v", "H", "<gv", opts)

-- Clipboard Copy/Paste
-- use CTRL-c to copy in visual mode
map('v', '<C-c>' , '"*y :let @+=@* <CR>', opts)

-- use CTRL-v to paste in normal mode
map('n', '<C-v>', '"+P', opts)

-- Use xclip to handle interface "+ and "* registers with system clipboard
-- xclip must be installed and $DISPLAY must be set
-- see :help clipboard
vim.g.clipboard = {
  name =  'myClipboard',
  copy = {
    ['+'] = {'xclip', '-i', '-sel', 'clipboard'},
    ['*'] = {'xclip', '-i', '-sel', 'clipboard'},
  },
  paste = {
    ['+'] = {'xclip', '-o', '-sel', 'clipboard'},
    ['*'] = {'xclip', '-o', '-sel', 'clipboard'},
  },
  cache_enabled = true,
  }


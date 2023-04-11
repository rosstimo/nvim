local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true}

vim.g.mapleader = ' ' -- leader key to space

-- reload init.lua
map("n", "<leader>r", ":source /home/tim/.config/nvim/init.lua<CR>",opts)

map("n", "<leader>t", ":NvimTreeToggle<CR>", opts)
map("n", "<leader>gt", ":NvimTreeFocus<CR>", opts)

--move selected line(s) 
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)
map("v", "L", ">gv", opts)
map("v", "H", "<gv", opts)

-- commands

local function mess ()
  vim.notify("hello")
  --require("notify")("My super important message") --vim.fn.expand("%")
  vim.notify(vim.fn.expand("%:r") .. ".pdf")
  os.remove(vim.fn.expand("%:r") .. ".pdf")
end

--[[ compile the current buffer assumeing it is source code or a LaTeX file.
     requires compilar shell script to be available and added to PATH.
     TODO: I may want to play around with what to do if the current file can't
     be compiled. a clean fail and notification at least.
--]]
local function texCompile ()
  os.remove(vim.fn.expand("%:r") .. ".pdf")
  os.execute("compiler " .. vim.fn.expand("%") ..  " > /dev/null && " ..
             "texclear " .. vim.fn.expand("%") .. " > /dev/null")
  --("notify")(vim.fn.expand("%:r") .. ".tex", 2, {title = "Compiling...", icon ="", timeout = 1000, render = "default"})
  vim.notify("Compiling: " .. vim.fn.expand("%:r") .. ".tex", 2)
  local fileExists=io.open(vim.fn.expand("%:r") .. ".pdf")
  if fileExists == nil then
    vim.notify("Compile Error!" .. vim.fn.expand("%:r") .. ".tex", 2)
    --require("notify")(vim.fn.expand("%:r") .. ".tex", 2, {title = "Compile Error! - Check Logs", icon = "", timeout = 1000, render = "default"})
  else
    os.remove(vim.fn.expand("%:r") .. ".log")
  end
end

--[[  open a pdf file with the same path/name as the current buffer
      i.e. after compile of a LaTeX file. previewpdf shell script must be 
      available and added to PATH. uses zathura pdf due to its auto update
      on recompile so you don't have to close and reopen it.
--]]
local function texPdfPreview ()
  local file_name=vim.fn.expand("%:r") .. ".pdf"
  local fileExists=io.open(file_name, "r")
  if fileExists==nil then
   vim.notify(file_name .. "", 2)
    --require("notify")(file_name .. "", 2, {title = "Pdf Preview Error! - File Not Found", icon = "", timeout = 1000, render = "default"})
  else
    os.execute("previewpdf " .. vim.fn.expand("%:r") .. ".pdf")
  end
end

vim.keymap.set('n',"<F3>", texCompile, opts)
vim.keymap.set('n',"<F4>", mess, opts)
vim.keymap.set('n',"<F5>", texPdfPreview, opts)

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

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


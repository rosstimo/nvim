--use variable 'set' instead of vim.opt
local set  =  vim.opt

--turn on line numbers
--editor/interface stuff
set.number = true
set.relativenumber = true
set.cursorline = true
set.showmode = true
set.splitright = true
set.splitbelow = true
set.breakindent = true
set.wrap = false
set.scrolloff = 5
set.fileencoding = "utf-8"
set.hidden = true
set.mouse = "a"
set.clipboard = "unnamed"
set.clipboard:append("unnamedplus")

--make Tabs into 2 spaces
set.smarttab = true
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.expandtab = true

--serch options
set.hlsearch = true
set.incsearch = true
set.wildmenu = true
set.completeopt = "menuone,preview,noselect"
vim.opt.path:append("**")

--notify
vim.notify = require("notify")


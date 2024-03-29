--use variable 'vim.opt' instead of vim.opt

--editor/interface stuff
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.colorcolumn = "80"
vim.opt.showmode = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.breakindent = true
vim.opt.wrap = false
vim.opt.scrolloff = 10
vim.opt.fileencoding = "utf-8"
vim.opt.hidden = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamed"
vim.opt.clipboard:append("unnamedplus")
vim.opt.signcolumn = "auto:1-2" --sign column width min:1 max:9
vim.cmd [[colorscheme onedark]]

--make Tabs into 2 spaces
vim.opt.smarttab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

--search options
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.wildmenu = true
vim.opt.completeopt = "menuone,preview,noselect"
vim.opt.path:append("**")

--undo and backup 
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.config/nvim/undodir"
vim.opt.undofile = true

-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
    vim.cmd [[colorscheme onedark]] end,
  group = highlight_group,
  pattern = '*',
})

-- spell check
vim.opt.spelllang = "en"
vim.opt.spellsuggest = "best, 9"

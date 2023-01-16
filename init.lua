require("gui") -- statusline, tabs, notify, theme, etc.
require("fzf") -- fuzzy finder: nvim-telescope
require("settings")
require("keymaps")
-- plugin manager
require("plugin.packerConfig")
-- gui
--require("plugin.notifyConfig")
--require("plugin.barbarConfig")
require("keymaps.barbar")
--require("plugin.luaLineConfig")
--require("plugin.indentBlankLineConfig")
--require("plugin.oneDarkConfig")
--require("plugin.undoTreeConfig")
--require("plugin.nvimTreeConfig")
require("plugin.commentConfig")
-- lsp
require("plugin.lsp")
require("plugin.lsp.nvim-cmp")
require("plugin.lsp.lspkind")
-- lint
require("plugin.treeSitterConfig")
require("plugin.tsRainbowConfig")
require("plugin.colorizerConfig")
require("plugin.gitSignsConfig")
-- fzf
--require("plugin.telescopeConfig")



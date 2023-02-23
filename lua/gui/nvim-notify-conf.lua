--https://github.com/rcarriga/nvim-notify
-- see :help NotifyOptions
--notify
vim.opt.termguicolors = true
--vim.notify = require("notify")

vim.notify = require("notify").setup({
  background_colour = "Normal",
  fps = 30,
  icons = {
    DEBUG = "",
    ERROR = "",
    INFO = "",
    TRACE = "✎",
    WARN = ""
  },
  level = 2,
  minimum_width = 50,
  render = "default",
  stages = "fade_in_slide_out",
  timeout = 5000,
  top_down = true

})
--vim.notify("Notifications are on!!", "error")

-- require("notify")("hello")
-- require("notify")("the message",2, {title = "Title", icon = "", timeout = 1000, render = "default"})
-- require("notify")("the message",2, {title = "Title", icon = "", timeout = 1000, render = "minimal"})
-- require("notify")("the message",2, {title = "Title", icon = "", timeout = 1000, render = "simple"})

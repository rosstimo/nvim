require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("n", "<leader>n", "<cmd> set nu! <CR>", { desc = "Toggle line numbers" })
map("n", "<leader>l", "<cmd> set wrap! <CR>", { desc = "Toggle line wrap" })
map("n", "<leader>s", "<cmd> set spell! <CR>", { desc = "Toggle spell check" })
map("n", "<C-f>", "<cmd> NvimTreeToggle <CR>", { desc = "Toggle nvimtree" })

-- move selected line / block of text in visual mode
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Selected Move line down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Selected Move line up" })
map("v", "L", ">gv", { desc = "Selected Indent right" })
map("v", "H", "<gv", { desc = "Selected Indent left" })





--[[ compile the current buffer assuming it is source code or a LaTeX file.
       Requires compiler shell script to be available and added to PATH.
       TODO: I may want to play around with what to do if the current file can't
       be compiled. a clean fail and notification at least.
--]]
map("n", "<F5>",
  function()
    if vim.bo.filetype == "tex" then
      os.execute("texCompile.sh " .. vim.fn.expand("%") .. " > /dev/null")
      vim.notify("Compiling: " .. vim.fn.expand("%:r") .. ".tex", 2)
    end
  end,
  { desc = "Compile the current file" })


--[[  open a pdf file with the same path/name as the current buffer
            i.e. after compile of a LaTeX file. uses zathura pdf due to its auto update
            on recompile so you don't have to close and reopen it.
--]]
map("n", "<F6>",
  function()
    local file_name = vim.fn.expand("%:r") .. ".pdf"
    local fileExists = io.open(file_name, "r")
    if fileExists == nil then
      vim.notify(file_name .. "", 2)
    else
      os.execute("pgrep zathura || zathura " .. vim.fn.expand("%:r") .. ".pdf" .. "&")
    end
  end,
  { desc = "Preview pdf file" })



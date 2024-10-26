require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC> <cmd> w <cr>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--
map("n", "<F6>", function()
    local filetype=vim.bo.filetype
    if filetype == "c" then
        vim.cmd("!gcc -o test_c %")
        vim.cmd("!./test_c")
    elseif filetype == "cpp" then
        vim.cmd("!g++ -o test_cpp %")
        vim.cmd("!./test_cpp")
    elseif filetype == "python" then
        vim.cmd("!python3 %")
    else
        print("Current file type: " .. filetype)
    end
end, { desc = "compile current file" })

-- Keyboard users
vim.keymap.set("n", "<C-t>", function()
  require("menu").open("default")
end, {})

-- mouse users + nvimtree users!
vim.keymap.set("n", "<RightMouse>", function()
  vim.cmd.exec '"normal! \\<RightMouse>"'

  local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
  require("menu").open(options, { mouse = true })
end, {})

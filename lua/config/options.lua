-- ~/.config/nvim/lua/config/options.lua


-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
local opt = vim.opt
opt.compatible = false
opt.backspace = "indent,eol,start"
opt.visualbell = true
opt.clipboard = "unnamed"
opt.number = true
opt.relativenumber = true
opt.signcolumn = "no"
opt.cursorline = false
opt.termguicolors = true  -- Ensure this is set

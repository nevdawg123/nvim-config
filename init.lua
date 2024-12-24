

vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
vim.fn.system({
"git",
"clone",
"--filter=blob:none",
"https://github.com/folke/lazy.nvim.git",
"--branch=stable",
lazypath,
})
end

vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins.my_plugins")
require("keymaps").setup()
require("config.options")
require("lualine").setup()


-- Set line number color
vim.api.nvim_set_hl(0, 'LineNr', { fg = '#919294', bg = 'NONE' })






-- Optionally, set CursorLineNr to a custom color with transparent background
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#FF5555', bg = 'NONE', bold = true })  -- Red text, bold, no background

-- Enable terminal colors
vim.o.termguicolors = true






vim.g.UltiSnipsSnippetDirectories = {"UltiSnips"}
vim.g.UltiSnipsExpandTrigger = "<tab>"
vim.g.UltiSnipsJumpForwardTrigger = "<tab>"
vim.g.UltiSnipsJumpBackwardTrigger = "<s-tab>"



--vim.api.nvim_set_hl(0, 'Normal', { bg = 'NONE' })
--vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'NONE' })


vim.api.nvim_create_user_command('EE', function()
    local current_file = vim.fn.expand('%')
    local output_file = vim.fn.expand('%<') .. '.txt'
    local cmd = string.format("awk -F': ' '/^Q:/ {q=$2} /^A:/ {print q \";\" $2}' %s > %s", current_file, output_file)
    vim.fn.system(cmd)
end, {})


-- Return to last edit position when reopening files
vim.cmd([[
  augroup last_position
    autocmd!
    autocmd BufReadPost *
          \ if line("'\"") > 1 && line("'\"") <= line("$") |
          \   execute "normal! g`\"" |
          \ endif
  augroup END
]])

vim.api.nvim_create_user_command("DebugHighlights", function()
local highlights = vim.fn.execute("highlight")
print(highlights)
end, {})
vim.cmd([[highlight SpellBad cterm=underline ctermfg=red guifg=red]])
vim.opt.spell = true         -- Enables spell checking
vim.opt.spelllang = "en_us"  -- Sets the spell check language to US English


vim.api.nvim_set_keymap('n', '<Leader>rr', '<cmd>RnvimrToggle<CR>', { noremap = true, silent = true })



-- Mapping <leader>wd for save and go to dashboard
vim.api.nvim_set_keymap('n', '<leader>wd', ':w | Dashboard<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>qd', ':bd! | Dashboard<CR>', { noremap = true, silent = true })


-- keymaps.lua

local M = {}

function M.setup()

    -- Helper function to set keymaps
    local function map(mode, lhs, rhs, opts)
        local options = { noremap = true, silent = true }
        if opts then
            options = vim.tbl_extend("force", options, opts)
        end
        vim.api.nvim_set_keymap(mode, lhs, rhs, options)
    end

    -- General keymaps
    map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
    map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
    map("n", "<C-h>", "<C-w>h")
    map("n", "<C-j>", "<C-w>j")
    map("n", "<C-k>", "<C-w>k")
    map("n", "<C-l>", "<C-w>l")
    map("n", "<C-Up>", ":resize +2<CR>")
    map("n", "<C-Down>", ":resize -2<CR>")
    map("n", "<C-Left>", ":vertical resize -2<CR>")
    map("n", "<C-Right>", ":vertical resize +2<CR>")
    map("n", "<S-h>", ":bprevious<CR>")
    map("n", "<S-l>", ":bnext<CR>")
    map("n", "<leader>bb", "<cmd>e #<cr>")
    map("n", "<leader>`", "<cmd>e #<cr>")
    map("n", "<leader>bd", "<cmd>bdelete<cr>")
    map("n", "<leader>bD", "<cmd>bdelete!<cr>")
    map("n", "<Esc>", "<cmd>noh<cr>")
    map("n", "<leader>ur", "<cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>")

    -- Buffer Explorer
    map("n", "<leader>be", "<cmd>BufferExplorer<CR>", { desc = "Buffer Explorer" })

    -- NeoTree Explorer
    map("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "Explorer NeoTree (Root Dir)" })
    map("n", "<leader>E", "<cmd>Neotree toggle reveal_force_cwd<CR>", { desc = "Explorer NeoTree (cwd)" })
    map("n", "<leader>fe", "<cmd>Neotree toggle<CR>", { desc = "Explorer NeoTree (Root Dir)" })
    map("n", "<leader>fE", "<cmd>Neotree toggle reveal_force_cwd<CR>", { desc = "Explorer NeoTree (cwd)" })
    map("n", "<leader>ge", "<cmd>Neotree git_status<CR>", { desc = "Git Explorer" })


    
    -- Diagnostics keymaps
    map("n", "<leader>cd", "<cmd>lua vim.diagnostic.open_float()<CR>")
    map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
    map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")
    map("n", "[e", "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>")
    map("n", "]e", "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>")

    -- Toggle keymaps
    map("n", "<leader>uf", "<cmd>lua require('lazyvim.plugins.lsp.format').toggle()<CR>")
    map("n", "<leader>us", "<cmd>setlocal spell!<CR>")
    map("n", "<leader>uw", "<cmd>setlocal wrap!<CR>")
    map("n", "<leader>ul", "<cmd>setlocal list!<CR>")
    map("n", "<leader>ud", "<cmd>lua vim.diagnostic.disable()<CR>")

    -- Git keymaps
    map("n", "<leader>gg", "<cmd>lua require('lazygit').lazygit()<CR>")
    map("n", "<leader>gG", "<cmd>lua require('lazygit').lazygit_cwd()<CR>")

    -- Quit keymaps
    map("n", "<leader>qq", "<cmd>qa<CR>")

    -- Window keymaps
    map("n", "<leader>-", "<C-W>s")
    map("n", "<leader>|", "<C-W>v")
    map("n", "<leader>wd", "<C-W>c")

    -- Tab keymaps
    map("n", "<leader><tab>l", "<cmd>tablast<CR>")
    map("n", "<leader><tab>f", "<cmd>tabfirst<CR>")
    map("n", "<leader><tab><tab>", "<cmd>tabnew<CR>")
    map("n", "<leader><tab>]", "<cmd>tabnext<CR>")
    map("n", "<leader><tab>d", "<cmd>tabclose<CR>")
    map("n", "<leader><tab>[", "<cmd>tabprevious<CR>")

    -- Yanky keymaps
    map("n", "<leader>p", "<cmd>lua require('telescope').extensions.yank_history.yank_history()<CR>")
    map("x", "<leader>p", "<cmd>lua require('telescope').extensions.yank_history.yank_history()<CR>")
    map("n", "<p", "P")
    map("n", "<P", "P")
    map("n", "=p", "P")
    map("n", "=P", "P")
    map("n", ">p", "P")
    map("n", ">P", "P")
    map("n", "[p", "P")
    map("n", "[P", "P")
    map("n", "]p", "P")
    map("n", "]P", "P")
    map("n", "]y", "<cmd>YankyCycleBackward<CR>")
    map("n", "[y", "<cmd>YankyCycleForward<CR>")
    map("n", "gp", "p")
    map("n", "gP", "P")
    map("x", "gp", "p")
    map("x", "gP", "P")
    map("n", "p", "p")
    map("x", "p", "p")
    map("n", "P", "P")
    map("x", "P", "P")
    map("n", "y", "y")
    map("x", "y", "y")

     -- Telescope keymaps
    map("n", "<leader>,", "<cmd>Telescope buffers<CR>")
    map("n", "<leader>/", "<cmd>Telescope live_grep<CR>")
    map("n", "<leader>:", "<cmd>Telescope command_history<CR>")
    map("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
    map("n", "<leader>fc", "<cmd>Telescope find_files cwd=~/.config/nvim<CR>")
    map("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
    map("n", "<leader>fF", "<cmd>Telescope find_files cwd=%:p:h<CR>")
    map("n", "<leader>fg", "<cmd>Telescope git_files<CR>")
    map("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>")
    map("n", "<leader>fR", "<cmd>Telescope oldfiles cwd=%:p:h<CR>")
    map("n", "<leader>gc", "<cmd>Telescope git_commits<CR>")
    map("n", "<leader>gs", "<cmd>Telescope git_status<CR>")
    map("n", "<leader>s\"", "<cmd>Telescope registers<CR>")
    map("n", "<leader>sa", "<cmd>Telescope autocommands<CR>")
    map("n", "<leader>sb", "<cmd>Telescope buffers<CR>")
    map("n", "<leader>sc", "<cmd>Telescope command_history<CR>")
    map("n", "<leader>sC", "<cmd>Telescope commands<CR>")
    map("n", "<leader>sd", "<cmd>Telescope diagnostics<CR>")
    map("n", "<leader>sD", "<cmd>Telescope diagnostics<CR>")
    map("n", "<leader>sg", "<cmd>Telescope live_grep<CR>")
    map("n", "<leader>sG", "<cmd>Telescope live_grep cwd=%:p:h<CR>")
    map("n", "<leader>sh", "<cmd>Telescope help_tags<CR>")
    map("n", "<leader>sH", "<cmd>Telescope highlights<CR>")
    map("n", "<leader>sj", "<cmd>Telescope jumplist<CR>")
    map("n", "<leader>sk", "<cmd>Telescope keymaps<CR>")
    map("n", "<leader>sl", "<cmd>Telescope loclist<CR>")
    map("n", "<leader>sm", "<cmd>Telescope marks<CR>")
    map("n", "<leader>sM", "<cmd>Telescope man_pages<CR>")
    map("n", "<leader>so", "<cmd>Telescope vim_options<CR>")
    map("n", "<leader>sq", "<cmd>Telescope quickfix<CR>")
    map("n", "<leader>sR", "<cmd>Telescope resume<CR>")
    map("n", "<leader>ss", "<cmd>Telescope lsp_document_symbols<CR>")
    map("n", "<leader>sS", "<cmd>Telescope lsp_workspace_symbols<CR>")
    map("n", "<leader>sw", "<cmd>Telescope grep_string<CR>")
    map("n", "<leader>sW", "<cmd>Telescope grep_string cwd=%:p:h<CR>")
    map("v", "<leader>sw", "<cmd>Telescope grep_string<CR>")
    map("v", "<leader>sW", "<cmd>Telescope grep_string cwd=%:p:h<CR>")
    map("n", "<leader>uC", "<cmd>Telescope colorscheme<CR>")

    ----- v stuff----
map("n", "$", "v g_y")


end
return M

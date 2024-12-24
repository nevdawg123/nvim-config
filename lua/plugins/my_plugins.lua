return {
  {
    "lervag/vimtex",
    lazy = false, -- Ensure it's set to false so it's loaded immediately
    config = function()
      vim.g.vimtex_view_method = "skim"
      vim.g.vimtex_quickfix_mode = 2
      vim.g.vimtex_compiler_latexmk = {
        build_dir = ".",
        callback = 1,
        continuous = 1,
        executable = "latexmk",
        options = {
          "-verbose",
          "-file-line-error",
          "-synctex=1",
          "-interaction=nonstopmode",
          "-shell-escape",
        },
      }
      vim.g.vimtex_fold_enabled = 0
      vim.g.vimtex_syntax_enabled = 0
      vim.g.vimtex_indent_enabled = 0

      -- Ensure Skim is recognized and properly set up
      vim.g.vimtex_view_general_viewer = "/Applications/Skim.app/Contents/SharedSupport/displayline"
      vim.g.vimtex_view_general_options = "-r @line @pdf @tex"

      -- Add an autocommand to compile on write and open Skim
      vim.api.nvim_create_autocmd("BufWritePost", {
        pattern = "*.tex",
        callback = function()
          vim.cmd("VimtexCompile")
        end,
      })
	-- Filter out specific warnings from the quickfix list
      vim.g.vimtex_quickfix_ignore_filters = {
        'Package fancyhdr Warning: .*`E\' option without twoside option is useless',
      }
    end,
  },

{
  "kevinhwang91/rnvimr",
  config = function()
    vim.g.rnvimr_enable_ex = 1  -- Enable Ranger in `:RnvimrToggle`
    vim.g.rnvimr_enable_picker = 1  -- Allow selecting files from Ranger to edit in Neovim
    vim.g.rnvimr_draw_border = 1
    vim.g.rnvimr_hide_gitignore = 1
    vim.g.rnvimr_border_attr = { fg = 1, bg = -1 }
    vim.g.rnvimr_enable_bw = 1
    vim.g.rnvimr_shadow_winblend = 70
    vim.g.rnvimr_replace_netrw = 1
  end,
  cmd = { "RnvimrToggle", "RnvimrResize" }, -- Load rnvimr when these commands are called
},




{
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
},

{
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      local function center_dashboard_items()
        local lines = vim.fn.winheight(0)
        local padding = math.max(0, math.floor((lines - 10) / 2))
        return padding
      end

      require('dashboard').setup {
        theme = 'doom',
        config = {
          header = {},
          center = {
            {
              icon = '  ',
              desc = 'Find file',
              key = 'f',
              action = 'Telescope find_files',
            },
            {
              icon = '  ',
              desc = 'New file',
              key = 'n',
              action = 'enew',
            },
            {
              icon = '  ',
              desc = 'Recent files',
              key = 'r',
              action = 'Telescope oldfiles',
            },
            {
              icon = '  ',
              desc = 'Find text',
              key = 'g',
              action = 'Telescope live_grep',
            },

            {
              icon = '  ',
              desc = 'Config',
              key = 'c',
              action = 'Telescope find_files cwd=~/.config/nvim/ hidden=true no_ignore=true',
            },

            {
              icon = '  ',
              desc = 'Restore Session',
              key = 's',
              action = 'SessionLoad',
            },
            {
              icon = 'zZ  ',
              desc = 'Lazy',
              key = 'l',
              action = 'Lazy',
            },
            {
              icon = '  ',
              desc = 'Quit',
              key = 'q',
              action = 'q!',
            },
          },
          center_pad = center_dashboard_items(),
        },
        highlight = {
          desc = "DashboardCenter",
          highlight = "Normal",
          attributes = {
            gui = "bold",
            cterm = "bold",
            fg = "#FFFF00",
            size = 18,
          }
        }
      }
    end,
    dependencies = { {'nvim-tree/nvim-web-devicons'} }
  },













{
    "SirVer/ultisnips",
    config = function()
      vim.g.UltiSnipsExpandTrigger = "<tab>"
      vim.g.UltiSnipsJumpForwardTrigger = "<tab>"
      vim.g.UltiSnipsJumpBackwardTrigger = "<s-tab>"
      vim.g.UltiSnipsEditSplit = "vertical"
    end,
  },


{'jiangmiao/auto-pairs'},




  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    priority = 999,
    config = function()
      require("telescope").setup({
        -- Add any additional Telescope configuration here
      })
      require("telescope").load_extension("fzf")
    end,
  },

  {
    "folke/which-key.nvim",
     priority = 999,
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {}
  },

  -- LaTeX-related plugins
  { "KeitaNakamura/tex-conceal.vim", lazy = false },
  { "junegunn/vim-easy-align", lazy = false },  

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "latex", "bibtex" })
      end
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = { "kdheepak/cmp-latex-symbols" },
    opts = function(_, opts)
      opts = opts or {}
      opts.sources = opts.sources or {}
      table.insert(opts.sources, { name = "latex_symbols" })
      return opts
    end,
  },

  
 -- {
 --   "nvim-neo-tree/neo-tree.nvim",
  --  branch = "v3.x",
   -- dependencies = {
    --  "nvim-lua/plenary.nvim",
     -- "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      --"MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    --}
  --},

{
    "sainnhe/sonokai",
    config = function()
      vim.g.sonokai_style = "andromeda"
      vim.cmd[[colorscheme sonokai]]
    end,
  },

--{
 -- "folke/tokyonight.nvim",
  --config = funcion()
  --vim.cmd[[colorscheme tokyonight-]]
 -- opts = {},
--},


}




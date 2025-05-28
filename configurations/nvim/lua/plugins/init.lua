return {
  -- Git related plugins
  'tpope/vim-fugitive',
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',
  -- vscode snippets
  {
    'LunarVim/darkplus.nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'darkplus'
    end,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    -- config = function()
    --   vim.cmd.colorscheme 'catppuccin-mocha'
    -- end,
  },

  {
    'lambdalisue/suda.vim',
    cmd = 'SudaWrite',
  },
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { 'echasnovski/mini.icons', opts = {} } },
    vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' }),
  },
  { 'folke/flash.nvim', enabled = false },
  {
    'azorng/goose.nvim',
    branch = 'main',
    config = function()
      require('goose').setup {}
    end,
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          anti_conceal = { enabled = false },
        },
      },
    },
  },
  {
    'obsidian-nvim/obsidian.nvim',
    version = '*', -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = 'markdown',
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --   -- refer to `:h file-pattern` for more examples
    --   "BufReadPre path/to/my-vault/*.md",
    --   "BufNewFile path/to/my-vault/*.md",
    -- },
    dependencies = {
      -- Required.
      'nvim-lua/plenary.nvim',

      -- see below for full list of optional dependencies 👇
    },
    opts = {
      workspaces = {
        {
          name = 'personal',
          path = '~/development/notes',
        },
      },
    },
  },
}

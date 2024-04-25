return {
  -- Git related plugins
  'tpope/vim-fugitive',
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',
  -- vscode snippets
  {
    'rafamadriz/friendly-snippets',
    config = function()
      require('luasnip.loaders.from_vscode').lazy_load()
    end,
  },
  {
    'LunarVim/darkplus.nvim',
    -- priority = 1000,
    -- config = function()
    --   vim.cmd.colorscheme 'darkplus'
    -- end,
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
    'rebelot/kanagawa.nvim',
    name = 'kanagawa',
    config = function()
      vim.cmd.colorscheme 'kanagawa-wave'
    end,
  },

  {
    'lambdalisue/suda.vim',
    cmd = 'SudaWrite',
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-emoji',
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match '%s' == nil
      end

      local luasnip = require 'luasnip'
      local cmp = require 'cmp'

      opts.mapping = vim.tbl_extend('force', opts.mapping, {
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- they way you will only jump inside the snippet region
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      })
    end,
  },
  {
    'Zeioth/compiler.nvim',
    cmd = { 'CompilerOpen', 'CompilerToggleResults', 'CompilerRedo' },
    dependencies = { 'stevearc/overseer.nvim' },
    opts = {},
  },
  { -- The task runner we use
    'stevearc/overseer.nvim',
    commit = '400e762648b70397d0d315e5acaf0ff3597f2d8b',
    cmd = { 'CompilerOpen', 'CompilerToggleResults', 'CompilerRedo' },
    opts = {
      task_list = {
        direction = 'bottom',
        min_height = 25,
        max_height = 25,
        default_detail = 1,
      },
    },
  },
  {
    'stefandtw/quickfix-reflector.vim',
    config = function()
      vim.cmd 'let g:qf_modifiable = 1'
    end,
  },

  { 'folke/flash.nvim', enabled = false },
  { 'nvimdev/dashboard-nvim', enabled = false },
  { 'folke/noice.nvim', enabled = false },
  { 'rcarriga/nvim-notify', enabled = false },
}

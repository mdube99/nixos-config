return {
  -- Fuzzy Finder (files, lsp, etc)
  { 'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = {
    'nvim-lua/plenary.nvim',
  },

  config = function()
    local border_chars_none = { " ", " ", " ", " ", " ", " ", " ", " " }
    require('telescope').setup {
      defaults = {
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
          },
        },
        sort_mru = true,
        sorting_strategy = 'ascending',
        layout_config = {
          prompt_position = 'top'
        },
        borderchars = {
          prompt = border_chars_none,
          results = border_chars_none,
          preview = border_chars_none
        },
        border = true,
        prompt_prefix = '   ',
        hl_result_eol = true,
        results_title = "",
        winblend = 0,
        wrap_results = true
      },
      extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "smart_case", -- or "ignore_case" or "respect_case"
        },
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({
            previewer        = false,
            initial_mode     = "normal",
            sorting_strategy = 'ascending',
            layout_strategy  = 'horizontal',
            layout_config    = {
              horizontal = {
                width = 0.5,
                height = 0.4,
                preview_width = 0.6,
              },
            },
          })
        },
      },
    }
  end,
  }
}

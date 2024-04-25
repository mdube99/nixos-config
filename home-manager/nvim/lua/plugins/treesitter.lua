return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  config = function()
    pcall(require('nvim-treesitter.install').update { with_sync = true })
    require('nvim-treesitter.configs').setup {
      -- Add languages to be installed here that you want installed for treesitter
      ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'yaml', 'typescript', 'vimdoc', 'vim', 'terraform', 'hcl', 'bash', 'nix' },

      -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
      auto_install = false,

      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<c-space>',
          node_incremental = '<c-space>',
          scope_incremental = '<c-s>',
          node_decremental = '<M-space>',
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ['aa'] = '@parameter.outer',
            ['ia'] = '@parameter.inner',
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
          },
        },
      },
    }
    -- malleable c2 profile, courtesy of Henkru
    -- :TSInstall malleable_c2
    -- require('nvim-treesitter.parsers').get_parser_configs().malleable_c2 = {
    -- }
    local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
    parser_config.malleable_c2 = {
      install_info = {
        url = 'https://github.com/Henkru/tree-sitter-malleable-c2',
        files = { 'src/parser.c' },
        branch = 'main',
        generate_requires_npm = false,
        requires_generate_from_grammar = false,
      },
      filetype = 'malleable_c2',
    }
    parser_config.jinja2 = {
      install_info = {
        url = 'https://github.com/dbt-labs/tree-sitter-jinja2',
        files = { 'src/parser.c' },
        branch = 'main',
        generate_requires_npm = false,
        requires_generate_from_grammar = false,
      },
      filetype = 'j2',
    }
  end,
}

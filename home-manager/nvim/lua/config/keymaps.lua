vim.keymap.del('n', '<S-h>')
vim.keymap.del('n', '<S-l>')

vim.keymap.set('n', 'z.', ':<C-u>normal! zszH<CR>', { silent = true })

function QuickFixToggle()
  if vim.tbl_isempty(vim.fn.filter(vim.fn.getwininfo(), function(_, wininfo)
    return wininfo.quickfix
  end)) then
    vim.cmd 'copen'
  else
    vim.cmd 'cclose'
  end
end

vim.keymap.set('n', '<C-q>', '<cmd>lua QuickFixToggle()<CR>')
vim.keymap.set('n', '<Tab>', '<cmd>bn<CR>')
vim.keymap.set('n', '<S-Tab>', '<cmd>bp<CR>')
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)
vim.keymap.set('n', '<leader>fw', '<cmd>Telescope live_grep<CR>')

local builtin = require 'telescope.builtin'
vim.keymap.set('n', '<leader>pws', function()
  local word = vim.fn.expand '<cword>'
  builtin.grep_string { search = word }
end)
vim.keymap.set('n', '<leader>pWs', function()
  local word = vim.fn.expand '<cWORD>'
  builtin.grep_string { search = word }
end)
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string { search = vim.fn.input 'Grep > ' }
end)

local nvim_tmux_nav = require 'nvim-tmux-navigation'
vim.keymap.set('n', '<C-h>', nvim_tmux_nav.NvimTmuxNavigateLeft)
vim.keymap.set('n', '<C-j>', nvim_tmux_nav.NvimTmuxNavigateDown)
vim.keymap.set('n', '<C-k>', nvim_tmux_nav.NvimTmuxNavigateUp)
vim.keymap.set('n', '<C-l>', nvim_tmux_nav.NvimTmuxNavigateRight)
vim.keymap.set('n', '<C-\\>', nvim_tmux_nav.NvimTmuxNavigateLastActive)
vim.keymap.set('n', '<C-Space>', nvim_tmux_nav.NvimTmuxNavigateNext)

-- terminal
vim.keymap.set('n', '<leader>tf', '<cmd>ToggleTerm direction=float<cr>', { desc = 'Float' })
vim.keymap.set('n', '<leader>th', '<cmd>ToggleTerm size=15 direction=horizontal<cr>', { desc = 'Horizontal' })
vim.keymap.set('n', '<leader>tv', '<cmd>ToggleTerm size=50 direction=vertical<cr>', { desc = 'Vertical' })
vim.keymap.set({ 'n', 't' }, '<leader>tt', '<cmd>ToggleTerm<cr>', { desc = 'Toggle' })

-- helix like g-prefixed maps
vim.keymap.set('n', 'gh', '0', { desc = 'Goto line start' })
vim.keymap.set('n', 'gl', '$', { desc = 'Goto line end' })
vim.keymap.set('n', 'gs', '^', { desc = 'Goto first non-whitespace character' })

vim.keymap.set('n', 'U', '<C-r>', { desc = 'Redo' })

-- better up/down
vim.keymap.set({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- mappings for compiler.nvim - specifically for C/asm compiling
-- Open compiler
vim.api.nvim_set_keymap('n', '<F5>', '<cmd>CompilerOpen<cr>', { noremap = true, silent = true })

-- Redo last selected option
vim.api.nvim_set_keymap(
  'n',
  '<S-F5>',
  '<cmd>CompilerStop<cr>' -- (Optional, to dispose all tasks before redo)
    .. '<cmd>CompilerRedo<cr>',
  { noremap = true, silent = true }
)

-- Toggle compiler results
vim.api.nvim_set_keymap('n', '<S-F6>', '<cmd>CompilerToggleResults<cr>', { noremap = true, silent = true })

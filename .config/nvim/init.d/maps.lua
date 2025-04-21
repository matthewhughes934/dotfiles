vim.keymap.set('n', 'ma', vim.diagnostic.goto_prev)

function hasLSP(bufnr)
  return #vim.lsp.get_clients({ bufnr = 0 }) > 0
end

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Telescope find files' })

function lookupLSPOrTags()
  if hasLSP() then
    builtin.lsp_document_symbols()
  else
    builtin.current_buffer_tags({results_width=100})
  end
end

vim.keymap.set('n', '<C-n>', lookupLSPOrTags, { desc = 'Document Symbols' })

-- maps for <C-n> completion
for event, rhs in pairs({
  BufEnter  = "<C-n>",      -- default: completion
  LspAttach = "<C-x><C-o>", -- if LSP: use omnifunc magic
  LspDetach = "<C-n>",      -- if no more LSP: back to default
}) do
  vim.api.nvim_create_autocmd(event, {
    callback = function(args)
      local buf = args.buf
      vim.keymap.set("i", "<C-n>", rhs, {
        buffer = buf,
        noremap = true,
        silent = true,
      })
    end,
  })
end

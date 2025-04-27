vim.keymap.set('n', 'ma', vim.diagnostic.goto_prev)

function hasLSP(bufnr)
  if bufnr == nil then
    bufnr = vim.api.nvim_get_current_buf()
  end
  return #vim.lsp.get_clients({ bufnr = bufnr }) > 0
end

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Telescope find files' })

function listSymbols()
  if hasLSP() then
    builtin.lsp_document_symbols()
  else
    builtin.current_buffer_tags({results_width=100})
  end
end
vim.keymap.set('n', '<C-n>', listSymbols, { desc = 'Document Symbols' })

function lookupSymbol()
  if hasLSP() then
    vim.lsp.buf.definition()
  else
    vim.cmd('execute "tjump " . expand("<cword>")')
  end
end
vim.keymap.set('n', '<C-]>', lookupSymbol, { desc = 'Lookup the symbol under the cursor' })

-- maps for <C-n> completion
vim.api.nvim_create_autocmd(
    "BufEnter",
    {
        callback = function(args)
            if hasLSP(args.buf) then
                rhs = "<C-x><C-o>"
            else
                rhs = "<C-n>"
            end
            vim.keymap.set("i", "<C-n>", rhs, {
                buffer = buf,
                noremap = true,
                silent = true,
            })
        end
    }
)

for event, rhs in pairs({
  LspAttach = "<C-x><C-o>",
  LspDetach = "<C-n>",
}) do
  vim.api.nvim_create_autocmd(event, {
    callback = function(args)
      vim.keymap.set("i", "<C-n>", rhs, {
        buffer = args.buf,
        noremap = true,
        silent = true,
      })
    end,
  })
end

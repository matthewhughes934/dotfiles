vim.keymap.set('n', 'ma', vim.diagnostic.goto_prev)

function hasLSP(bufnr)
  if bufnr == nil then
    bufnr = vim.api.nvim_get_current_buf()
  end
  return #vim.lsp.get_clients({ bufnr = bufnr }) > 0
end

function isInGitRepo()
    vim.fn.system("git rev-parse --is-inside-work-tree")
    return vim.v.shell_error == 0
end

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

-- maps for <C-p> completion
vim.api.nvim_create_autocmd(
    "BufEnter",
    {
        callback = function(args)
            if isInGitRepo() then
                rhs = fzfLua.git_files
            else
                rhs = fzfLua.files
            end
            vim.keymap.set("i", "<C-p>", rhs, {
                buffer = args.buf,
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

fzfLua = require('fzf-lua')
fzfLua.setup(
    -- disable fancy unicode symbols
    {
        file_icons = false,
        lsp = {
            symbols = {
                symbol_style = false
            },
        },
    }
)
vim.keymap.set('n', '<C-p>', fzfLua.files, { desc = 'fzf find files' })

function fuzzyListSymbols()
  if hasLSP() then
      fzfLua.lsp_document_symbols()
  else
      fzfLua.btags()
  end
end
vim.keymap.set('n', '<C-n>', fuzzyListSymbols, { desc = 'list buffer symbols' })

-- needs: https://pkg.go.dev/golang.org/x/tools/gopls
vim.lsp.enable('gopls')

-- clangd: included in system 'clang' install
vim.lsp.enable('clangd')
vim.lsp.config('clangd', {
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "hpp" },
})

-- needs: https://github.com/rust-lang/rust-analyzer
vim.lsp.enable('rust_analyzer')
vim.lsp.config('rust_analyzer', {
    settings = {
        ['rust-analyzer'] = {
            checkOnSave = {
                command = 'clippy',
            },
        },
    },
})

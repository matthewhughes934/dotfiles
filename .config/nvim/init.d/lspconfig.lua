-- needs: https://pkg.go.dev/golang.org/x/tools/gopls
require'lspconfig'.gopls.setup{}

-- clangd: included in system 'clang' install
require'lspconfig'.clangd.setup{
    -- disable for .proto files
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "hpp" }
}

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

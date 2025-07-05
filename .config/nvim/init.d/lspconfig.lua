-- needs: https://pkg.go.dev/golang.org/x/tools/gopls
require'lspconfig'.gopls.setup{}

-- clangd: included in system 'clang' install
require'lspconfig'.clangd.setup{
    -- disable for .proto files
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "hpp" }
}

-- needs: https://github.com/rust-lang/rust-analyzer
require'lspconfig'.rust_analyzer.setup{}

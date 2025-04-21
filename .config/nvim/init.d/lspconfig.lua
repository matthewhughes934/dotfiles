-- needs: https://pkg.go.dev/golang.org/x/tools/gopls
require'lspconfig'.gopls.setup{}

-- clangd: included in system 'clang' install
require'lspconfig'.clangd.setup{}

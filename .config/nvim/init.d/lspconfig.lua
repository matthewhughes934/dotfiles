-- needs: https://pkg.go.dev/golang.org/x/tools/gopls
vim.lsp.enable('gopls')

-- clangd: included in system 'clang' install
vim.lsp.enable('clangd')
vim.lsp.config('clangd', {
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "hpp" },
})

-- needs: https://github.com/rust-lang/rust-analyzer
function rust_sysroot()
    local cmd = { "rustc", "--print", "sysroot" }
    local output = vim.system(cmd, { text = true }):wait()

    if output.code ~= 0 then
        vim.notify(('[rust_analzyer] cmd failed with code %d: %s\n%s"'):format(output.code, cmd, output.stderr))
    end
    return vim.trim(output.stdout)
end

vim.lsp.enable('rust_analyzer')
vim.lsp.config('rust_analyzer', {
    cmd = { (rust_sysroot() .. "/bin" .. "/rust-analyzer") },
    settings = {
        ['rust-analyzer'] = {
            checkOnSave = {
                command = 'clippy',
            },
            rustc = { source = 'discover' },
        },
    },
})

require("luasnip.loaders.from_snipmate").lazy_load()

local ls = require("luasnip")

vim.keymap.set(
    {"i"},
    "<Tab>",
    function()
        if ls.expandable() then
            ls.expand()
        else
            tab = vim.api.nvim_replace_termcodes("<Tab>", true, false, true)
            vim.api.nvim_feedkeys(tab, "n", false )
        end
    end,
    {silent = true }
)

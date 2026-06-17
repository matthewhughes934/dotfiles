vim.filetype.add {
    pattern = {
        ['.*'] = {
            -- if we've not yet detected any file type, try and infer it
            -- from 'linguist-language' git attribute, see
            --https://github.com/github-linguist/linguist/blob/50bf308a08da29f923774ed161530258e4949564/docs/overrides.md#using-gitattributes
            function(path, bufnr)
                if not vim.system({"git", "rev-parse", "--is-inside-work-tree" }):wait().code == 0 then
                    return
                end

                local output = vim.system(
                    { "git", "check-attr", "-z", "linguist-language",  path },
                    { text = true }
                ):wait()

                if output.code ~= 0 then
                    return
                end

                local _, _, attr_value = string.match(output.stdout, "([^%z]+)%z([^%z]+)%z([^%z]+)%z")
                if attr_value == "unspecified" then
                    return
                else
                    return string.lower(attr_value)
                end
            end,
            { priority = -math.huge },
        },
    },
}

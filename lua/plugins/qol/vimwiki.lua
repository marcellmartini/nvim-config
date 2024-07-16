return {
    "vimwiki/vimwiki",
    init = function()
        vim.g.vimwiki_list = {
            {
                path = "~/.config/vimwiki",
                syntax = "default",
                ext = ".wiki",
            },
        }
    end,
}

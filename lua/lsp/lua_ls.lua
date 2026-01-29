vim.lsp.config("lua_ls", {
    filetypes = { "lua" },
    root_markers = {
        ".luarc.json",
        ".luarc.jsonc",
        ".luacheckrc",
        ".stylua.toml",
        "stylua.toml",
        "selene.toml",
        "selene.yml",
        ".git",
    },
    settings = {
        Lua = {
            runtime = { version = "LuaJIT" },
            workspace = {
                checkThirdParty = false,
                library = { vim.env.VIMRUNTIME },
            },
            telemetry = { enable = false },
            format = {
                enable = false,
                defaultConfig = {
                    indent_style = "space",
                    indent_size = "4",
                },
            },
            completion = { callSnippet = "Replace" },
        },
    },
})

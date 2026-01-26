return {
    -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSInstall bash c go gomod gosum json lua markdown markdown_inline query terraform vim vimdoc yaml",
    dependencies = {
        {
            "nvim-treesitter/nvim-treesitter-textobjects",
            branch = "main",
        },
        "nvim-treesitter/nvim-treesitter-context",
    },
    config = function()
        -- Install heavy parsers asynchronously (Python grammar is very large)
        for _, lang in ipairs({ "python" }) do
            local ok = pcall(vim.treesitter.language.inspect, lang)
            if not ok then
                require("nvim-treesitter").install({ lang })
            end
        end

        -- Track which languages we've already checked this session
        local checked_langs = {}

        vim.api.nvim_create_autocmd("FileType", {
            callback = function(event)
                local lang = vim.treesitter.language.get_lang(event.match)
                if not lang then return end

                -- Skip if already checked this session
                if checked_langs[lang] then
                    if vim.treesitter.get_parser(event.buf, nil, { error = false }) then
                        vim.treesitter.start(event.buf)
                        vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                    end
                    return
                end
                checked_langs[lang] = true

                -- Check if parser is installed, if not install it
                local ok = pcall(vim.treesitter.language.inspect, lang)
                if not ok then
                    local available = require("nvim-treesitter.parsers")
                    if available[lang] then
                        require("nvim-treesitter").install({ lang })
                    end
                end

                -- Enable highlighting if parser is available
                if vim.treesitter.get_parser(event.buf, nil, { error = false }) then
                    vim.treesitter.start(event.buf)
                    vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end
            end,
        })

        -- Re-enable highlighting after parser installation
        vim.api.nvim_create_autocmd("User", {
            pattern = "TSUpdate",
            callback = function()
                local buf = vim.api.nvim_get_current_buf()
                if vim.treesitter.get_parser(buf, nil, { error = false }) then
                    vim.treesitter.start(buf)
                    vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end
            end,
        })

        -- Textobjects configuration
        require("nvim-treesitter-textobjects").setup({
            select = {
                lookahead = true,
                keymaps = {
                    ["aa"] = "@parameter.outer",
                    ["ia"] = "@parameter.inner",
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@class.outer",
                    ["ic"] = "@class.inner",
                },
            },
            move = {
                set_jumps = true,
                goto_next_start = {
                    ["]m"] = "@function.outer",
                    ["]]"] = "@class.outer",
                },
                goto_next_end = {
                    ["]M"] = "@function.outer",
                    ["]["] = "@class.outer",
                },
                goto_previous_start = {
                    ["[m"] = "@function.outer",
                    ["[["] = "@class.outer",
                },
                goto_previous_end = {
                    ["[M"] = "@function.outer",
                    ["[]"] = "@class.outer",
                },
            },
            swap = {
                swap_next = {
                    ["<leader>a"] = "@parameter.inner",
                },
                swap_previous = {
                    ["<leader>A"] = "@parameter.inner",
                },
            },
        })
    end,
}

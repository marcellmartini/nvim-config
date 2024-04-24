return {
    -- Set lualine as statusline
    "nvim-lualine/lualine.nvim",
    -- See `:help lualine.txt`
    -- Example how to pass options to require("lualine").setup()
    -- opts = {
    --     options = {
    --         icons_enabled = true,
    --         theme = "catppuccin",
    --         component_separators = { left = "\\", right = "/" },
    --         section_separators = { left = "", right = "" },
    --         globalstatus = true,
    --     },
    --     refresh = {
    --         statusline = 350,
    --     },
    -- },
    config = function()
        --- Eviline config for lualine
        -- Author: shadmansaleh
        -- Credit: glepnir
        local lualine = require("lualine")

        -- Config
        local config = {
            options = {
                icons_enabled = true,
                theme = "catppuccin",
                component_separators = { left = "\\", right = "/" },
                section_separators = { left = "", right = "" },
                globalstatus = true,
            },
            sections = {
                -- These will be filled later
                lualine_c = {},
            },
        }

        -- Inserts a component in lualine_c at left section
        local function ins_left(component)
            table.insert(config.sections.lualine_c, component)
        end

        -- Inserts a component in lualine_x at right section
        -- local function ins_right(component)
        --     table.insert(config.sections.lualine_x, component)
        -- end

        ins_left({
            "filename",
            path = 4,
            separator = "",
        })

        -- Insert mid section. You can make any number of sections in neovim :)
        -- for lualine it's any number greater then 2
        ins_left({
            separator = "",
            function()
                return "%="
            end,
        })

        ins_left({
            -- Lsp server name
            function()
                local msg = "None"
                local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
                local clients = vim.lsp.get_active_clients()
                if next(clients) == nil then
                    return msg
                end

                local c = {}
                for _, client in ipairs(clients) do
                    local filetypes = client.config.filetypes
                    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                        table.insert(c, client.name)
                    end
                end

                if c ~= nil then
                    return table.concat(c, " - ")
                end
                return msg
            end,
            icon = " LSP:",
        })

        -- Now don't forget to initialize lualine
        lualine.setup(config)
    end,
}

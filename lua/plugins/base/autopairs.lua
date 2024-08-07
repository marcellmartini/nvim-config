return {
    "windwp/nvim-autopairs",
    event = { "InsertEnter" },
    -- Optional dependency
    dependencies = { "hrsh7th/nvim-cmp" },
    config = function()
        require("nvim-autopairs").setup({
            ignored_next_char = "[%w%.]", -- will ignore alphanumeric and `.` symbol
            enable_check_bracket_line = false,
        })

        -- If you want to automatically add `(` after selecting a function or method
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        local cmp = require("cmp")
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
}

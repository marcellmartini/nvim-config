return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    dependencies = {
        "echasnovski/mini.icons",
    },
    opts = {},
    config = function()
        -- document existing key chains
        require("which-key").add({
            { "<leader>c", group = "[C]ode" },
            { "<leader>d", group = "[D]ocument" },
            { "<leader>g", group = "[G]it" },
            { "<leader>h", group = "Git [H]unk" },
            { "<leader>r", group = "[R]ename" },
            { "<leader>s", group = "[S]earch" },
            { "<leader>t", group = "[T]oggle" },
            { "<leader>w", group = "[W]orkspace" },

            -- register which-key VISUAL mode
            -- required for visual <leader>hs (hunk stage) to work
            { "<leader>", group = "VISUAL <leader>", mode = "v" },
            { "<leader>h", desc = "Git [H]unk", mode = "v" },
        })
    end,
}

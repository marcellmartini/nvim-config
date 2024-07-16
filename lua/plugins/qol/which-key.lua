return {
    "folke/which-key.nvim",
    -- dependencies = {
    --     "echasnovski/mini.icons"
    -- },
    opts = {},
    config = function()
        -- document existing key chains
        require("which-key").add({
            { "<leader>c",  group = "[C]ode" },
            { "<leader>c_", hidden = true },
            { "<leader>d",  group = "[D]ocument" },
            { "<leader>d_", hidden = true },
            { "<leader>g",  group = "[G]it" },
            { "<leader>g_", hidden = true },
            { "<leader>h",  group = "Git [H]unk" },
            { "<leader>h_", hidden = true },
            { "<leader>r",  group = "[R]ename" },
            { "<leader>r_", hidden = true },
            { "<leader>s",  group = "[S]earch" },
            { "<leader>s_", hidden = true },
            { "<leader>t",  group = "[T]oggle" },
            { "<leader>t_", hidden = true },
            { "<leader>w",  group = "[W]orkspace" },
            { "<leader>w_", hidden = true },

            -- ["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
            -- ["<leader>d"] = { name = "[D]ocument", _ = "which_key_ignore" },
            -- ["<leader>g"] = { name = "[G]it", _ = "which_key_ignore" },
            -- ["<leader>h"] = { name = "Git [H]unk", _ = "which_key_ignore" },
            -- ["<leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },
            -- ["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
            -- ["<leader>t"] = { name = "[T]oggle", _ = "which_key_ignore" },
            -- ["<leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },
        })
        -- register which-key VISUAL mode
        -- required for visual <leader>hs (hunk stage) to work
        require("which-key").add({
            { "<leader>",  group = "VISUAL <leader>", mode = "v" },
            { "<leader>h", desc = "Git [H]unk",       mode = "v" },
        })
        --     ["<leader>"] = { name = "VISUAL <leader>" },
        --     ["<leader>h"] = { "Git [H]unk" },
        -- }, { mode = "v" })
    end,
}

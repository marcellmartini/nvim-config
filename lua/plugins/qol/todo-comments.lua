return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = function()
        local todo = require("todo-comments")

        Map("n", "]t", todo.jump_next, { desc = "Next todo comment" })
        Map("n", "[t", todo.jump_prev, { desc = "Preview todo comment" })
        Map("n", "<leader>te", "<CMD>TodoTelescope<CR>", { desc = "Preview todo list (Telescope)" })
    end,
}

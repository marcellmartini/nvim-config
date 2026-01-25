return {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    config = function()
        -- Move with hjkl
        Map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "Navigate Left" })
        Map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "Navigate Right" })
        Map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "Navigate Down" })
        Map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "Navigate Up" })
    end,
}

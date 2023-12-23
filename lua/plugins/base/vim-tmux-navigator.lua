return {
    'christoomey/vim-tmux-navigator',
    lazy = false,
    config = function()
        -- Move with hjkl
        Map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "Navegate Left" })
        Map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "Navegate Right" })
        Map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "Navegate Down" })
        Map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "Navegate Up" })
    end
}

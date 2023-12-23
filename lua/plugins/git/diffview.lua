return {
    'sindrets/diffview.nvim',
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function ()
        Map('n', '<leader>do', '<cmd>DiffviewOpen<CR>', { desc = '[D]iffview [O]pen'})
        Map('n', '<leader>dc', '<cmd>DiffviewClose<CR>', { desc = '[D]iffview [C]close'})
        Map('n', '<leader>dh', '<cmd>DiffviewFileHistory<CR>', { desc = '[D]iffview File[H]istory'})
    end
}

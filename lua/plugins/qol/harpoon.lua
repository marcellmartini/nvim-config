return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")

        Map("n", "<A-a>", function()
            harpoon:list():add()
        end, { desc = "Add to harpoon" })
        Map("n", "<A-e>", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end, { desc = "Open harpoon window" })

        Map("n", "<A-j>", function()
            harpoon:list():select(1)
        end, { desc = "Switch to selected 1" })
        Map("n", "<A-k>", function()
            harpoon:list():select(2)
        end, { desc = "Switch to selected 2" })
        Map("n", "<A-l>", function()
            harpoon:list():select(3)
        end, { desc = "Switch to selected 3" })
        Map("n", "<A-;>", function()
            harpoon:list():select(4)
        end, { desc = "Switch to selected 4" })
        Map("n", "<A-h>", function()
            harpoon:list():select(5)
        end, { desc = "Switch to selected 5" })
    end,
}

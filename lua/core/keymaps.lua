return {
    -- [[ Basic Keymaps ]]

    -- Keymaps for better default experience
    -- See `:help Map()`
    -- Map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true }),

    -- Quit all
    Map("n", "<leader>wq", "<cmd>wqa<CR>", { desc = "[S]ave and [Q]uit" }),
    Map("n", "<leader>qq", "<cmd>qa<CR>", { desc = "[Q]uit" }),

    -- Save all
    Map("n", "<C-s>", "<cmd>w<CR>", { desc = "Save" }),

    -- Remap for dealing with word wrap
    Map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true }),
    Map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true }),

    -- Diagnostic keymaps
    Map("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" }),
    Map("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" }),
    Map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" }),
    Map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" }),

    -- Resie with arrow keys
    Map("n", "<C-Up>", ":resize -2<CR>"),
    Map("n", "<C-Down>", ":resize +2<CR>"),
    Map("n", "<C-Left>", ":vertical resize -2<CR>"),
    Map("n", "<C-Right>", ":vertical resize +2<CR>"),

    -- Move texts
    Map("v", "K", ":m '<-2<CR>gv=gv"),
    Map("v", "J", ":m '>+1<CR>gv=gv"),
    Map("v", "<", "<gv"),
    Map("v", ">", ">gv"),

    -- Move between tabs
    Map("n", "<TAB>", ":tabNex<CR>", { desc = "[N]ext [T]ab" }),
    Map("n", "<S-TAB>", ":tabp<CR>", { desc = "[P]revious [T]ab" }),
    Map("n", "<leader>tn", ":tabnew<CR>", { desc = "[T]ab [N]ew" }),
    Map("n", "<leader>tf", ":tabnew %<CR>", { desc = "[T]ab [N]ew" }),
    Map("n", "<leader>tx", ":tabclose<CR>", { desc = "[T]ab [C]lose" }),

    -- window management
    Map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }), -- split window vertically
    Map("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }), -- split window horizontally
    Map("n", "<leader>se", "<C-w>=", { desc = "Split windows equal size" }), -- make split windows equal width & height
    Map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Split windows Close" }), -- close current split window

    -- others
    Map("n", "J", "mzJ`z"),
    Map("n", "<C-o>", "<C-o>zz"),
    Map("n", "<C-d>", "<C-d>zz"),
    Map("n", "<C-u>", "<C-u>zz"),
    Map("n", "#", "#zz"),
    Map("n", "*", "*zz"),
    Map("n", "n", "nzzzv"),
    Map("n", "N", "Nzzzv"),

    Map("i", "<C-c>", "<ESC>"),
}

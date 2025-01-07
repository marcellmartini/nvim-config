-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help Map()`
Map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Quit all
Map("n", "<leader>wq", "<cmd>wqa<CR>", { desc = "[S]ave and [Q]uit" })
Map("n", "<leader>qq", "<cmd>qa<CR>", { desc = "[Q]uit" })

-- Save all
Map("n", "<C-s>", "<cmd>w<CR>", { desc = "Save" })

-- Remap for dealing with word wrap
Map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
Map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
Map("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
Map("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
-- Map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
-- Map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Resie with arrow keys
Map("n", "<C-Up>", ":resize -2<CR>")
Map("n", "<C-Down>", ":resize +2<CR>")
Map("n", "<C-Left>", ":vertical resize -2<CR>")
Map("n", "<C-Right>", ":vertical resize +2<CR>")

-- Move texts
Map("v", "K", ":m '<-2<CR>gv=gv")
Map("v", "J", ":m '>+1<CR>gv=gv")
Map("v", "<", "<gv")
Map("v", ">", ">gv")

-- Move between tabs
Map("n", "<TAB>", ":tabnex<CR>", { desc = "[N]ext Tab" })
Map("n", "<S-TAB>", ":tabprevious<CR>", { desc = "[P]revious Tab" })
Map("n", "<leader>tn", ":tabnew<CR>", { desc = "Tab [N]ew" })
Map("n", "<leader>tf", ":tabnew %<CR>", { desc = "Tab [N]ew" })
Map("n", "<leader>tx", ":tabclose<CR>", { desc = "Tab [C]lose" })

-- window management
Map("n", "<leader>pv", "<C-w>v", { desc = "[S]plit window [V]ertically" }) -- split window vertically
Map("n", "<leader>ph", "<C-w>s", { desc = "[S]plit window [H]orizontally" }) -- split window horizontally
Map("n", "<leader>pe", "<C-w>=", { desc = "[S]plit windows [E]qual size" }) -- make split windows equal width & height
Map("n", "<leader>px", "<cmd>close<CR>", { desc = "[S]plit e[X]it Rab" }) -- close current split window

-- others
Map("n", "J", "mzJ`z")
Map("n", "<C-o>", "<C-o>zz")
Map("n", "<C-d>", "<C-d>zz")
Map("n", "<C-u>", "<C-u>zz")
Map("n", "<C-f>", "<C-f>zz")
Map("n", "<C-b>", "<C-b>zz")
Map("n", "#", "#zz")
Map("n", "*", "*zz")
Map("n", "n", "nzzzv")
Map("n", "N", "Nzzzv")

Map("i", "<C-c>", "<ESC>")

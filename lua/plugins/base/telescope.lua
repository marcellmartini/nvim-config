return {
    -- Fuzzy Finder (files, lsp, etc)
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        -- Fuzzy Finder Algorithm which requires local dependencies to be built.
        -- Only load if `make` is available. Make sure you have the system
        -- requirements installed.
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            -- NOTE: If you are having trouble with this installation,
            --       refer to the README for telescope-fzf-native for more instructions.
            build = "make",
            cond = function()
                return vim.fn.executable("make") == 1
            end,
        },
        { "nvim-telescope/telescope-ui-select.nvim" },

        -- Useful for getting pretty icons, but requires a Nerd Font.
        { "nvim-tree/nvim-web-devicons" },
        {
            "cuducos/yaml.nvim",
            dependencies = {
                "nvim-treesitter/nvim-treesitter",
                "nvim-telescope/telescope.nvim", -- optional
            },
            config = function()
                require("yaml_nvim").setup({
                    ft = { "yaml" }, -- optional
                    Map("n", "<leader>sy", ":YAMLTelescope<CR>", { desc = "[S]earch in [Y]aml Files" }),
                })
            end,
        },
    },
    config = function()
        require("telescope").setup({
            -- [[ Configure Telescope ]]
            -- See `:help telescope` and `:help telescope.setup()`
            defaults = {
                path_display = { "smart" },
                --     mappings = {
                --         i = {
                --             ["<C-u>"] = false,
                --             ["<C-d>"] = false,
                --         },
                --     },
            },
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown(),
                },
            },
        })

        -- Enable telescope fzf native, if installed
        pcall(require("telescope").load_extension, "fzf")
        pcall(require("telescope").load_extension, "ui-select")

        -- See `:help telescope.builtin`
        local builtin = require("telescope.builtin")
        Map("n", "<leader>?", builtin.oldfiles, { desc = "[?] Find recently opened files" })
        Map("n", "<leader><space>", builtin.buffers, { desc = "[ ] Find existing buffers" })
        Map("n", "<leader>/", function()
            -- You can pass additional configuration to telescope to change theme, layout, etc.
            builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                winblend = 10,
                previewer = false,
            }))
        end, { desc = "[/] Fuzzily search in current buffer" })

        local function telescope_live_grep_open_files()
            builtin.live_grep({
                grep_open_files = true,
                prompt_title = "Live Grep in Open Files",
            })
        end
        Map("n", "<leader>s/", telescope_live_grep_open_files, { desc = "[S]earch [/] in Open Files" })
        Map("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
        Map("n", "<leader>sG", builtin.git_files, { desc = "[S]earch [G]it Files" })
        Map("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
        -- Map("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
        Map("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
        Map("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
        Map("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
        Map("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })

        Map(
            "n",
            "<leader>sa",
            "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>",
            { desc = "[S]earch [A]ll" }
        )
        Map("n", "<leader>sb", "<cmd> Telescope buffers <CR>", { desc = "[S]earch [B]uffers" })
        Map("n", "<leader>so", "<cmd> Telescope oldfiles <CR>", { desc = "[S]earch [O]ldfiles" })
        Map("n", "<leader>sC", "<cmd> Telescope colorscheme <CR>", { desc = "[S]earch [C]olorscheme" })
        Map("n", "<leader>sc", "<cmd> Telescope git_commits <CR>", { desc = "[S]earch Git [C]commits" })
    end,
}

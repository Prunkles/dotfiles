
return {

    {
        'catppuccin/nvim', name = 'catppuccin', priority = 1000,
        config = function ()
            vim.cmd.colorscheme('catppuccin-mocha')
        end
    },

    -- Useful plugin to show you pending keybinds
    { 'folke/which-key.nvim', opts = {}, },

    {
        'christoomey/vim-tmux-navigator',
        lazy = false,
    },

    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        config = function(_)
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
            vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Search [G]it [F]iles' })
        end
    },

    {
        -- Detect tabstop and shiftwidth automatically
        'tpope/vim-sleuth',
    },

    {
        -- Set lualine as statusline
        'nvim-lualine/lualine.nvim',
        opts = {
            sections = {
                lualine_c = {
                    {
                        'filename',
                        path = 1,
                    },
                },
            },
        },

    },

    {
        -- Add indentation guides even on blank lines
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        opts = {},
    },

    -- 'gc' to comment visual regions/lines
    { 'numToStr/Comment.nvim', opts = {} },

    {
        'nvim-tree/nvim-web-devicons'
    },

    {
        'stevearc/oil.nvim',
        opts = {
            view_options = {
                show_hidden = true,
            },
        },
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },

    {
        'nvim-neo-tree/neo-tree.nvim',
        branch = 'v3.x',
        dependencies = {
          'nvim-lua/plenary.nvim',
          'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
          'MunifTanjim/nui.nvim',
          -- '3rd/image.nvim', -- Optional image support in preview window: See `# Preview Mode` for more information
        },
    },
}


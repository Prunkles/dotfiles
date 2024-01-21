
return {

    {
        'catppuccin/nvim', name = 'catppuccin', priority = 1000,
        config = function ()
            vim.cmd.colorscheme('catppuccin-mocha')
        end
    },

    {
        'neovim/nvim-lspconfig',
        dependencies = {
            -- Useful status updates for LSP
            { 'j-hui/fidget.nvim', opts = {} },
            { 'folke/neodev.nvim', opts = {} },
        },
        config = function()
            if vim.fn.executable("nil") == 1 then
                require("lspconfig").nil_ls.setup({})
            end
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
        tag = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        config = function(_)
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        end
    },

    {
        -- Detect tabstop and shiftwidth automatically
        'tpope/vim-sleuth',
    },

    {
        -- Set lualine as statusline
        'nvim-lualine/lualine.nvim',
        opts = {},

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
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ':TSUpdate',
    },

}


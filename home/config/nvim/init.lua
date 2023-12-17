
vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting
vim.opt.number = true

vim.opt.clipboard = "unnamedplus"


local function nixVimPlugin(path) return "~/.nix-profile/share/vim-plugins/" .. path end

-- -- Install lazy.nvim
-- local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- if not vim.loop.fs_stat(lazypath) then
--     vim.fn.system({
--         "git", "clone", "--filter=blob:none",
--         "https://github.com/folke/lazy.nvim.git", "--branch=stable",
--         lazypath
--     })
-- end
-- vim.opt.rtp:prepend(lazypath)
vim.opt.rtp:prepend(nixVimPlugin "folke/lazy.nvim")

local plugins = {
    {
        dir = nixVimPlugin "folke/neodev.nvim",
        opts = {}
    },
    {
        dir = nixVimPlugin "catppuccin/nvim",
        name = "catppuccin", priority = 1000,
        config = function ()
            vim.cmd.colorscheme("catppuccin-mocha")
        end
    },
    {
        dir = nixVimPlugin "neovim/nvim-lspconfig",
    },
    {
        dir = nixVimPlugin "hrsh7th/nvim-cmp",
        dependencies = {
            { dir = nixVimPlugin "L3MON4D3/LuaSnip" },
            { dir = nixVimPlugin "saadparwaiz1/cmp_luasnip" },
            { dir = nixVimPlugin "hrsh7th/cmp-nvim-lsp" },
            { dir = nixVimPlugin "rafamadriz/friendly-snippets" },
        },
        config = function(_)
            local cmp = require("cmp")
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                })
            })
        end
    },
    -- { "ms-jpq/coq_nvim", branch = "coq" },
    {
        dir = nixVimPlugin "christoomey/vim-tmux-navigator",
        lazy = false,
    },
}

require("lazy").setup(plugins, {
    -- NOTE: The lock file is absolutely useless because all plugins are managed by nix, so put it somewhere away from the immutable nix store
    lockfile = vim.fn.stdpath("data") .. "/lazy/lazy-lock.json"
})

local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup {}


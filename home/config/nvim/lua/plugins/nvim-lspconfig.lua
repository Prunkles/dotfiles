
return {
    'neovim/nvim-lspconfig',
    dependencies = {
        -- Useful status updates for LSP
        { 'j-hui/fidget.nvim', opts = {} },
        { 'folke/neodev.nvim', opts = {} },
    },
    config = function()
        local lspconfig = require('lspconfig')
        if vim.fn.executable('nil') == 1 then
            lspconfig.nil_ls.setup {}
        end
        if vim.fn.executable('lua-language-server') == 1 then
            lspconfig.lua_ls.setup {}
        end
    end
}


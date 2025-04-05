
return {
    'neovim/nvim-lspconfig',
    dependencies = {
        -- Useful status updates for LSP
        { 'j-hui/fidget.nvim', opts = {} },
        { 'folke/neodev.nvim', opts = {} },
    },
    config = function()
        local lspconfig = require('lspconfig')
        if vim.fn.executable('nixd') == 1 then
            lspconfig.nixd.setup {
                cmd = { "nixd" },
                settings = {
                    nixd = { },
                },
            }
        end
        if vim.fn.executable('lua-language-server') == 1 then
            lspconfig.lua_ls.setup {}
        end

        -- Use LspAttach autocommand to only map the following keys
        -- after the language server attaches to the current buffer
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(ev)
                local telescope_builtin = require('telescope.builtin')

                -- Enable completion triggered by <c-x><c-o>
                vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                local map = function(mode, keys, func, desc)
                    if desc then
                        desc = 'LSP: ' .. desc
                    end
                    vim.keymap.set(mode, keys, func, { buffer = ev.buf, desc = desc })
                end

                map('n', 'grn', vim.lsp.buf.rename, 'Rename')
                map('n', 'gra', vim.lsp.buf.code_action, 'Code Action') -- TODO: v mode

                map('n', 'gd', telescope_builtin.lsp_definitions, '[G]oto [D]efinition')
                map('n', 'gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
                map('n', 'grr', telescope_builtin.lsp_references, 'Goto Rerefences')
                map('n', 'gri', telescope_builtin.lsp_implementations, 'Goto Implementation')
                map('n', '<leader>D', telescope_builtin.lsp_type_definitions, 'Type [D]efinition')
                map('n', 'gO', telescope_builtin.lsp_document_symbols, 'Document Symbols')
                map('n', '<leader>ws', telescope_builtin.lsp_workspace_symbols, '[W]orkspace [S]ymbols')

                map('n', 'K', vim.lsp.buf.hover, 'Hover Documentation')
                map('n', '<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
                map({ 'i', 's' }, '<C-s>', vim.lsp.buf.signature_help, 'Signature Documentation')

                map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
                map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
                map('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, '[W]orkspace [L]ist Folders')

                vim.api.nvim_buf_create_user_command(ev.buf, 'Format', function(_) vim.lsp.buf.format() end, { desc = 'Format current buffer with LSP' })
            end
        })
    end
}


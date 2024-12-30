
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

                local nmap = function(keys, func, desc)
                    if desc then
                        desc = 'LSP: ' .. desc
                    end
                    vim.keymap.set('n', keys, func, { buffer = ev.buf, desc = desc })
                end

                nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
                nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction') -- TODO: v mode

                nmap('gd', telescope_builtin.lsp_definitions, '[G]oto [D]efinition')
                nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
                nmap('gr', telescope_builtin.lsp_references, '[G]oto [R]erefences')
                nmap('gI', telescope_builtin.lsp_implementations, '[G]oto [I]mplementation')
                nmap('<leader>D', telescope_builtin.lsp_type_definitions, 'Type [D]efinition')
                nmap('<leader>ds', telescope_builtin.lsp_document_symbols, '[D]ocument [S]ymbols')
                nmap('<leader>ws', telescope_builtin.lsp_workspace_symbols, '[W]orkspace [S]ymbols')

                nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
                nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

                nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
                nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
                nmap('<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, '[W]orkspace [L]ist Folders')

                vim.api.nvim_buf_create_user_command(ev.buf, 'Format', function(_) vim.lsp.buf.format() end, { desc = 'Format current buffer with LSP' })
            end
        })
    end
}


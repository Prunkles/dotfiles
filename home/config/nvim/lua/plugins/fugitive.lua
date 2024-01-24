
return {
    'tpope/vim-fugitive',
    config = function(_)
        vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
    end
}


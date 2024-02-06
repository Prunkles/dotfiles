
vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting
vim.wo.number = true -- Make line numbers default
vim.o.mouse = 'a' -- Enable mouse mode
vim.o.clipboard = 'unnamedplus' -- Sync clipboard between OS and Neovim
vim.o.undofile = true -- Save undo history
vim.o.ignorecase = true -- Case-insensitive searching UNLESS \C or capital in search
vim.o.smartcase = true -- -//-
vim.wo.signcolumn = 'yes' -- Keep signcolumn on by default
vim.o.completeopt = 'menuone,noselect' -- Set completeopt to have a better completion experience
vim.o.termguicolors = true

vim.o.list = true
local default_listchars = 'precedes:·,trail:·'
local verbose_listchars = 'precedes:·,trail:·,tab:>-,multispace:·'
vim.o.listchars = default_listchars
local is_verbose_list_mode = false
vim.keymap.set('n', '<F5>', function()
    is_verbose_list_mode = not is_verbose_list_mode
    if is_verbose_list_mode then
        vim.o.listchars = verbose_listchars
    else
        vim.o.listchars = default_listchars
    end
end)

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Move selected lines up and down with autoindentation © Primeagen
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")


-- Install lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git', 'clone', '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git', '--branch=stable',
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup('plugins', {
    lockfile = vim.fn.stdpath('data') .. '/lazy/lazy-lock.json',
})


-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- ===============================================
-- General Settings
-- ===============================================
vim.opt.hidden = true

-- color column at 80 chars for reference
vim.opt.colorcolumn = "80"

vim.opt.clipboard = "unnamedplus" -- Sync with system clipboard
vim.opt.number = true

-- set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
vim.opt.ignorecase = true -- Make searching case insensitive
vim.opt.smartcase = true -- ... unless the query has capital letters

-- ===============================================
-- Theme Settings
-- ===============================================

vim.opt.number = true
vim.opt.relativenumber = false

vim.opt.hlsearch = true -- highlight entries while searching
vim.opt.cursorline = true -- always have a horizontal line where the cursor is
vim.opt.termguicolors = true -- True color support
vim.opt.list = true -- Show some invisible characters (tabs...

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps hereby
--
-- ===============================================
-- Keymappings Settings
-- ===============================================
local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= falsekeymaps
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- moving around windows with <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })
--
-- moving around buffers
map("n", "<leader>bp", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete buffer" })
map("n", "<leader>b[", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<leader>b]", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete buffer" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- save file
map("n", "<leader>fs", "<cmd>w<cr><esc>", { desc = "Save file" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- lazy
map("n", "<leader>l", "<cmd>:Lazy<cr>", { desc = "Lazy" })

-- toggle line numbers
map("n", "<leader>ul", function()
  Util.toggle("number")
end, { desc = "Toggle Line Numbers" })

-- tabs
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab>c", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>n", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>p", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- quick jump to neovim config
map("n", "<leader>fp", "<cmd>edit ~/.config/nvim/<cr>", { desc = "open neovim config" })

-- vim wiki
map("n", "<leader>ww", "<cmd>VimwikiIndex<cr>", { desc = "Open VimWiki Index" })
map("n", "<C-c>", "<cmd>VimwikiToggleListItem<cr>", { desc = "Toggle completion oof a Vimwiki todo item" })
map("n", "<leader>wj", "<cmd>VimwikiMakeDiaryNote<cr>", { desc = "Make a new diary note" })

-- https://github.com/LazyVim/LazyVim/discussions/658
map("n", "<A-k>", "<esc>k", { desc = "Move up" })
map("n", "<A-j>", "<esc>j", { desc = "Move down" })
map("i", "<A-k>", "<esc>gk", { desc = "Move up" })
map("i", "<A-j>", "<esc>gj", { desc = "Move down" })
map("v", "<A-k>", "<esc>gk", { desc = "Move up" })
map("v", "<A-j>", "<esc>gj", { desc = "Move down" })

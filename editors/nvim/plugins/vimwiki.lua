return {
  -- see keymaps.lua for wiki keybindings

  {
    "vimwiki/vimwiki",
    init = function()
      vim.g.vimwiki_list = { { path = "~/vimwiki", syntax = "markdown", ext = ".md" } }
      vim.g.vimwiki_global_ext = 0 -- don't treat all md files as vimwiki
      vim.g.vimwiki_folding = "list"
      vim.g.vimwiki_hl_headers = 1 -- use alternating colors for different heading levels
      vim.g.vimwiki_markdown_link_ext = 1 -- add mardkwon file extension when generating links
      vim.g.taskwiki_markdown_syntax = "markdown"
    end,
  },
}

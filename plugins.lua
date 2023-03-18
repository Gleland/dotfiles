-- stylua: ignore
return {

  -- add telescope-fzf-native
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },
  -- Productivity
  {'vimwiki/vimwiki'},
  -- Theme options
  {'rakr/vim-one'},
  {'navarasu/onedark.nvim'},
  {'sainnhe/everforest'},
  {'romgrk/doom-one.vim'},

  -- Git
   --  'tpope/vim-fugitive' ? or maybe vimagit?

  -- LSPs
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- the following LSP servers will be automatically installed with mason and loaded with lspconfig
        pyright = {},
        tsserver = {},
        -- rust_analyzer {},
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "help",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "rust",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },

}

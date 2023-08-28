return {

  -- add telescope-fzf-native
  {
    "telescope.nvim",
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-lua/plenary.nvim",
    },
    build = "make",
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },

  -- Theme options
  { "rakr/vim-one" },
  { "navarasu/onedark.nvim" },
  { "sainnhe/everforest" },
  { "romgrk/doom-one.vim" },
  { "nlknguyen/papercolor-theme" },
  { "EdenEast/nightfox.nvim" },
  { "sonph/onehalf" },
  { "liuchengxu/space-vim-dark" },
  { "olimorris/onedarkpro.nvim" },
  { "tyrannicaltoucan/vim-deep-space" },

  -- languages
  { "fatih/vim-go" },
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
        eslint = {},
        --gopls = {},
        -- rust_analyzer {},
        -- },
      },
    },
    {
      "nvim-neo-tree/neo-tree.nvim",
      opts = {
        filesystem = {
          filtered_items = {
            visible = true, -- when true, they will just be displayed differently than normal items
          },
        },
        setup = {
          eslint = function()
            require("lazyvim.util").on_attach(function(client)
              if client.name == "eslint" then
                client.server_capabilities.documentFormattingProvider = true
              elseif client.name == "tsserver" then
                client.server_capabilities.documentFormattingProvider = false
              end
            end)
          end,
        },
      },
    },

    {
      "nvim-treesitter/nvim-treesitter",
      opts = {
        ensure_installed = {
          "bash",
          "vimdoc",
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

    -- change alpha config
    -- opts will be merged with the parent spec
    {
      "goolord/alpha-nvim",
      opts = function()
        local dashboard = require("alpha.themes.dashboard")
        local logo = [[
   ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
   ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
   ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
   ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
   ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
   ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
    ]]
        dashboard.section.header.val = vim.split(logo, "\n")
      end,
    },
    {
      "nvim-neo-tree/neo-tree.nvim",
      opts = {
        filesystem = {
          filtered_items = {
            visible = true, -- when true, they will just be displayed differently than normal items
          },
        },
      },
    },
    {
      "folke/flash.nvim",
      -- https://github.com/LazyVim/LazyVim/issues/1109
      opts = { modes = { search = { enabled = false } } },
    },
    {
      "NeogitOrg/neogit",
      dependencies = "nvim-lua/plenary.nvim",
      config = function()
        require("neogit").setup({})
      end,
    },
    {
      "iamcco/markdown-preview.nvim",
      init = function()
        vim.g.mkdp_filetypes = { "markdown" }
      end,
      ft = { "markdown" },
      cmd = {
        "MarkdownPreview",
        "MarkdownPreviewStop",
        "MarkdownPreviewToggle",
      },
      event = "BufRead",
      build = function()
        vim.fn["mkdp#util#install"]()
      end,
    },
  },
}

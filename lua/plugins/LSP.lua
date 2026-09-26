
return {
  -- Initial
  {
  "neovim/nvim-lspconfig",
  },

  -- Mason: LSP Installer
  {
    "mason-org/mason.nvim",
    opts = {},
  },

  -- Mason: Bridge
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },
}

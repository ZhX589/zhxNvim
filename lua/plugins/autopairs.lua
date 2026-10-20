-- lua/plugins/autopairs.lua
return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      check_ts = true, -- 启用 Treesitter 上下文感知
      disable_filetype = { "TelescopePrompt", "spectre_panel" },
    },
  },
}

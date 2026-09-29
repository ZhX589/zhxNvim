-- /home/zhx589/.config/nvim/lua/plugins/CONFORM.lua
return {
  {
    "stevearc/conform.nvim",
    opts = function()
      return require("config.CONFORM")
    end,
  },
}

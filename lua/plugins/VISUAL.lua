return {
  -- 主题：catppuccin/nvim
  { 
    "catppuccin/nvim", 
    name = "catppuccin", 
    priority = 1000 
  },
  -- 状态栏: lualine.nvim
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  }
}

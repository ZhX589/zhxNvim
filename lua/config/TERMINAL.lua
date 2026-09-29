-- -- /home/zhx589/.config/nvim/lua/config/TERMINAL.lua
-- ==========================================
-- Terminal Setup (toggleterm.nvim)
-- ==========================================
require("toggleterm").setup({
  -- 终端高度（当为水平分割时，占多少行）
  size = 15,
  -- 呼出/隐藏终端的快捷键，这里设置成和 VS Code 一样的 Ctrl + `
  open_mapping = [[<c-`>]],
  -- 隐藏终端时是否隐藏行号
  hide_numbers = true,
  -- 终端打开的方向：horizontal (底部水平) | vertical (右侧垂直) | float (浮动)
  direction = "horizontal",
  -- 关闭终端时光标是否回到原窗口
  close_on_exit = true,
  -- 终端背景是否变暗
  shade_terminals = true,
  -- 开始时是否进入插入模式
  start_in_insert = true,
})

-- 终端快捷键 (<leader>tf / <leader>th / <leader>tv / <Esc>-t) 已迁移至 lua/keymaps.lua
-- 注意：toggleterm 内置切换快捷键 open_mapping = [[<c-`>]] 仍在上面 setup() 中定义

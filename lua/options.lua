-- -- /home/zhx589/.config/nvim/lua/options.lua
-- 行号
vim.opt.number = true
vim.opt.relativenumber = true

-- 缩进
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- 软换行
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.smoothscroll = true

-- 鼠标
vim.opt.mouse:append("a")
vim.opt.mousemoveevent = true

-- 剪切板
vim.opt.clipboard:append("unnamedplus")

-- 窗口分割位置
vim.opt.splitright = true
vim.opt.splitbelow = true

-- 外观
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

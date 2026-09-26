-- ==========================================
-- Default
-- ==========================================

-- 启用 Lazy.nvim: 注意可能被其他项依赖
require("config.lazy")

-- 启用用户 options
require("options")

-- 启用用户快捷键 keymaps
require("keymaps")

-- ==========================================
-- 外观相关
-- ==========================================

-- 主题
require("config.catppuccin")

-- 状态栏
require("config.lualine")

-- ==========================================
-- 编辑相关: 打造完美 IDE
-- ==========================================

-- 文件树
require("config.neo-tree")

-- LSP
require("config.LSP")

-- treesitter 相关：代码高亮、自动折叠&更聪明的缩进
require("config.treesitter")

-- 代码补全
-- require("config.blink")

-- 更加完美的缩进
require("config.INDENT")

-- 启用格式化工具
require("config.CONFORM")

-- 内置终端
require("config.TERMINAL")

-- ==========================================
-- MarkDown 渲染
-- ==========================================

-- 引用文件
require("config.MARKDOWN")

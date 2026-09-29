-- lua/config/alpha.lua
local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- ==========================================
-- 标题（ASCII Art）
-- ==========================================
dashboard.section.header.val = {
  [[          $$\                 $$\   $$\ $$\    $$\ $$$$$$\ $$\      $$\ ]],
  [[          $$ |                $$$\  $$ |$$ |   $$ |\_$$  _|$$$\    $$$ |]],
  [[$$$$$$$$\ $$$$$$$\  $$\   $$\ $$$$\ $$ |$$ |   $$ |  $$ |  $$$$\  $$$$ |]],
  [[\____$$  |$$  __$$\ \$$\ $$  |$$ $$\$$ |\$$\  $$  |  $$ |  $$\$$\$$ $$ |]],
  [[  $$$$ _/ $$ |  $$ | \$$$$  / $$ \$$$$ | \$$\$$  /   $$ |  $$ \$$$  $$ |]],
  [[ $$  _/   $$ |  $$ | $$  $$<  $$ |\$$$ |  \$$$  /    $$ |  $$ |\$  /$$ |]],
  [[$$$$$$$$\ $$ |  $$ |$$  /\$$\ $$ | \$$ |   \$  /   $$$$$$\ $$ | \_/ $$ |]],
  [[\________|\__|  \__|\__/  \__|\__|  \__|    \_/    \______|\__|     \__|]],
  [[                                                                        ]],
}

-- ==========================================
-- 菜单按钮
-- ==========================================
dashboard.section.buttons.val = {
  dashboard.button("e", "  新文件", ":ene <BAR> startinsert <CR>"),
  dashboard.button("f", "  查找文件", ":Telescope find_files<CR>"),
  dashboard.button("r", "  最近文件", ":Telescope oldfiles<CR>"),
  dashboard.button("g", "  全文搜索", ":Telescope live_grep<CR>"),
  dashboard.button("c", "  编辑配置", ":e ~/.config/nvim/init.lua<CR>"),
  dashboard.button("q", "  退出", ":qa<CR>"),
}

-- ==========================================
-- 页脚
-- ==========================================
dashboard.section.footer.val = ""

-- ==========================================
-- 高亮颜色（与你主题保持一致）
-- ==========================================
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"
dashboard.section.footer.opts.hl = "Type"

alpha.setup(dashboard.opts)

-- 禁用折叠，保持起始页干净
vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])

-- ==========================================
-- Initialise
-- ==========================================
require("mason").setup()

-- 注入 blink.cmp 的 LSP capabilities
-- 这会让所有通过 mason-lspconfig automatic_enable 启动的服务器自动获得补全能力
local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok, blink = pcall(require, "blink.cmp")
if ok then
  capabilities = blink.get_lsp_capabilities(capabilities)
end
-- 全局应用 capabilities
vim.lsp.config("*", { capabilities = capabilities })

require("mason-lspconfig").setup({
  -- 留空，使用:MasonInstall安装
  ensure_installed = {},

  -- 自动激活
  automatic_enable = true,
})

-- LSP 快捷键 (gd / K / <leader>rn / <leader>ca) 已迁移至 lua/keymaps.lua
-- 包括 LspAttach autocmd 与 buffer-local keymap 设置

-- ==========================================
-- Configure Diagnostics (类似 VS Code 的错误展示)
-- ==========================================
local diagnostic_config = {
  -- 开启虚拟文本（在代码行尾显示报错信息）
  virtual_text = {
    prefix = "●", -- 行尾报错信息前的小圆点
    source = "if_many", -- 如果有多个诊断源，显示来源
  },
  -- 显示下划线/波浪线
  underline = true,
  -- 在代码左侧边栏显示错误图标
  signs = true,
  -- 在光标所在行底部显示完整的错误浮动窗口
  update_in_insert = false, -- 建议关闭插入模式下的实时更新，提升性能，保存或离开插入模式时更新
  severity_sort = true,     -- 按严重程度排序
  -- 自定义左侧边栏的图标
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "", -- 错误图标
      [vim.diagnostic.severity.WARN] = "", -- 警告图标
      [vim.diagnostic.severity.HINT] = "", -- 提示图标
      [vim.diagnostic.severity.INFO] = "", -- 信息图标
    },
  },
}

vim.diagnostic.config(diagnostic_config)

-- 诊断快捷键 ([d / ]d / <leader>le) 已迁移至 lua/keymaps.lua

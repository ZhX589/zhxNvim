-- -- /home/zhx589/.config/nvim/lua/config/LSP.lua
-- ============ 1. 全局 capabilities（blink 注入）============
local capabilities = require("blink.cmp").get_lsp_capabilities()
vim.lsp.config("*", { capabilities = capabilities })

-- ============ 2. 各 server 个性化配置 ============
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = { globals = { "vim" } },
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
})

vim.lsp.config("pyright", {
  settings = {
    pyright = { disableOrganizeImports = true },
    python = { analysis = { typeCheckingMode = "basic" } },
  },
})

-- ts_ls / rust_analyzer / gopls 用默认即可

-- ============ 3. 启用 server ============
-- mason-lspconfig 的 automatic_enable 已自动 enable，
-- 如需手动（比如不用 mason-lspconfig）：
-- vim.lsp.enable({ 'lua_ls', 'ts_ls', 'pyright', 'rust_analyzer', 'gopls' })

-- ============ 5. 诊断外观 ============
-- ============ 5. 诊断外观 ============
vim.diagnostic.config({
  -- 在行尾显示错误信息（关键：你现在是关闭状态）
  virtual_text = {
    spacing = 2,
    prefix = "●",
    severity = { min = vim.diagnostic.severity.HINT }, -- 显示所有级别的诊断
  },

  -- 左侧符号列显示错误图标
  signs = true,

  -- 错误处加下划线
  underline = true,

  -- 插入模式下也实时更新诊断（关键：你现在是 false）
  update_in_insert = true,

  -- 按严重程度排序
  severity_sort = true,

  -- 悬浮窗口样式
  float = {
    border = "rounded",
    source = "if_many",
  },
})

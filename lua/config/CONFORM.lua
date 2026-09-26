-- ~/.config/nvim/lua/config/conform.lua
local conform = require("conform")

conform.setup({
  -- 1. 设置各文件类型的格式化工具 (参考文档 Setup)
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform 会按顺序运行多个格式化工具
    python = { "isort", "black" },
    -- 可以为该文件类型自定义格式化选项
    rust = { "rustfmt", lsp_format = "fallback" },
    -- Conform 会运行第一个可用的格式化工具
    javascript = { "prettierd", "prettier", stop_after_first = true },
    typescript = { "prettierd", "prettier", stop_after_first = true },
    go = { "goimports", "gofmt" },
    sh = { "shfmt" },
  },

  -- 2. 保存时格式化配置 (参考文档 format_on_save 快捷方式)
  -- 当你执行 :wq 或 :x 退出时，会触发 BufWritePre，从而执行此配置
  format_on_save = {
    -- 这些选项将传递给 conform.format()
    timeout_ms = 500,
    lsp_format = "fallback",
  },

  -- 3. 自定义 formatter (参考文档 Customizing formatters)
  -- 这里以 shfmt 为例，展示如何追加参数
  formatters = {
    shfmt = {
      -- 追加额外参数，例如设置缩进为 2 个空格
      -- 基础参数是 { "-filename", "$FILENAME" }，最终参数将变为 { "-filename", "$FILENAME", "-i", "2" }
      append_args = { "-i", "2" },
    },
  },
})

-- 4. 提供 formatexpr，与 LSP 客户端行为一致 (参考文档)
vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

-- 手动格式化快捷键 <leader>cf 已迁移至 lua/keymaps.lua


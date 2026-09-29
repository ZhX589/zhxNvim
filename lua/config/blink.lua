-- -- /home/zhx589/.config/nvim/lua/config/blink.lua
-- blink.cmp 的补全逻辑和外观配置
return {
  enabled = function()
    return not vim.tbl_contains({ "markdown" }, vim.bo.filetype)
  end,

  keymap = {
    preset = "super-tab",
  },

  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },

  appearance = {
    nerd_font_variant = "mono", -- 启用你的 Nerd Font Mono
  },

  -- 4. 补全菜单行为
  completion = {
    documentation = {
      auto_show = true, -- 自动显示文档
      auto_show_delay_ms = 200, -- 延迟200ms显示，防闪烁
      window = { border = "rounded" },
    },
    menu = {
      auto_show = true, -- 输入即弹出
      border = "rounded",
    },
    list = {
      selection = {
        preselect = true, -- 预选第一项
        auto_insert = false, -- 不自动插入文本
      },
    },
  },
  -- 5. 签名提示 (函数参数提示)
  signature = {
    enabled = true,
    window = { border = "rounded" },
  },
  -- 6. 模糊匹配引擎
  fuzzy = {
    implementation = "prefer_rust", -- 优先使用预编译的 Rust 二进制
  },
}

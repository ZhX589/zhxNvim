-- blink.cmp 的补全逻辑和外观配置
return function()
  require('blink.cmp').setup({
    -- 1. 快捷键预设
    keymap = {
      preset = 'super-tab',
    },

    -- 2. 补全来源
    sources = {
      -- default 已内置并自动加载 friendly-snippets，无需额外写 providers
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    -- 3. 外观配置
    appearance = {
      nerd_font_variant = 'Nerd Font Mono', -- 启用你的 Nerd Font Mono
    },

    -- 4. 补全菜单行为
    completion = {
      documentation = {
        auto_show = true,             -- 自动显示文档
        auto_show_delay_ms = 200,     -- 延迟200ms显示，防闪烁
        window = { border = 'rounded' },
      },
      menu = {
        auto_show = true,             -- 输入即弹出
        border = 'rounded',
      },
      list = {
        selection = {
          preselect = true,           -- 预选第一项
          auto_insert = false,        -- 不自动插入文本
        },
      },
    },

    -- 5. 签名提示 (函数参数提示)
    signature = {
      enabled = true,
      window = { border = 'rounded' },
    },

    -- 6. 模糊匹配引擎
    fuzzy = {
      implementation = 'prefer_rust', -- 优先使用预编译的 Rust 二进制
    },
  })
end


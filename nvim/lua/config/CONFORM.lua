-- ~/.config/nvim/lua/config/conform.lua
local conform = require("conform")

conform.setup({
    formatters_by_ft = {
        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        python = { "isort", "black" },
        -- You can customize some of the format options for the filetype (:help conform.format)
        rust = { "rustfmt", lsp_format = "fallback" },
        -- Conform will run the first available formatter
        javascript = { "prettierd", "prettier", stop_after_first = true },
        -- 补充其他语言
        typescript = { "prettierd", "prettier", stop_after_first = true },
        sh = { "shfmt" },
        c = { "clang-format" },
        cpp = { "clang-format" },
    },

    formatters = {
        -- 1. shfmt (用于 shell 脚本)
        -- 参数 -i 4 表示缩进为 4 个空格
        shfmt = {
            append_args = { "-i", "4" },
        },

        -- 2. clang-format (用于 C/C++)
        -- 通过 -style 参数指定缩进宽度
        clang_format = {
            append_args = { "-style", "{IndentWidth: 4}" },
        },

        -- 3. deno_fmt (如果使用 Deno 格式化 JS/TS)
        -- 参数 --indent-width 4
        deno_fmt = {
            append_args = { "--indent-width", "4" },
        },

        -- 4. prettier / prettierd (用于 JS/TS/JSON 等)
        -- Prettier 默认通常为 2，需通过 --tab-width 4 强制修改
        prettier = {
            append_args = { "--tab-width", "4" },
        },
        prettierd = {
            append_args = { "--tab-width", "4" },
        },
    },

    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_format = "fallback",
    },
})

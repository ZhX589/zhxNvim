local telescope = require("telescope")

telescope.setup({
    defaults = {
        -- 基础配置：比如打开时清屏，避免干扰
        file_ignore_patterns = { "node_modules", ".git/" },
    },
    extensions = {
        -- 启用 fzf 原生扩展
        fzf = {
            fuzzy = true,             -- 允许模糊匹配
            override_generic_sorter = true, -- 覆盖默认排序器
            override_file_sorter = true,
            case_mode = "smart_case", -- 智能大小写
        }
    },
})

-- 加载 fzf 扩展
pcall(telescope.load_extension, "fzf")

-- Telescope 快捷键 (<leader>ff / <leader>fg / <leader>fb / <leader>fh) 已迁移至 lua/keymaps.lua

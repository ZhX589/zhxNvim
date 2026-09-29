-- -- /home/zhx589/.config/nvim/lua/keymaps.lua
-- ==========================================
-- Leader 键设定
-- ==========================================
--   vim.g.mapleader       = " "     → lua/config/lazy.lua:21
--   vim.g.maplocalleader  = "\\"    → lua/config/lazy.lua:22

-- ==========================================
-- neo-tree — 文件树
-- ==========================================
vim.keymap.set("n", "<leader>e", "<Cmd>Neotree toggle<CR>", { desc = "Toggle Neo-tree" })

-- ==========================================
-- Telescope — 模糊搜索
-- ==========================================
-- vim.keymap.set("n", "<leader>ff", "<Cmd>Telescope find_files<CR>", { desc = "Find Files" })
-- vim.keymap.set("n", "<leader>fg", "<Cmd>Telescope live_grep<CR>", { desc = "Live Grep" })
-- vim.keymap.set("n", "<leader>fb", "<Cmd>Telescope buffers<CR>", { desc = "Find Buffers" })
-- vim.keymap.set("n", "<leader>fh", "<Cmd>Telescope help_tags<CR>", { desc = "Help Tags" })

-- ==========================================
-- 诊断 — 全局（不依赖 LSP）
-- ==========================================
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Open diagnostic float" })

-- ==========================================
-- LSP — 代码导航（buffer-local，LspAttach 时激活）
-- ==========================================
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
  callback = function(ev)
    local buf = ev.buf
    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = buf, desc = desc })
    end

    -- 跳转
    map("n", "gd", vim.lsp.buf.definition, "跳转定义")
    map("n", "gD", vim.lsp.buf.declaration, "跳转声明")
    map("n", "gr", vim.lsp.buf.references, "查找引用")
    map("n", "gi", vim.lsp.buf.implementation, "跳转实现")
    map("n", "gt", vim.lsp.buf.type_definition, "跳转类型定义")

    -- 文档 / 签名
    map("n", "K", vim.lsp.buf.hover, "悬停文档")
    map("n", "<C-k>", vim.lsp.buf.signature_help, "签名帮助")

    -- 操作
    map("n", "<leader>rn", vim.lsp.buf.rename, "重命名")
    map("n", "<leader>ca", vim.lsp.buf.code_action, "代码操作")
    map("n", "<leader>f", function()
      vim.lsp.buf.format({ async = true })
    end, "格式化")
  end,
})

-- ==========================================
-- Terminal — 内置终端
-- ==========================================
-- toggleterm 内置切换快捷键 <c-`> 在插件配置中定义
-- 位于 lua/config/terminal.lua:8: open_mapping = [[<c-`>]]

vim.keymap.set("n", "<leader>tf", "<Cmd>ToggleTerm direction=float<CR>", { desc = "Float Terminal" })
vim.keymap.set("n", "<leader>th", "<Cmd>ToggleTerm direction=horizontal<CR>", { desc = "Horizontal Terminal" })
vim.keymap.set("n", "<leader>tv", "<Cmd>ToggleTerm direction=vertical<CR>", { desc = "Vertical Terminal" })
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

-- ==========================================
-- Conform — 代码格式化
-- ==========================================
vim.keymap.set({ "n", "v" }, "<leader>cf", function()
  require("conform").format({
    async = true,
    lsp_format = "fallback",
    timeout_ms = 1000,
  })
end, { desc = "Format with Conform" })

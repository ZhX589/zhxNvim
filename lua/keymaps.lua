-- ==========================================
-- Leader 键设定
-- ==========================================
--   vim.g.mapleader       = " "     → lua/config/lazy.lua:21
--   vim.g.maplocalleader  = "\\"    → lua/config/lazy.lua:22

-- ==========================================
-- neo-tree — 文件树
-- ==========================================
-- <leader>e：切换文件树显示/隐藏
vim.keymap.set("n", "<leader>e", "<Cmd>Neotree toggle<CR>")

-- ==========================================
-- Telescope — 模糊搜索
-- ==========================================
-- <leader>ff：查找文件（类似 VS Code Ctrl+P）
vim.keymap.set("n", "<leader>ff", "<Cmd>Telescope find_files<CR>", { desc = "Find Files" })
-- <leader>fg：全局文本搜索（类似 VS Code Ctrl+Shift+F）
vim.keymap.set("n", "<leader>fg", "<Cmd>Telescope live_grep<CR>", { desc = "Live Grep" })
-- <leader>fb：搜索已打开的缓冲区
vim.keymap.set("n", "<leader>fb", "<Cmd>Telescope buffers<CR>", { desc = "Find Buffers" })
-- <leader>fh：搜索 Neovim 帮助文档
vim.keymap.set("n", "<leader>fh", "<Cmd>Telescope help_tags<CR>", { desc = "Help Tags" })

-- ==========================================
-- LSP — 代码导航与诊断
-- ==========================================
-- 以下 4 条为 buffer-local，在 LSP 挂载时自动激活（LspAttach autocmd）
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }
    -- gd：跳转到定义
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    -- K：显示悬停文档/函数签名
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    -- <leader>rn：重命名变量/函数
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    -- <leader>ca：代码修复建议（Code Action）
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  end,
})

-- [d：跳转到上一个诊断错误
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
-- ]d：跳转到下一个诊断错误
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
-- <leader>le：打开诊断浮动窗口（光标悬停时显示详情）
vim.keymap.set("n", "<leader>le", vim.diagnostic.open_float, { desc = "Open diagnostic float" })

-- ==========================================
-- Terminal — 内置终端
-- ==========================================
-- 注意：toggleterm 内置切换快捷键 <c-`> 在插件配置中定义
-- 位于 lua/config/TERMINAL.lua:8: open_mapping = [[<c-`>]]

-- <leader>tf：打开悬浮终端
vim.keymap.set("n", "<leader>tf", "<Cmd>ToggleTerm direction=float<CR>", { desc = "Float Terminal" })
-- <leader>th：在底部打开水平终端
vim.keymap.set("n", "<leader>th", "<Cmd>ToggleTerm direction=horizontal<CR>", { desc = "Horizontal Terminal" })
-- <leader>tv：在右侧打开垂直终端
vim.keymap.set("n", "<leader>tv", "<Cmd>ToggleTerm direction=vertical<CR>", { desc = "Vertical Terminal" })
-- <Esc>（终端模式下）：退出终端插入模式，回到 normal 模式
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

-- ==========================================
-- Conform — 代码格式化
-- ==========================================
-- <leader>cf：手动格式化当前缓冲区或选中区域
vim.keymap.set({ "n", "v" }, "<leader>cf", function()
  require("conform").format({
    async = true,
    lsp_format = "fallback",
    timeout_ms = 500,
  })
end, { desc = "Format current buffer or range with Conform" })

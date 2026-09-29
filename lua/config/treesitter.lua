-- -- /home/zhx589/.config/nvim/lua/config/treesitter.lua
-- ============================================================
-- nvim-treesitter 基础配置（新版）
-- ============================================================
require("nvim-treesitter").setup({
  -- 安装目录，优先于 runtimepath
  install_dir = vim.fn.stdpath("data") .. "/site",
})

-- 需要安装的 parser 列表（按需增删）
require("nvim-treesitter").install({
  "lua",
  "vim",
  "vimdoc",
  "query",
  "rust",
  "javascript",
  "typescript",
  "tsx",
  "zig",
  "python",
  "c",
  "cpp",
  "go",
  "bash",
  "json",
  "yaml",
  "markdown",
  "markdown_inline",
  "html",
  "css",
})

-- ============================================================
-- 按文件类型自动启用 Treesitter 高亮 / 折叠 / 缩进
-- ============================================================
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function(args)
    -- 1. 获取当前 filetype 对应的 Treesitter 语言（安全回退）
    local ft = vim.bo[args.buf].filetype
    local lang = vim.treesitter.language.get_lang(ft) or ft

    -- 2. 尝试获取解析器
    local ok, parser = pcall(vim.treesitter.get_parser, args.buf, lang)

    if ok and parser then
      -- (1) 开启高亮
      pcall(vim.treesitter.start, args.buf)

      -- (2) 开启折叠（作用域限定为当前窗口，避免污染其他文件）
      local win = vim.api.nvim_get_current_win()
      vim.wo[win].foldmethod = "expr"
      vim.wo[win].foldexpr = "v:lua.vim.treesitter.foldexpr()"
      vim.wo[win].foldlevel = 99

      -- (3) 开启缩进
      -- 新版 nvim-treesitter 推荐直接使用内置 indentexpr；
      -- 旧写法 require'nvim-treesitter'.indentexpr() 已不再推荐。
      vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      -- 如果你的 nvim-treesitter 版本较新，也可以改成：
      -- vim.bo[args.buf].indentexpr = 'v:lua.vim.treesitter.indentexpr()'
    else
      -- 重要：切换到不支持的语言时，重置折叠，避免报错
      local win = vim.api.nvim_get_current_win()
      if vim.wo[win].foldmethod == "expr" then
        vim.wo[win].foldmethod = "manual"
      end
    end
  end,
})

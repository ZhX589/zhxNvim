vim.api.nvim_create_autocmd('FileType', {
  pattern = '*', -- 监听所有文件类型
  callback = function()
    -- 1. 获取当前文件类型对应的 Treesitter 语言（安全回退到 filetype 本身）
    local lang = vim.treesitter.language.get_lang(vim.bo.filetype) or vim.bo.filetype

    -- 2. 尝试获取解析器
    local ok, parser = pcall(vim.treesitter.get_parser, 0, lang)

    -- 3. 判断并执行
    if ok and parser then
      -- (1) 开启高亮
      pcall(vim.treesitter.start)

      -- (2) 开启折叠 (明确指定作用域为当前窗口 0，避免污染其他文件)
      local win = vim.api.nvim_get_current_win()
      vim.wo[win].foldmethod = 'expr'
      vim.wo[win].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      vim.wo[win].foldlevel = 99

      -- (3) 开启缩进
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    else
      -- 极其重要：如果换到了不支持的语言，且处于同一个窗口，重置折叠免得报错
      local win = vim.api.nvim_get_current_win()
      if vim.wo[win].foldmethod == 'expr' then
        vim.wo[win].foldmethod = 'manual'
      end
    end
  end,
})

# zhxNvim
一个我自己正在使用的nvim配置

## 和原版nvim相比我改动了什么

基于 **lazy.nvim** 的模块化 Neovim 配置，目标是把 Neovim 打造成一个趁手的 IDE —— 代码补全、LSP、格式化、文件树、Markdown 渲染、内置终端一应俱全，同时保持结构清晰、易于二次定制。

---

## 目录结构

```
~/.config/nvim/
├── init.lua                    # 入口文件，按顺序加载各模块
└── lua/
    ├── options.lua             # 编辑器选项
    ├── keymaps.lua             # 全局快捷键
    ├── config/                 # 各模块的「逻辑配置」
    │   ├── lazy.lua            # lazy.nvim 引导 + leader 键
    │   ├── catppuccin.lua      # 主题
    │   ├── lualine.lua         # 状态栏
    │   ├── neo-tree.lua        # 文件树
    │   ├── LSP.lua             # LSP 配置 + 诊断外观
    │   ├── treesitter.lua      # 高亮 / 折叠 / 缩进
    │   ├── blink.lua           # 补全逻辑
    │   ├── INDENT.lua          # 缩进引导
    │   ├── CONFORM.lua         # 格式化
    │   ├── TERMINAL.lua        # 内置终端
    │   └── MARKDOWN.lua        # Markdown 渲染
    └── plugins/                # lazy.nvim 的插件声明（spec）
        ├── LSP.lua
        ├── VISUAL.lua
        ├── neo-tree.lua
        ├── nvim-treesitter.lua
        ├── blink.lua
        ├── CONFORM.lua
        ├── INDENT.lua
        ├── TERMINAL.lua
        └── MARKDOWN.lua
```

> **设计思路**：`plugins/` 只负责「声明装什么插件」，`config/` 负责「插件怎么用」。两者通过 `opts = function() return require("config.xxx") end` 连接，逻辑与声明分离，便于维护。

---

## 依赖

### 系统依赖

| 依赖 | 用途 | 安装示例 |
| --- | --- | --- |
| **Neovim ≥ 0.10** | 主体（使用了 `vim.lsp.config` 等新 API） | 见 [neovim.io](https://neovim.io/) |
| **Git** | lazy.nvim 拉取插件 | `sudo apt install git` |
| **Nerd Font** | 图标显示 | 推荐 [JetBrainsMono Nerd Font](https://www.nerdfonts.com/) |
| **ripgrep** | 模糊搜索（可选） | `sudo apt install ripgrep` |
| **ImageMagick** | Markdown 图片渲染（`image.nvim`） | `sudo apt install imagemagick` |
| **一个支持 Kitty Graphics 的终端** | 图片显示 | Kitty / WezTerm / Ghostty 等 |

### 语言相关格式化工具（`conform.nvim` 会用）

配置里按文件类型指定了格式化器，**按需安装**：

```bash
# Lua
cargo install stylua        # 或 scoop/brew 安装

# Python
pip install isort black

# JS / TS
npm install -g prettier

# Go / Rust / Shell
# goimports、gofmt、rustfmt、shfmt 随对应工具链安装
```

### LSP 服务器

通过 **mason.nvim + mason-lspconfig** 自动安装，`ensure_installed` 中已声明：

- `lua_ls`、`ts_ls`、`pyright`、`rust_analyzer`、`gopls`

首次启动后会自动安装，也可以手动执行 `:Mason` 查看/增删。

---

## 功能一览

| 模块 | 插件 | 说明 |
| --- | --- | --- |
| 插件管理 | [lazy.nvim](https://github.com/folke/lazy.nvim) | 自动引导安装、自动检查更新 |
| 主题 | [catppuccin](https://github.com/catppuccin/nvim) | 默认配色 |
| 状态栏 | [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | 模式 / 分支 / 诊断 / 文件信息 |
| 文件树 | [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) | 文件操作、Git 状态、诊断 |
| LSP | [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) + [mason](https://github.com/mason-org/mason.nvim) | 自动装 server，blink 注入补全能力 |
| 语法高亮/折叠/缩进 | [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | 按文件类型自动启用 |
| 代码补全 | [blink.cmp](https://github.com/Saghen/blink.cmp) | super-tab 预设，Rust 模糊匹配 |
| 缩进引导 | [indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim) + [guess-indent](https://github.com/nmac427/guess-indent.nvim) | 可视化缩进 + 自动推断 |
| 格式化 | [conform.nvim](https://github.com/stevearc/conform.nvim) | 保存时格式化 + LSP fallback |
| 内置终端 | [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) | 水平 / 垂直 / 浮动 |
| Markdown | [render-markdown](https://github.com/MeanderingProgrammer/render-markdown.nvim) + [image.nvim](https://github.com/3rd/image.nvim) + [mdmath](https://github.com/Thiago4532/mdmath.nvim) | 渲染、图片、LaTeX 公式 |

---

## 快捷键

> **Leader 键 = `空格`**，**LocalLeader = `\`**（在 `lua/config/lazy.lua` 中设置）

### 文件树（neo-tree）

| 快捷键 | 功能 |
| --- | --- |
| `<leader>e` | 打开 / 关闭文件树 |

文件树内部常用键：`<cr>` 打开、`s` 垂直分屏、`S` 水平分屏、`t` 新标签页、`a` 新建文件、`A` 新建目录、`d` 删除、`r` 重命名、`y` 复制、`x` 剪切、`p` 粘贴、`H` 切换隐藏文件、`/` 模糊查找、`?` 查看帮助。

### 诊断

| 快捷键 | 功能 |
| --- | --- |
| `[d` | 上一个诊断 |
| `]d` | 下一个诊断 |
| `<leader>ld` | 悬浮显示诊断详情 |

### LSP（打开文件并附加 LSP 后生效）

| 快捷键 | 功能 |
| --- | --- |
| `gd` | 跳转定义 |
| `gD` | 跳转声明 |
| `gr` | 查找引用 |
| `gi` | 跳转实现 |
| `gt` | 跳转类型定义 |
| `K` | 悬停文档 |
| `<C-k>` | 签名帮助 |
| `<leader>rn` | 重命名 |
| `<leader>ca` | 代码操作 |
| `<leader>f` | 用 LSP 格式化 |

### 终端（toggleterm）

| 快捷键 | 功能 |
| --- | --- |
| `` <C-`> `` | 切换终端（插件内置） |
| `<leader>tf` | 浮动终端 |
| `<leader>th` | 水平终端 |
| `<leader>tv` | 垂直终端 |
| `<Esc>`（终端模式） | 退出终端模式回到普通模式 |

### 格式化（conform）

| 快捷键 | 功能 |
| --- | --- |
| `<leader>cf` | 格式化当前文件（普通 / 可视模式） |

> 保存时也会自动格式化（`format_on_save`），`timeout_ms = 500`，LSP 作为 fallback。

更多请见：[KEYMAPS.md](./KEYMAPS.md)

---

## 自定义配置

### 1. 换主题

修改 `lua/config/catppuccin.lua`：

```lua
vim.cmd([[colorscheme catppuccin]])
```

想换别的主题？在 `lua/plugins/VISUAL.lua` 里替换插件声明，并新增一个 `lua/config/<主题>.lua` 加载即可。

### 2. 改 leader 键

编辑 `lua/config/lazy.lua`（必须在加载 lazy.nvim **之前** 设置）：

```lua
vim.g.mapleader = " "        -- 改成你想要的键
vim.g.maplocalleader = "\\"
```

### 3. 增删 LSP 服务器

编辑 `lua/plugins/LSP.lua` 中的 `ensure_installed`：

```lua
opts = {
  ensure_installed = {
    "lua_ls", "ts_ls", "pyright", "rust_analyzer", "gopls",
    "clangd",   -- 新增
  },
},
```

个性化设置写在 `lua/config/LSP.lua`：

```lua
vim.lsp.config("clangd", {
  settings = { ... },
})
```

### 4. 新增插件

在 `lua/plugins/` 下新建一个 `.lua` 文件，返回 lazy.nvim 的 spec 即可，会自动被 `{ import = "plugins" }` 扫描到：

```lua
-- lua/plugins/example.lua
return {
  {
    "author/plugin-name",
    event = "VeryLazy",
    opts = function()
      return require("config.example")  -- 逻辑放到 config/ 下
    end,
  },
}
```

### 5. 调整缩进 / 行号等基础选项

直接编辑 `lua/options.lua`：

```lua
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
-- 关闭相对行号：
-- vim.opt.relativenumber = false
```

### 6. 添加自己的快捷键

推荐都写到 `lua/keymaps.lua`，保持集中管理：

```lua
vim.keymap.set("n", "<leader>w", "<Cmd>w<CR>", { desc = "Save file" })
```

### 7. 修改格式化规则

编辑 `lua/config/CONFORM.lua` 的 `formatters_by_ft`：

```lua
formatters_by_ft = {
  lua = { "stylua" },
  python = { "isort", "black" },
  -- 新增，比如 C/C++
  c = { "clang-format" },
  cpp = { "clang-format" },
},
```

不想保存时自动格式化？删掉 `format_on_save` 字段即可。

### 8. Markdown 渲染

`lua/config/MARKDOWN.lua` 里分别配置了：

- `render-markdown`：标题、列表、表格等可视化
- `image`：图片渲染（需要支持 Kitty Graphics 的终端）
- `mdmath`：LaTeX 公式渲染

如果终端不支持图片，把 `image` 的相关配置去掉或禁用 `integrations.markdown.enabled`。

### 9. 增删 Treesitter parser

编辑 `lua/config/treesitter.lua` 中的 `install()` 列表：

```lua
require("nvim-treesitter").install({
  "lua", "python", "rust",
  "java",   -- 新增
})
```

保存后执行 `:TSUpdate`（或在 lazy 中 rebuild）即可。

---

## 安装

```bash
# 1. 备份旧配置（如果有）
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak

# 2. 克隆本仓库
git clone <your-repo-url> ~/.config/nvim

# 3. 启动 Neovim，lazy.nvim 会自动引导并安装所有插件
nvim
```

首次启动会：

1. 自动 clone `lazy.nvim`
2. 安装 `plugins/` 下声明的所有插件
3. 安装 Treesitter parser
4. 通过 mason 安装 LSP server

完成后执行 `:Lazy` 查看插件状态，`:Mason` 查看 LSP 状态，`:checkhealth` 排查问题。

---

## 常见问题

**Q：图标显示成方块？**
A：终端没有使用 Nerd Font，换一个已安装 Nerd Font 的终端字体。

**Q：Markdown 图片不显示？**
A：需要 Kitty / WezTerm / Ghostty 等支持 Kitty Graphics 协议的终端，并且安装 ImageMagick。

**Q：某个语言没有高亮 / 补全？**
A：先 `:TSInstall <lang>` 装 parser，再 `:Mason` 装对应 LSP。

**Q：想临时关掉保存格式化？**
A：`:lua vim.g.disable_autoformat = true`（需在 CONFORM 里加开关），或直接注释 `format_on_save`。

---

## License

MIT

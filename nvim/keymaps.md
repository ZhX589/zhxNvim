# Neovim 快捷键速查表

## 基础设定

| 设定 | 键 | 定义位置 |
|---|---|---|
| Leader | `<Space>` | `lua/config/lazy.lua:21` |
| LocalLeader | `\` | `lua/config/lazy.lua:22` |

> 以上两项必须在 lazy.nvim 加载前设置，因此定义在 `lua/config/lazy.lua` 而非 `lua/keymaps.lua`

---

## neo-tree — 文件树

| 按键 | 模式 | 功能 |
|---|---|---|
| `<leader>e` | n | 切换文件树 显示/隐藏 |

---

## Telescope — 模糊搜索

| 按键 | 模式 | 功能 |
|---|---|---|
| `<leader>ff` | n | 查找文件（类似 VS Code `Ctrl+P`） |
| `<leader>fg` | n | 全局文本搜索（类似 VS Code `Ctrl+Shift+F`） |
| `<leader>fb` | n | 搜索已打开的缓冲区 |
| `<leader>fh` | n | 搜索 Neovim 帮助文档 |

---

## LSP — 代码导航与诊断

### Buffer-local（LSP 挂载时自动激活）

| 按键 | 模式 | 功能 |
|---|---|---|
| `gd` | n | 跳转到定义 |
| `K` | n | 显示悬停文档/函数签名 |
| `<leader>rn` | n | 重命名变量/函数 |
| `<leader>ca` | n | 代码修复建议（Code Action） |

### 全局诊断

| 按键 | 模式 | 功能 |
|---|---|---|
| `[d` | n | 跳转到上一个诊断错误 |
| `]d` | n | 跳转到下一个诊断错误 |
| `<leader>le` | n | 打开诊断浮动窗口（光标悬停时显示详情） |

---

## Terminal — 内置终端

| 按键 | 模式 | 功能 | 定义位置 |
|---|---|---|---|
| `<c-`>` | — | 切换终端 显示/隐藏 | `lua/config/TERMINAL.lua:8`（toggleterm 插件内置 `open_mapping`） |
| `<leader>tf` | n | 打开悬浮终端 | `lua/keymaps.lua` |
| `<leader>th` | n | 在底部打开水平终端 | `lua/keymaps.lua` |
| `<leader>tv` | n | 在右侧打开垂直终端 | `lua/keymaps.lua` |
| `<Esc>` | t | 退出终端插入模式（回到 Normal） | `lua/keymaps.lua` |

---

## Conform — 代码格式化

| 按键 | 模式 | 功能 |
|---|---|---|
| `<leader>cf` | n, v | 手动格式化当前缓冲区或选中区域 |

---

## 附录：已移除的 neo-tree 内部映射 (v2 → v3 迁移)

> 以下映射在 neo-tree v3.x 中不存在对应命令，已从 `lua/config/neo-tree.lua` 中删除。
> 这些是 v2.x 遗留配置，v3.x 不再支持。

| 移除的按键 | 原命令 | v3.x 替代方案 | 原作用域 |
|---|---|---|---|
| `<C-s>` | `quick_jump` | `/` (fuzzy_finder 模糊搜索) | 全局 |
| `<Tab>` | `select` | `V` 进入 visual 模式，`j/k` 扩展选区 | 全局 |
| `<C-;>` | `clear_selection` | `<Esc>` 取消选择 | 全局 |
| `gl` | `git_pull` | 无内置替代，可手动 `:!git pull` | git_status 窗口 |

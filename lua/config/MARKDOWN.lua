-- -- /home/zhx589/.config/nvim/lua/config/MARKDOWN.lua
-- 更优的 MarkDown 显示
require("render-markdown").setup({
  completions = { lsp = { enabled = true } },
})

-- MarkDown 图片显示
require("image").setup({
  backend = "kitty", -- or "ueberzug" or "sixel"
  processor = "magick_cli", -- or "magick_rock"
  integrations = {
    markdown = {
      enabled = true,
      clear_in_insert_mode = false,
      download_remote_images = true,
      only_render_image_at_cursor = false,
      only_render_image_at_cursor_mode = "popup", -- or "inline"
      floating_windows = false, -- if true, images will be rendered in floating markdown windows
      filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
    },
    asciidoc = {
      enabled = true,
      clear_in_insert_mode = false,
      download_remote_images = true,
      only_render_image_at_cursor = false,
      only_render_image_at_cursor_mode = "popup",
      floating_windows = false,
      filetypes = { "asciidoc", "adoc" },
    },
    neorg = {
      enabled = true,
      filetypes = { "norg" },
    },
    rst = {
      enabled = true,
    },
    typst = {
      enabled = true,
      filetypes = { "typst" },
    },
    html = {
      enabled = false,
    },
    css = {
      enabled = false,
    },
  },
  max_width = nil,
  max_height = nil,
  max_width_window_percentage = nil,
  max_height_window_percentage = 50,
  scale_factor = 1.0,
  kitty_direct_chunk_size = 4096, -- chunk size for direct Kitty graphics protocol transmission
  window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
  window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "snacks_notif", "scrollview", "scrollview_sign" },
  editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
  tmux_show_only_in_active_window = false, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
  hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" }, -- render image files as images when opened
})

require("mdmath").setup({
  -- Filetypes that the plugin will be enabled by default.
  filetypes = { "markdown" },
  -- Color of the equation, can be a highlight group or a hex color.
  -- Examples: 'Normal', '#ff0000'
  foreground = "Normal",
  -- Hide the text when the equation is under the cursor.
  anticonceal = true,
  -- Hide the text when in the Insert Mode.
  hide_on_insert = true,
  -- Enable dynamic size for non-inline equations.
  dynamic = true,
  -- Configure the scale of dynamic-rendered equations.
  dynamic_scale = 1.0,
  -- Interval between updates (milliseconds).
  update_interval = 400,

  -- Internal scale of the equation images, increase to prevent blurry images when increasing terminal
  -- font, high values may produce aliased images.
  -- WARNING: This do not affect how the images are displayed, only how many pixels are used to render them.
  --          See `dynamic_scale` to modify the displayed size.
  internal_scale = 1.0,
})

-- ==========================================
-- 自动补全
-- ========================================
require("blink.cmp").setup({
    keymap = {
        preset = "super-tab",
        ["<A-1>"] = {
            function(cmp)
                cmp.accept({ index = 1 })
            end,
        },
        ["<A-2>"] = {
            function(cmp)
                cmp.accept({ index = 2 })
            end,
        },
        ["<A-3>"] = {
            function(cmp)
                cmp.accept({ index = 3 })
            end,
        },
        ["<A-4>"] = {
            function(cmp)
                cmp.accept({ index = 4 })
            end,
        },
        ["<A-5>"] = {
            function(cmp)
                cmp.accept({ index = 5 })
            end,
        },
        ["<A-6>"] = {
            function(cmp)
                cmp.accept({ index = 6 })
            end,
        },
        ["<A-7>"] = {
            function(cmp)
                cmp.accept({ index = 7 })
            end,
        },
        ["<A-8>"] = {
            function(cmp)
                cmp.accept({ index = 8 })
            end,
        },
        ["<A-9>"] = {
            function(cmp)
                cmp.accept({ index = 9 })
            end,
        },
        ["<A-0>"] = {
            function(cmp)
                cmp.accept({ index = 10 })
            end,
        },
    },

    appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = "mono",
    },

    completion = {
        documentation = { auto_show = false },
        accept = { auto_brackets = { enabled = true } },
        menu = {
            draw = {
                columns = { { "item_idx" }, { "kind_icon" }, { "label", "label_description", gap = 1 } },
                components = {
                    item_idx = {
                        text = function(ctx)
                            return ctx.idx == 10 and "0" or ctx.idx >= 10 and " " or tostring(ctx.idx)
                        end,
                        highlight = "BlinkCmpItemIdx", -- optional, only if you want to change its color
                    },
                },
            },
        },
    },
})

-- ==========================================
-- 括号补全
-- ==========================================
require("nvim-autopairs").setup({})

-- ==========================================
-- 模板
-- ==========================================
require("template").setup({
    temp_dir = "/data/Templates/",
    author = "ZhX589",
    email = "i@zhx589.top",
})

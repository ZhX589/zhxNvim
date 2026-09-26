return {
    -- 更优的markdown显示
    {
        'MeanderingProgrammer/render-markdown.nvim',
        ft = { "markdown", "norg" },
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' }, -- if you use the mini.nvim suite
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {},
    },
    -- MarkDown 图片渲染
    {
        "3rd/image.nvim",
        ft = { "markdown", "norg" },
        build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
        opts = {
            processor = "magick_cli",
        }
    },
    {
        'Thiago4532/mdmath.nvim',
        ft = { "markdown" },
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
        },
        -- The build is already done by default in lazy.nvim, so you don't need
        -- the next line, but you can use the command `:MdMath build` to rebuild
        -- if the build fails for some reason.
        -- build = ':MdMath build'
    },
}

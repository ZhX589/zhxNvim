return {
    -- 括号补全
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },
    -- 自动补全
    {
        'saghen/blink.cmp',
        version = '1.*',
        dependencies = {
            'rafamadriz/friendly-snippets',
        },
    },
    -- 文件模板
    {
        'glepnir/template.nvim',
        cmd = { 'Template', 'TemProject' },
    }
}

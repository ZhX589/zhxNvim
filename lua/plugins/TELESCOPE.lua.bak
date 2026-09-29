return {
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x", -- 使用稳定版
        dependencies = {
            "nvim-lua/plenary.nvim",
            -- 原生 C 扩展，大幅提升排序性能
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make"
            },
            "nvim-tree/nvim-web-devicons", -- 提供文件图标
        },
        config = function()
            require("config.TELESCOPE")
        end,
    },
}

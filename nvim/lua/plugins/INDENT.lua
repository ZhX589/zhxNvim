return {
  -- Guess Indent: 自动推断缩进方式
  {
    'nmac427/guess-indent.nvim',
  },
  -- Indent Blankline: 缩进引导
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
  }
}

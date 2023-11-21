return {
  "ur4ltz/surround.nvim",
  dependencies = {"tpope/vim-repeat"},
  config = function()
    require"surround".setup {mappings_style = "surround"}
  end
}

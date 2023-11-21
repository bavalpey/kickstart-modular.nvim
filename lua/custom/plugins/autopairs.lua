return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  dependencies = { 'hrsh7th/nvim-cmp' },
  config = function ()
    require('nvim-autopairs').setup({
      enable_afterquote = true,
      enable_check_bracket_line = true,
      enable_moveright = true
    })
  end
}

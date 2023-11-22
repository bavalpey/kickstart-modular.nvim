return {
  "nvimtools/none-ls.nvim",
  dependencies = {"nvim-lua/plenary.nvim"},
  config = function ()
    require('null-ls').setup({
      sources= {
        require('null-ls').builtins.formatting.black,
        require('null-ls').builtins.formatting.yamlfmt,
        require('null-ls').builtins.formatting.yamllint,

      }
    })
  end,
}

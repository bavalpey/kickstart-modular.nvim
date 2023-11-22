local settings = {
  format_on_save = false,
  null_ls_settings = {
    default_timeout = 2000,
    diagnostics_format = "#{m} (#{s})",
  },
}

return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  config = function()
    require('null-ls').setup({
      default_timeout = 2000,
      diagnostics_format = "#{m} (#{s})",
      sources = {
        require('null-ls').builtins.formatting.black,
        require('null-ls').builtins.formatting.yamlfmt,
        --require('null-ls').builtins.formatting.yamllint,
      }
    })
  end,
  init = function()
    require('which-key').register({ ["<leader>cf"] = { function() vim.lsp.buf.format({ timeout_ms = settings
      .null_ls_settings.default_timeout }) end, "Format/Fix" } })
  end
}

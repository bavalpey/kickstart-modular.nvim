local settings = {
  format_on_save = false,
  null_ls_settings = {
    default_timeout = 2000,
    diagnostics_format = "#{m} (#{s})",
  },
}
local default_error_handler = function(package_name, err_message)
  error(("Error installing mason package `%s`.  Reason: \n%s "):format(package_name, err_message))
end

local use_mason_package = function(package_name, error_handler)
  local mason = require("mason-registry")
  local on_err = error_handler or default_error_handler
  if package_name == nil then
    on_err("nil", "No package_name provided.")
    return
  end
  local ok, err = xpcall(function()
    local registry = require("mason-registry")
    registry.refresh(function()
      local package = mason.get_package(package_name)
      if not package:is_installed() then
        -- If statusline enabled, push the package to the statusline state
        -- So we can provide feedback to user
        require('custom.plugins.statusline').state.start_mason_package(package_name)

        package:install()
        package:on("install:success", function(handle)
          -- Remove package from statusline state to hide it
          require('custom.plugins.statusline').state.finish_mason_package(package_name)
        end)
        package:on("install:failed", function(pkg)
          -- Remove package from statusline state to hide it
          require('custom.plugins.statusline').state.finish_mason_package(package_name)
          local err = "Mason.nvim install failed.  Reason:\n"
          if pkg and pkg.stdio and pkg.stdio.buffers and pkg.stdio.buffers.stderr then
            for _, line in ipairs(pkg.stdio.buffers.stderr) do
              err = err .. line
            end
          end

          vim.schedule(function()
            on_err(package_name, err)
          end)
        end)
      end
    end)
  end, debug.traceback)
  if not ok then
    on_err(package_name, "There was an unknown error when installing.  Reason: \n" .. err)
  end
end
return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  config = function()
    require('null-ls').setup({
      default_timeout = 2000,
      diagnostics_format = "#{m} (#{s})",
    })
  end,
  init = function()
    require('which-key').register({
      ["<leader>cf"] = { function()
        vim.lsp.buf.format({
          timeout_ms = settings
              .null_ls_settings.default_timeout
        })
      end, "Format/Fix" }
    })
  end
}

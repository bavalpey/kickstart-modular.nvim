local inspect= require('vim.inspect')
local langs = {
  "python",
  "bash"
}
if #langs > 0 then
  local create_autocmd = vim.api.nvim_create_autocmd
  vim.api.nvim_create_augroup("LanguageSetup", {})
  for _, lang in pairs(langs) do
    local ok, langfile = xpcall(require, debug.traceback, "custom.langs." .. lang)
    if not ok and langfile then
      error(string.format("There was an error requiring '%s'. Traceback:\n%s", "custom.langs." .. lang, langfile))
    end
    if langfile.autocmds then
      for _, tbl in pairs(langfile.autocmds) do
        create_autocmd(tbl["event"], vim.tbl_extend("keep", tbl["opts"], { group = "LanguageSetup" }))
      end
    end
  end
end
-- python
--

local utils = {}


utils.bool2num = function(bool_or_num)
  if type(bool_or_num) == "boolean" then
    return bool_or_num and 1 or 0
  end
  return bool_or_num
end

utils.get_diagnostic_count = function(bufnr, severity)
  return vim.tbl_count(vim.diagnostic.get(bufnr, {
    severity = severity,
  }))
end

return utils

local utils = {}

utils.is_empty = function(str)
  return str == "" or str == nil
end

--- Escapes a string
--- @param str string String to escape
utils.escape_str = function(str)
  local escape_patterns = {
    "%^",
    "%$",
    "%(",
    "%)",
    "%[",
    "%]",
    "%%",
    "%.",
    "%-",
    "%*",
    "%+",
    "%?",
  }

  return str:gsub(("([%s])"):format(table.concat(escape_patterns)), "%%%1")
end

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

utils.round = function(num, decimalplace)
  local mult = 10 ^ (decimalplace or 0)
  return math.floor(num * mult + 0.5) / mult
end

utils.find_executable_in_path = function(executables)
  return vim.tbl_filter(function(c)
    return c ~= vim.NIL and vim.fn.executable(c) == 1
  end, executables)[1]
end



return utils


local opt = vim.o

local sugar_fold = function ()
  local start_line = vim.fn.getline(vim.v.foldstart):gsub("\t", ("\t"):rep(vim.opt.tabstop:get()))
  return string.format("%s ... (%d lines)", start_line, vim.v.foldend - vim.v.foldstart + 1)
end

opt.splitright = true
opt.splitbelow = true

opt.smartindent = true
opt.copyindent = true
opt.preserveindent = true
opt.scrolloff=4
opt.showmode = false
opt.swapfile = false
opt.laststatus = 3
opt.colorcolumn = "120"
opt.foldtext = sugar_fold()


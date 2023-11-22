local new_autocmd = vim.api.nvim_create_autocmd
local new_augroup = vim.api.nvim_create_augroup

new_augroup("filetemplates", {})

-- Set bash syntax highlighting
new_autocmd({"BufNewFile", "BufRead"}, {pattern = ".bash_*", command = "set ft=bash"})


-- templates for python
new_autocmd({"BufNewFile"},
  { pattern = {'*.py'},
    group="filetemplates",
    command = '0r' .. vim.env.XDG_CONFIG_HOME .. '/nvim/templates/python.tmpl|5,5s/%%FILE%%/\\=@%/|4,4s/%%DATE%%/\\=strftime("%d %b %Y")/|cal cursor(7,16)'})


new_autocmd({"BufWritePre", "FileWritePre"},
  { pattern = "*.py",
    group="filetemplates",
    command = "if &mod | ks | exe '1,' .. min([6, line('$')]) .. 's/\\(# Last Edited:\\s\\+\\).*/\\1' .. strftime('%c')  | 's | endif",
  })

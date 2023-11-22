local wk = require('which-key')

wk.register({["<Esc>"] = {"<C-\\><C-n>", 'Exit insert in terminal'}}, {mode='t'})

wk.register({
  ["<Tab>"] = {":bnext<CR>", "Jump to next buffer"},
  ["<S-Tab>"] = {":bprevious<CR>", "Jump to previous buffer"},
  ["<leader>c"] = {
    name = "+code",
    e = {"<cmd>TroubleToggle<CR>", ""}
  },
  ["<leader>b"] = {
    name = "+buffer",
    b = {"<Cmd>e #<CR>", "Jump to recent"},
    d = {"<Cmd>bd<CR>", "Delete"},
  },
  ["<leader>w"] = {
    name = "+window",
    w = {"<C-w>p", "Jump to recent" },
    d = {"<C-w>c", "Delete window" },
    s = {"<C-w>s", "Split up/down" },
    v = {"<C-w>v", "Split left/right" },
    h = {"<C-w>h", "Jump left" },
    j = {"<C-w>j", "Jump down" },
    k = {"<C-w>k", "Jump up" },
    l = {"<C-w>l", "Jump right" },
    H = {"<C-w>H", "Move left" },
    J = {"<C-w>J", "Move down" },
    K = {"<C-w>K", "Move up" },
    L = {"<C-w>L", "Move right" },
    ["-"] = {"<C-w>s", "Split up/down" },
    ["|"] = {"<C-w>v", "Split left/right" },
    ["="] = {"<C-w>=", "Move right" },
    ["<C-H>"] = {"<C-w>5<", "Expand left" },
    ["<C-J>"] = { "<cmd>resize +5<CR>", "Expand down" },
    ["<C-K>"] = { "<cmd>resize -5<CR>", "Expand up" },
    ["<C-L>"] = { "<C-w>L", "Expand right" },
    },
})

local wk = require('which-key')

wk.register({["<Esc>"] = {"<C-\\><C-n>", 'Exit insert in terminal'}}, {mode='t'})

wk.register({
  ["<Tab>"] = {":bnext<CR>", "Jump to next buffer"},
  ["<S-Tab>"] = {":bprevious<CR>", "Jump to previous buffer"},
  ["<leader>b"] = {
    name = "+buffer",
    d = {"<cmd>e #<CR>", name = "Jump to recent"},
    b = {"<cmd>bd<CR>", name = "Delete"},
  },

  ["<leader>w"] = {
    name = "+window",
    w = {"<C-w>p", name = "Jump to recent" },
    d = {"<C-w>c", name = "Delete window" },
    s = {"<C-w>s", name = "Split up/down" },
    v = {"<C-w>v", name = "Split left/right" },
    h = {"<C-w>h", name = "Jump left" },
    j = {"<C-w>j", name = "Jump down" },
    k = {"<C-w>k", name = "Jump up" },
    l = {"<C-w>l", name = "Jump right" },
    H = {"<C-w>H", name = "Move left" },
    J = {"<C-w>J", name = "Move down" },
    K = {"<C-w>K", name = "Move up" },
    L = {"<C-w>L", name = "Move right" },
    ["-"] = {"<C-w>s", name = "Split up/down" },
    ["|"] = {"<C-w>v", name = "Split left/right" },
    ["="] = {"<C-w>=", name = "Move right" },
    ["<C-H>"] = {"<C-w>5<", name = "Expand left" },
    ["<C-J>"] = { "<cmd>resize +5<CR>", name = "Expand down" },
    ["<C-K>"] = { "<cmd>resize -5<CR>", name = "Expand up" },
    ["<C-L>"] = { "<C-w>L", name = "Expand right" },
    },

})

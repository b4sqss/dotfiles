local wk = require("which-key")
wk.register(mappings, opts)
wk.register({
  ["<leader>f"] = {
    name = "file",
    f = { "<cmd>NnnPicker<cr>", "File Manager" },
    t = { "<cmd>NnnExplorer<cr>", "Toggle file tree" }, 
    p = { "<cmd>Telescope find_files<cr>", "Find files" },
    g = { function() require('telescope.builtin').grep_string({ search = vim.fn.input("Grep > ") }) end, "Grep" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" }
  },

  ["<leader>c"] = { "<cmd>Telescope project<cr>", "change project" },

  ["<leader>b"] = {
    name = "buffer",
    b = { "<cmd>Telescope buffers<cr>", "change buffers" }
  },
  ["<leader>g"] = {
    name = "git",
    s = { "<cmd>Git<cr>", "git status" }
  },
  ["<leader>t"] = { "<cmd>ToggleTerm<cr>", "Toggle terminal"
},
["<leader>d"] = {
  name = "debugger",
  b = { "<cmd>DapToggleBreakpoint<cr>", "toggle breakpoint" }
},
["<C-c>"] = {
  ["1"] = { "<cmd>close<cr>", "Close" }, 
  ["2"] = { "<cmd>split<cr>", "hsplit" },
  ["3"] = { "<cmd>vsplit<cr>", "vsplit" },
  h = { "<cmd>wincmd h<cr>", "move to left window" },
  j = { "<cmd>wincmd j<cr>", "move to bottom window" },
  k = { "<cmd>wincmd k<cr>", "move to top window" },
  l = { "<cmd>wincmd l<cr>", "move to right window" }
},
})

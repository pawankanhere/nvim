local wk = require("which-key")
require("which-key").setup {
    plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = false, -- adds help for motions
      text_objects = false, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  window = {
    border = "none", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label

  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },

}
wk.register({
    o = {
        name = "Options",
        q = {":q<cr>", "Quit"},
        a = {"gg | V | G","Select all"}
    },
    f = {
        name = "Find",
        f = {"<cmd>Telescope find_files<cr>","Find Files"},
        b = {"<cmd>Telescope buffers<cr>","Find Open Buffers"},
        h = {"<cmd>Telescope help_tags<cr>","Help Docs"},
        g = {"<cmd>Telescope live_grep<cr>","Global Search"},
        c = {"<cmd>Telescope current_buffer_fuzzy_find<cr>","Find in current buffer"},
    },
    z = {
        name = "Fold",
        ["{"] = {"vi{ | zf", "Creates {} fold"},
        ["("] = {"vi( | zf", "Creates () fold"},
        ["t"] = {"vit | zf", "Creates html tag fold"},

    },
    b = {
        name = "Buffers",
        a = {":BufferCloseAllButCurrent<cr>", "Close all buffers"},
        n = {":BufferNext<cr>", "Next Buffer"},
        p = {":BufferPrevious<cr>", "Previous Buffer"},
    },
    g = {
        name = "Go to",
        r = {"<cmd>Telescope coc references<cr>", "Go to references"},
        s = {"<cmd>Telescope coc document_symbols<cr>", "Go to document symbols"},
        d = {"<cmd>Telescope coc workspace_diagnostics<cr>", "Go to diagnostics"},
        t = {"<cmd>TodoTelescope<cr>", "Todo List"}

    },
    c = {
        name = "COC Actions",
        a = {"<Plug>(coc-codeaction)", "Code Actions"},
        d = {"<cmd>CocDiagnostics<cr>","Buffer Diagnostics List"}
    }
},{ prefix = "<leader>"})


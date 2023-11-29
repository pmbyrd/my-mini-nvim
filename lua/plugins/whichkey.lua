return {
  {
    "mrjones2014/legendary.nvim",
    keys = {
      --      { "<leader>hc", "<cmd>Legendary<cr>", desc = "Command Palette" },
    },
    opts = {
      which_key = { auto_register = true },
    },
  },
  {
    "folke/which-key.nvim",
    dependencies = {
      "mrjones2014/legendary.nvim",
    },
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")

      wk.register({
        --h should be the dashboard
        tab = {
          name = "+Tabs",
        },
        a = {
          name = "+Assistants",
          p = { ":", "Command Palette" },
        },
        b = {
          name = "+Buffer",
          -- b = { "<cmd>Telescope buffers<cr>", "Buffers" },
          -- d = { "<cmd>bd<cr>", "Delete" },
          -- n = { "<cmd>bn<cr>", "Next" },
          -- p = { "<cmd>bp<cr>", "Previous" },
          -- s = { "<cmd>w<cr>", "Save" },
        },
        c = {
          name = "+Code",
        },
        D = {
          name = "+Databases",
        },
        d = {
          name = "+Debug",
        },
        f = {
          name = "+File",
        },
        g = {
          name = "+Git",
        },
        q = {
          name = "+Quit",
        },
        t = {
          name = "+Test",
        },
        u = {
          name = "+UI",
        },
        w = {
          name = "+Windows",
        },
        x = {
          name = "+Diagnostics",
        },
        h = {
          name = "Dashboard",
          h = { "<cmd>Dashboard<cr>", "Dashboard" },
          c = { "<cmd>DashboardChangeColorscheme<cr>", "Change Colorscheme" },
          f = { "<cmd>DashboardFindFile<cr>", "Find File" },
          n = { "<cmd>DashboardNewFile<cr>", "New File" },
          r = { "<cmd>DashboardFindHistory<cr>", "Find History" },
          b = { "<cmd>DashboardJumpMark<cr>", "Jump Mark" },
          t = { "<cmd>DashboardJumpMark<cr>", "Jump Mark" },
        },
        -- s if for search
        s = {
          name = "Search",
          n = { name = "+noice" },
        },
        S = {
          --use the key S to save the current buffer
          { "<cmd>w<cr>", "Save" },
        },
      }, { prefix = "<leader>", mode = { "n", "v" } })
    end,
  },
}

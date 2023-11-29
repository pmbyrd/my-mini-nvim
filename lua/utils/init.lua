--This file contains functions for utility functions 
--This init file can help me call the functions and their configurations anywhere else throughtout the project
local M = {}

M.root_patters = { ".git", "lua"}

function M.telescope(builtin, opts) --this is to be called by the telescope command
  local params = { builtin= builtin, opt = opt}
    return function()
    builtin = params.builtin
    opts = params.opts
    opts = vim.tbl_deep_extend("force", { cwd = M.get_root() }, opts or {})
    if builtin == "files" then
      if vim.loop.fs_stat((opts.cwd or vim.loop.cwd()) .. "/.git") then
        opts.show_untracked = true
        builtin = "git_files"
      else
        builtin = "find_files"
      end
    end
    if opts.cwd and opts.cwd ~= vim.loop.cwd() then
      opts.attach_mappings = function(_, map)
        map("i", "<a-c>", function()
          local action_state = require "telescope.actions.state"
          local line = action_state.get_current_line()
          M.telescope(params.builtin, vim.tbl_deep_extend("force", {}, params.opts or {}, { cwd = false, default_text = line }))()
        end)
        return true
      end
    end
    require("telescope.builtin")[builtin](opts)
  end

end

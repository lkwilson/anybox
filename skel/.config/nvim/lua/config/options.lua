-- Opt into formatting on save per project or with LazyVim's format toggles.
vim.g.autoformat = false
vim.opt.conceallevel = 0
vim.opt.clipboard = "unnamedplus"

-- Use the native clipboard locally, including inside tmux. Over SSH, send
-- copies to the local terminal without querying it for clipboard contents.
if vim.env.SSH_TTY or vim.env.SSH_CONNECTION then
  local osc52 = require("vim.ui.clipboard.osc52")
  local contents = { ["+"] = { {}, "v" }, ["*"] = { {}, "v" } }
  local function copy(reg)
    local send = osc52.copy(reg)
    return function(lines, regtype)
      contents[reg] = { vim.deepcopy(lines), regtype }
      send(lines)
    end
  end
  local function paste(reg)
    return function()
      return vim.deepcopy(contents[reg])
    end
  end
  vim.g.clipboard = {
    name = "OSC 52 copy only",
    copy = { ["+"] = copy("+"), ["*"] = copy("*") },
    paste = { ["+"] = paste("+"), ["*"] = paste("*") },
  }
end

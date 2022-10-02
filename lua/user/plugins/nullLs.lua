local status_ok, nullls = pcall(require, "null-ls")
if not status_ok then
  return
end

local formatting = nullls.builtins.formatting
local code_actions = nullls.builtins.code_actions

nullls.setup {
  on_attach = require("user.plugins.lsp").on_attach,
  sources = {
    code_actions.gitsigns,
    formatting.stylua,
    formatting.prettierd,
  },
}

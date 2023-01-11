return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    local status_ok, mson = pcall(require, "mason-lspconfig")
    if not status_ok then
      return
    end
    local lsp_ok, lsp = pcall(require, "user.plugins.lsp")
    if not lsp_ok then
      return
    end
    lsp.setup()

    mson.setup {
      ensure_installed = { "clangd", "pyright", "emmet_ls", "tsserver", "sumneko_lua", "cssls", "html", "eslint" },
    }

    mson.setup_handlers {
      -- The first entry (without a key) will be the default handler
      -- and will be called for each installed server that doesn't have
      -- a dedicated handler.
      function(server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {
          on_attach = lsp.on_attach,
          capabilities = lsp.capabilities,
          single_file_support = true,
        }
      end,
      -- Next, you can provide targeted overrides for specific servers.
      -- For example, a handler override for the `rust_analyzer`:
      -- ["rust_analyzer"] = function()
      -- 	require("rust-tools").setup({})
      -- end,
    }
  end,
}

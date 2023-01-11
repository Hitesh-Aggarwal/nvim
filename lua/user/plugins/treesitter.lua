return {
  "nvim-treesitter/nvim-treesitter",
  build = function()
    require("nvim-treesitter.install").update { with_sync = true }
  end,
  config = function()
    require("nvim-treesitter.configs").setup {
      ensure_installed = { "c", "cpp", "python", "lua", "vim", "javascript", "bash" },
      sync_install = false,
      highlight = {
        enable = true,
      },
    }
  end,
}

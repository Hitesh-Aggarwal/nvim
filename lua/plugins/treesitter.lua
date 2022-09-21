local status_ok, treesitter = pcall(require, "nvim-treesitter")
if not status_ok then
  return
end

if jit.os == "Windows" then
  treesitter.compilers = { "clang" }
end

require("nvim-treesitter.configs").setup {
  ensure_installed = { "c", "cpp", "python", "lua", "vim", "javascript", "bash" },
  sync_install = false,
  highlight = {
    enable = true,
  },
}

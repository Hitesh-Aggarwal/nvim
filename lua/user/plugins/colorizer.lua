return {
  "norcalli/nvim-colorizer.lua",
  ft = { "html", "css", "javascript" },
  config = function()
    require("colorizer").setup {
      css = { css = true },
      html = { css = true },
      javascript = { css = true },
    }
  end,
}

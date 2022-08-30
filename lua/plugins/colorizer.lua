local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
  return
end

colorizer.setup {
  css = { css = true };
  html = { css = true };
  javascript = { css = true };
}

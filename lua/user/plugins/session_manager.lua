local mgr_ok, mgr = pcall(require, "session_manager")
if not mgr_ok then
  return
end

mgr.setup {
  autoload_mode = require("session_manager.config").AutoloadMode.CurrentDir,
}

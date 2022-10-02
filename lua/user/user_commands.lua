local attatch_to_buffer = function(output_bufnr, pattern, command)
  vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("magic", { clear = true }),
    pattern = pattern,
    callback = function()
      local append_data = function(_, data)
        if data then
          vim.api.nvim_buf_set_lines(output_bufnr, -1, -1, false, data)
        end
      end

      vim.api.nvim_buf_set_lines(output_bufnr, 0, -1, false, { "Outputs:" })
      vim.fn.jobstart(command, {
        stdout_buffered = true,
        on_stdout = append_data,
        on_stderr = append_data,
      })
    end,
  })
end

local insert_gates = function()
  local gatename = vim.fn.substitute(string.upper(vim.fn.expand "%:t"), "\\.", "_", "g")
  vim.api.nvim_buf_set_lines(0, 0, 0, false, { "#ifndef " .. gatename })
  vim.api.nvim_buf_set_lines(0, 1, 1, false, { "#define " .. gatename })
  vim.api.nvim_buf_set_lines(0, -1, -1, false, { "#endif /* " .. gatename .. " */" })
end

vim.api.nvim_create_user_command("AutoRun", function()
  local bufnr = vim.fn.input "Bufnr: "
  local pattern = vim.fn.input "Pattern: "
  local command = vim.split(vim.fn.input "Command: ", " ")
  attatch_to_buffer(tonumber(bufnr), pattern, command)
end, {})

vim.api.nvim_create_user_command("AutoMagic", function()
  local bufnr = tonumber(vim.fn.input "Bufnr: ")
  local pattern = vim.fn.expand "%"
  local filetype = string.lower(vim.bo.filetype)
  if filetype == "javascript" then
    attatch_to_buffer(bufnr, pattern, { "node", pattern })
  elseif filetype == "python" then
    attatch_to_buffer(bufnr, pattern, { "python3", pattern })
  elseif filetype == "c" or filetype == "cpp" then
    attatch_to_buffer(bufnr, pattern, { "make" })
  else
    print "Sorry, no magic available for current filetype"
  end
end, {})

vim.api.nvim_create_user_command("HeaderGates", insert_gates, {})

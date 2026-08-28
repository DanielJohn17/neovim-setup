local M = {}

function M.local_ts_major()
  local pkg = vim.fn.getcwd() .. "/node_modules/typescript/package.json"
  local ok, content = pcall(vim.fn.readfile, pkg)
  if ok and content and #content > 0 then
    local decoded = vim.json.decode(table.concat(content, "\n"))
    if decoded and decoded.version then
      return tonumber(decoded.version:match("^(%d+)"))
    end
  end
  return nil
end

return M

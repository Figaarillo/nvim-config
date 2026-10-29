-- Load environment variables from .env
local env_file = vim.fn.stdpath("config") .. "/.env"
if vim.fn.filereadable(env_file) == 1 then
  for _, line in ipairs(vim.fn.readfile(env_file)) do
    local key, value = line:match("^([^=]+)=(.*)$")
    if key and value then
      vim.env[key] = value
    end
  end
end

require("config.lazy")

if true then
  return {}
end

return {
  "smjonas/inc-rename.nvim",
  cmd = "IncRaname",
  event = { "BufReadPre", "BufNewFile" },
  config = true,
}

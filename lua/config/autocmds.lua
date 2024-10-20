-- =================== Speed up loading Lua modules =================
vim.loader.enable()

-- ============================= Neovide ============================
if vim.g.neovide then
  vim.o.guifont = "Operator Mono Lig:h6"
  -- vim.o.guifont = "CaskaydiaCove Nerd Font Mono:h5.1"
  -- vim.o.guifont = "VictorMono Nerd Font:h5.1:b"
  vim.opt.linespace = 2
  vim.g.neovide_scale_factor = 2
  vim.g.neovide_transparency = 1
  vim.g.neovide_background_color = "#0B0E14"
  vim.g.neovide_refresh_rate = 60
  vim.g.neovide_cursor_vfx_mode = "pixiedust"
  vim.g.neovide_remember_window_size = true
end

-- ========================== Change font size =========================
local change_scale_factor = function(delta)
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
end
vim.keymap.set("n", "<C-=>", function()
  change_scale_factor(1.25)
end)
vim.keymap.set("n", "<C-->", function()
  change_scale_factor(1 / 1.25)
end)

-- ============ Turn off paste mode when leaving insert mode ===========
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

-- ================== fix conceallevel for json files ==================
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc" },
  callback = function()
    vim.wo.spell = false
    vim.wo.conceallevel = 0
  end,
})

vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

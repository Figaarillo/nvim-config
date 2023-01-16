local status, bluloco = pcall(require, "bluloco")
if not status then
	return
end

bluloco.setup({
	style = "auto", -- "auto" | "dark" | "light"
	transparent = false,
	italics = true,
	terminal = vim.fn.has("gui_running") == 1, -- bluoco colors are enabled in gui terminals per default.
})

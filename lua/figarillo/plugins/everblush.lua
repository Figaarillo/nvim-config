local status_ok, everblush = pcall(require, "everblush")
if not status_ok then
	return
end

everblush.setup({
	nvim_tree = { contrast = true },
	transparent_background = false,
}) -- or use contrast = false to not apply contrast

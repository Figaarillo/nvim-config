local status, everblush = pcall(require, "everblush")
if not status then
	return
end

everblush.setup({
	nvim_tree = { contrast = true },
	transparent_background = false,
}) -- or use contrast = false to not apply contrast

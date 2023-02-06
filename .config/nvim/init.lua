require("slydragonn.settings")
require("slydragonn.maps")
require("slydragonn.plugins")

local themeStatus, kanagawa = pcall(require, "kanagawa")

if themeStatus then
	vim.cmd("colorscheme kanagawa")
else
	return
end

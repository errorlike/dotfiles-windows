-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Mocha" -- or Macchiato, Frappe, Latte
-- This is where you actually apply your config choices
config.font = wezterm.font('Cascadia Code NF')
config.font_size = 13
config.line_height =1.2
config.window_close_confirmation = "NeverPrompt"
config.enable_tab_bar = false
-- config.window_decorations = "RESIZE"
config.default_domain = 'WSL:Ubuntu'
local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
	local screen = wezterm.gui.screens().main
	local ratio = 0.8
	local width, height = screen.width * ratio, screen.height * ratio
	local tab, pane, window = wezterm.mux.spawn_window(cmd or {
		position = { x = (screen.width - width) / 2, y = (screen.height - height) / 2 },
	})
	-- window:gui_window():maximize()
	window:gui_window():set_inner_size(width, height)
end)

-- and finally, return the configuration to wezterm
return config
local wezterm = require("wezterm")

local config = {
	font = wezterm.font("Iosevka NFM"),
	audible_bell = "Disabled",
	font_size = 15,
	max_fps = 30,

	use_fancy_tab_bar = false,
	show_tabs_in_tab_bar = true,
	show_new_tab_button_in_tab_bar = true,
	tab_max_width = 32,

	enable_wayland = false,
	window_decorations = "TITLE|RESIZE",

	allow_square_glyphs_to_overflow_width = "WhenFollowedBySpace",
}

config.visual_bell = {
	fade_in_function = "EaseIn",
	fade_in_duration_ms = 150,
	fade_out_function = "EaseOut",
	fade_out_duration_ms = 150,
}

config.keys = {}

-- begin: color_scheme
config.color_scheme = "Catppuccin Mocha"
-- end: color_scheme

return config

-- vim: tabstop=2 softtabstop=2 shiftwidth=2 expandtab

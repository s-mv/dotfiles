---@module 'hl'
require("monitors")

local terminal = "alacritty -o font.size=10"
local fileManager = "pcmanfm"
local menu = "pkill rofi || rofi -show drun -show-icons"

local mainMod = "SUPER"

-- exec-once = ~/.config/waybar/hover.sh

hl.env("XCURSOR_SIZE", 24)
hl.env("HYPRCURSOR_SIZE", 24)
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.bind("Print", hl.dsp.exec_cmd("flameshot gui"))

hl.config({
	general = {
		gaps_in = 3,
		gaps_out = 6,
		border_size = 1,
		resize_on_border = true,
		allow_tearing = false,
		layout = "dwindle",
	},
})

hl.config({
	decoration = {
		rounding = 2,
		rounding_power = 2,
		active_opacity = 1.0,
		inactive_opacity = 1.0,
		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = "rgba(1a1a1aee)",
		},
		blur = {
			enabled = false,
		},
	},
})

hl.config({
	animations = {
		enabled = true,
	},
})

hl.config({
	dwindle = {
		preserve_split = true,
	},
})

hl.config({
	master = {
		new_status = "master",
	},
})

hl.config({
	cursor = {
		zoom_disable_aa = true,
	},
})

local no_bg = os.getenv("NO_BG")

hl.config({
	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = true,
		background_color = no_bg and "rgb(040108)",
	},
})

hl.config({
	input = {
		kb_layout = "us",
		follow_mouse = 1,
		sensitivity = 0,
		touchpad = {
			natural_scroll = true,
		},
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

hl.gesture({
	fingers = 3,
	direction = "left",
	mods = "SHIFT",
	action = "move",
})

hl.gesture({
	fingers = 3,
	direction = "right",
	mods = "SHIFT",
	action = "move",
})

hl.gesture({
	fingers = 3,
	direction = "left",
	mods = "CTRL",
	action = function()
		hl.dispatch(hl.dsp.window.move({ workspace = "e-1" }))
	end,
})

hl.gesture({
	fingers = 3,
	direction = "right",
	mods = "CTRL",
	action = function()
		hl.dispatch(hl.dsp.window.move({ workspace = "e+1" }))
	end,
})

hl.gesture({
	fingers = 3,
	mods = "CTRL",
	direction = "pinch",
	action = "cursorZoom",
	zoom_level = 1,
	mode = "live",
})

hl.bind(mainMod .. " + " .. "Return", hl.dsp.exec_cmd(terminal))
hl.bind(
	mainMod .. " + " .. "SHIFT" .. " + " .. "Return",
	hl.dsp.exec_cmd("[float; move 1080 540; size 720 480] " .. terminal)
)
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "F", hl.dsp.exec_cmd("firefox"))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "P", hl.dsp.exec_cmd("firefox --private-window"))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "Q", hl.dsp.window.close())
hl.bind(mainMod .. " + " .. "M", hl.dsp.window.move({ workspace = "special:min" }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "M", hl.dsp.workspace.toggle_special("min"))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "space", hl.dsp.window.float())
hl.bind(mainMod .. " + " .. "SUPER_L", hl.dsp.exec_cmd(menu), { release = true })
hl.bind(mainMod .. " + " .. "Escape", hl.dsp.exec_cmd("~/.config/hypr/powermenu.sh"))
hl.bind(mainMod .. " + " .. "P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + " .. "J", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + " .. "F", hl.dsp.window.fullscreen())

-- TODO: manual review (unknown dispatcher: resizeactive)
-- hl.bind("$mainMod + ALT + left", hl.dsp.resizeactive("-20 0"))

-- TODO: manual review (unknown dispatcher: resizeactive)
-- hl.bind("$mainMod + ALT + right", hl.dsp.resizeactive("20 0"))

-- TODO: manual review (unknown dispatcher: resizeactive)
-- hl.bind("$mainMod + ALT + up", hl.dsp.resizeactive("0 -20"))

-- TODO: manual review (unknown dispatcher: resizeactive)
-- hl.bind("$mainMod + ALT + down", hl.dsp.resizeactive("0 20"))

hl.bind(mainMod .. " + " .. "mouse:272", hl.dsp.window.drag(), { mouse = true })

hl.bind(mainMod .. " + " .. "mouse:273", hl.dsp.window.resize(), { mouse = true })

-- bind = $mainMod, H, movefocus, l
-- bind = $mainMod, J, movefocus, d
-- bind = $mainMod, K, movefocus, u
-- bind = $mainMod, L, movefocus, r

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "down", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "right", hl.dsp.focus({ direction = "right" }))

hl.bind(mainMod .. " + CTRL + left", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + CTRL + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + CTRL + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + CTRL + down", hl.dsp.window.move({ direction = "down" }))

hl.bind("SUPER" .. " + " .. "Tab", hl.dsp.window.cycle_next())

-- hl.bind("SUPER + Tab", hl.dsp.bringactivetotop())
hl.bind(mainMod .. " + " .. "right", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + " .. "left", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + " .. "mouse_down", hl.dsp.focus({ workspace = "e+1" }), { pass = "none" })
hl.bind(mainMod .. " + " .. "mouse_up", hl.dsp.focus({ workspace = "e-1" }), { pass = "none" })

hl.bind(mainMod .. " + CTRL + SHIFT + right", hl.dsp.window.move({ workspace = "e+1" }))
hl.bind(mainMod .. " + CTRL + SHIFT + left", hl.dsp.window.move({ workspace = "e-1" }))

hl.bind(mainMod .. " + " .. 1, hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + " .. 2, hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + " .. 3, hl.dsp.focus({ workspace = 3 }))
hl.bind(mainMod .. " + " .. 4, hl.dsp.focus({ workspace = 4 }))
hl.bind(mainMod .. " + " .. 5, hl.dsp.focus({ workspace = 5 }))
hl.bind(mainMod .. " + " .. 6, hl.dsp.focus({ workspace = 6 }))
hl.bind(mainMod .. " + " .. 7, hl.dsp.focus({ workspace = 7 }))
hl.bind(mainMod .. " + " .. 8, hl.dsp.focus({ workspace = 8 }))
hl.bind(mainMod .. " + " .. 9, hl.dsp.focus({ workspace = 9 }))
hl.bind(mainMod .. " + " .. 0, hl.dsp.focus({ workspace = 10 }))

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 1, hl.dsp.window.move({ workspace = 1 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 2, hl.dsp.window.move({ workspace = 2 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 3, hl.dsp.window.move({ workspace = 3 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 4, hl.dsp.window.move({ workspace = 4 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 5, hl.dsp.window.move({ workspace = 5 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 6, hl.dsp.window.move({ workspace = 6 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 7, hl.dsp.window.move({ workspace = 7 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 8, hl.dsp.window.move({ workspace = 8 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 9, hl.dsp.window.move({ workspace = 9 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 0, hl.dsp.window.move({ workspace = 10 }))

hl.window_rule({
	name = "suppress-maximize",
	match = {
		class = ".*",
	},
	suppress_event = "maximize",
})

hl.window_rule({
	name = "xwayland-drag-fix",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		fullscreen = false,
	},
	no_initial_focus = true,
})

hl.on("hyprland.start", function()
	hl.exec_cmd("waybar")
	hl.exec_cmd("nm-applet")
	hl.exec_cmd("xss-lock -- i3lock")
	hl.exec_cmd("nwg-drawer -r")
	if os.getenv("NO_BG") then
	else
		hl.exec_cmd("~/.config/sway/randomwall.sh")
	end
end)

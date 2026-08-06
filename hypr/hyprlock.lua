---@module 'hl'
hl.config({
    background = {
        color = { "rgb(0", 0, "0)" },
    },
})

hl.config({
    label = {
        text = "Locked",
        font_size = 20,
        font_family = "Monospace",
        position = { 0, 0 },
        halign = "center",
        valign = "center",
    },
})

hl.config({
    input-field = {
        size = { 400, 80 },
        position = { 0, -128 },
        halign = "center",
        valign = "center",
        outline_thickness = 0,
        rounding = 0,
        inner_color = { "rgb(0", 0, "0)" },
        font_color = { "rgb(255", 255, "255)" },
        placeholder_text = "Password",
        fade_on_empty = false,
    },
})
-- NOTE: Section 'input-field' may be a plugin or custom section; verify the output

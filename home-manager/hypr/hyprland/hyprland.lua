------------------- MONITORS -------------------
hl.monitor({ output = "eDP-1",    mode = "1920x1080@60", position = "0x0",    scale = 1 })
hl.monitor({ output = "HDMI-A-1", mode = "3440x1440@60", position = "1920x0", scale = 1 })

------------------- LOOK & FEEL -------------------
hl.config({
    general = {
        gaps_out = 10,
        gaps_in  = 2,
    },
    decoration = {
        rounding = 10,
    },
})

-- animation = "global, 1, 2, default"
hl.animation({ leaf = "global", enabled = true, speed = 2, bezier = "default" })

------------------- AUTOSTART -------------------
hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("hyprsunset")
end)

------------------- INPUT -------------------
hl.config({
    input = {
        kb_layout    = "de,us",
        kb_options   = "grp:win_space_toggle",
        follow_mouse = 1,
        touchpad = {
            natural_scroll       = true,
            disable_while_typing = false,
        },
    },
})

------------------- KEYBINDINGS -------------------
local mainMod = "SUPER"

hl.bind(mainMod .. " + M",         hl.dsp.exit())
hl.bind(mainMod .. " + SHIFT + X", hl.dsp.window.close())
hl.bind(mainMod .. " + A",         hl.dsp.exec_cmd("fuzzel"))
hl.bind(mainMod .. " + F",         hl.dsp.exec_cmd("librewolf"))
hl.bind(mainMod .. " + Q",         hl.dsp.exec_cmd("ghostty"))
hl.bind(mainMod .. " + L",         hl.dsp.exec_cmd("hyprlock"))

hl.bind("F2", hl.dsp.exec_cmd("brightnessctl s 10%-"))
hl.bind("F3", hl.dsp.exec_cmd("brightnessctl s +10%"))
hl.bind("F6", hl.dsp.exec_cmd("amixer set Master toggle"))
hl.bind("F7", hl.dsp.exec_cmd("amixer set Master 10%-"))
hl.bind("F8", hl.dsp.exec_cmd("amixer set Master 10%+"))

hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })

hl.bind(mainMod .. " + S",         hl.dsp.exec_cmd("hyprshot -m window -m active -o ~/screenshots/"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region -m active -o ~/screenshots/"))

hl.bind(mainMod .. " + B",         hl.dsp.exec_cmd("hyprctl hyprsunset temperature 2800"))
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd("hyprctl hyprsunset identity"))

-- Workspaces 1-10 (Taste 0 = WS 10)
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- bindl: Lid Switch
hl.bind("switch:on:Lid Switch",  hl.dsp.exec_cmd('hyprctl keyword monitor "eDP-1, disable"'),            { locked = true })
hl.bind("switch:off:Lid Switch", hl.dsp.exec_cmd('hyprctl keyword monitor "eDP-1, 1920x1080, 0x0, 1"'), { locked = true })

------------------- WINDOW RULES -------------------
hl.window_rule({ match = { class = "kitty" },   opacity = "0.8 override 0.8 override" })
hl.window_rule({ match = { class = "ghostty" }, opacity = "0.8 override 0.8 override" })
hl.window_rule({ match = { class = "discord" }, opacity = "0.8 override 0.8 override" })
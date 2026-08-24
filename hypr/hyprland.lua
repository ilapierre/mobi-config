local colors = dofile(os.getenv("HOME") .. "/.config/hypr/colors.lua")

------------------
-- PROGRAMS
------------------

local terminal    = "kitty"
local fileManager = "thunar"
local ipc         = "noctalia msg "
local mainMod     = "SUPER"

------------------
-- ENVIRONMENT VARIABLES
------------------

hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("LIBVA_DRIVER_NAME",    "iHD")
hl.env("VDPAU_DRIVER",         "va_gl")
hl.env("MOZ_ENABLE_WAYLAND",   "1")

------------------
-- AUTOSTART
------------------

-- exec-once equivalent: fires only at startup, not on config reload
hl.on("hyprland.start", function()
    hl.exec_cmd("noctalia")
end)

-- exec equivalent: runs on every config reload
hl.exec_cmd('gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"')
hl.exec_cmd('gsettings set org.gnome.desktop.interface gtk-theme "adw-gtk3-dark"')

------------------
-- LOOK AND FEEL
------------------

hl.config({
    general = {
        gaps_in     = 5,
        gaps_out    = 10,
        border_size = 0,
    },
    decoration = {
        rounding       = 20,
        rounding_power = 2,
        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = "0xee1a1a1a",
        },
        blur = {
            enabled  = true,
            size     = 3,
            passes   = 2,
            vibrancy = 0.1696,
        },
    },
    animations = {
        enabled = true,
    },
    dwindle = {
        preserve_split = true,
    },
    master = {
        new_status = "master",
    },
    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo   = false,
    },
    input = {
        kb_layout  = "us,ca",
        kb_variant = ",fr",
        kb_model   = "",
        kb_options = "grp:alt_shift_toggle",
        kb_rules   = "",
        follow_mouse = 1,
        sensitivity  = 0,
        touchpad = {
            natural_scroll = true,
        },
    },
})

------------------
-- LAYER RULES
------------------

hl.layer_rule({
    name  = "noctalia",
    match = { namespace = "noctalia-background-.*$" },
    ignore_alpha = 0.5,
    blur         = true,
    blur_popups  = true,
})

------------------
-- ANIMATIONS
------------------

--       NAME              X0     Y0      X1     Y1
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1} } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1} } })
hl.curve("linear",         { type = "bezier", points = { {0,    0},    {1,    1} } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5,  0.5},  {0.75, 1} } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1,  1} } })

--            LEAF             ONOFF   SPEED   CURVE            [STYLE]
hl.animation({ leaf = "global",        enabled = true, speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn",     enabled = true, speed = 4.1,  bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true, speed = 1.49, bezier = "linear",        style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true, speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true, speed = 1.5,  bezier = "linear",        style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true, speed = 7,    bezier = "quick" })

------------------
-- INPUT
------------------

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})

------------------
-- KEYBINDINGS
------------------

-- Applications
hl.bind(mainMod .. "+RETURN",  hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. "+SHIFT+Q", hl.dsp.window.close())
hl.bind(mainMod .. "+M",       hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit"))
hl.bind(mainMod .. "+E",       hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. "+V",       hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. "+D",       hl.dsp.exec_cmd(ipc .. " panel-toggle launcher"))
hl.bind(mainMod .. "+P",       hl.dsp.window.pseudo())
hl.bind(mainMod .. "+SHIFT+J", hl.dsp.layout("togglesplit"))

-- Focus
hl.bind(mainMod .. "+H", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. "+L", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. "+K", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. "+J", hl.dsp.focus({ direction = "d" }))

-- Workspaces 1–10
for i = 1, 9 do
    hl.bind(mainMod .. "+" .. i,       hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. "+SHIFT+" .. i, hl.dsp.window.move({ workspace = i }))
end
hl.bind(mainMod .. "+0",       hl.dsp.focus({ workspace = 10 }))
hl.bind(mainMod .. "+SHIFT+0", hl.dsp.window.move({ workspace = 10 }))

-- Special workspace (scratchpad)
hl.bind(mainMod .. "+S",       hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. "+SHIFT+S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through workspaces
hl.bind(mainMod .. "+mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. "+mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Fullscreen
hl.bind(mainMod .. "+F", hl.dsp.window.fullscreen())

-- Move/resize windows with mouse drag
hl.bind(mainMod .. "+mouse:272", hl.dsp.window.drag())
hl.bind(mainMod .. "+mouse:273", hl.dsp.window.resize())

-- Volume and brightness (repeat + locked)
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { ["repeat"] = true, locked = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),       { ["repeat"] = true, locked = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),      { ["repeat"] = true, locked = true })
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),    { ["repeat"] = true, locked = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                   { ["repeat"] = true, locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                   { ["repeat"] = true, locked = true })

-- Media keys (locked)
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- Screenshot
hl.bind("ALT+P", hl.dsp.exec_cmd("hyprshot -m region"))

------------------
-- WINDOW RULES
------------------

hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})

hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },
    move  = "20 monitor_h-120",
    float = true,
})

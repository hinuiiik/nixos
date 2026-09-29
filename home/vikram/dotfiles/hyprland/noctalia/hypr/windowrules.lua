hl.window_rule({
    name = "Picture-in-Picture",
    match = {
        title = [[^([Pp]icture[-\s]?[Ii]n[-\s]?[Pp]icture)(.*)$]]
    },
    float = true,
    pin = true,
    focus_on_activate = false,
    no_initial_focus = true,
    suppress_event = "activate"
})

hl.window_rule({
    name = "Dolphin",
    match = {
        class = "org.kde.dolphin"
    },
    float = true,
	size={"(monitor_w*0.5)", "(monitor_h*0.5)"},
})

hl.window_rule({
    name = "Ark",
    match = {
        class = "org.kde.ark"
    },
    float = true,
})

hl.window_rule({
    name = "Moonlight",
    match = {
        class ="com.moonlight_stream.Moonlight"
    },
    fullscreen = true
})

-- hl.window_rule({
-- 	name = "osu",
--     match = {
--         class = "^(osu!|osu!lazer|osu.exe)$"
--     }
--     #noanim=true,          -- Disables window opening/closing/minimize animations
--     #blur=false,      -- Disables background blur underneath the window
--     #rounding = 0,     -- Removes rounded corners to save GPU fragment shading
--     #immediate = true,       -- Forces direct scanout (tearing/unbuffered page flips) for zero latency
-- })

hl.window_rule({
    name = "osu",
    match = {
        class ="^(osu!|osu!lazer|osu.exe)$"
    },
    fullscreen = true,
--     immediate = true,
    rounding = 0,
    no_blur = true,
    no_shadow = true,
    no_anim = true,
})

hl.window_rule({
    name = "gamescope",
    match = {
        class ="gamescope"
    },
    fullscreen = true,
--     immediate = true,
--     rounding = 0,
--     no_blur = true,
--     no_shadow = true,
--     no_anim = true,
})

hl.window_rule({
	name = "jetbrains-toolbox",
	match = {
		class="jetbrains-toolbox"	
	},
	float = true,
	center = true,
	fullscreen = true,
})

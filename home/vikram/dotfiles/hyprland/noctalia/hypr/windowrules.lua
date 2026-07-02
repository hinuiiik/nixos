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

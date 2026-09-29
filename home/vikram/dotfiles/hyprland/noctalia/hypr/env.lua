hl.env("QT_QPA_PLATFORMTHEME","qt6ct")
hl.env("HYPRCURSOR_THEME", "macOS-hypr")
hl.env("HYPRCURSOR_SIZE", "28")

hl.env("XCURSOR_SIZE", "28")

hl.config({
  xwayland = {
    force_zero_scaling = true
  }
})

hl.env("GDK_SCALE", "1.25")
hl.env("AQ_NO_MODIFIERS", "1")

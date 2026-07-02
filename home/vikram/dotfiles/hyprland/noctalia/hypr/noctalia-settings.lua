hl.config({
  animations = {
        enabled = true,
    },
  general = {
    gaps_in = 10,
    gaps_out = 20,
  },

  decoration = {
    rounding = 10,
    rounding_power = 2,

    shadow = {
      enabled = true,
      range = 4,
      render_power = 3,
      color = 0xee1a1a1a,
    },

    blur = {
      enabled = true,
      size = 3,
      passes = 2,
      vibrancy = 0.1696,
    },
  },
})

-- hl.workspace_rule({ workspace = "1", monitor = "Virtual-1", persistent = true })
-- hl.workspace_rule({ workspace = "2", monitor = "Virtual-1", persistent = true })
-- hl.workspace_rule({ workspace = "3", monitor = "Virtual-1", persistent = true })
-- hl.workspace_rule({ workspace = "4", monitor = "Virtual-1", persistent = true })
-- hl.workspace_rule({ workspace = "5", monitor = "Virtual-1", persistent = true })

hl.layer_rule({
  name = "noctalia",
  match = {
    namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd)$",
  },
  ignore_alpha = 0.5,
  blur = true,
  blur_popups = true,
})
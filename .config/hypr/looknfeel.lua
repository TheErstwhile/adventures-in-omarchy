-- Change the default Omarchy look'n'feel.

-- https://wiki.hypr.land/Configuring/Basics/Variables/#general
hl.config({
  general = {
--     -- No gaps between windows or borders.
--     gaps_in = 0,
--     gaps_out = 0,
--     border_size = 0,
--
--     --  default to dwindle layout
       layout = "dwindle",
  },
})

-- https://wiki.hypr.land/Configuring/Basics/Variables/#decoration
hl.config({
  decoration = {
--   Use round window corners.
     rounding = 8,
--   Dim unfocused windows (0.0 = no dim, 1.0 = fully dimmed).
     dim_inactive = true,
     dim_strength = 0.3,
  },
})

-- https://wiki.hypr.land/Configuring/Basics/Variables/#animations
-- a bezier curve that causes window animation to over and under correct (shift off scrren)
hl.curve( "overshoot_transition", { type = "bezier", points = { {-1.00, -0.5}, {0.5, 1.5} } } )
-- a bezier curve that causes a window to start moving hesitantly
hl.curve( "hesitate", { type = "bezier", points = { {0, 0.5}, {1, 0.5} } } )
-- a bezier curve that will move a window bakwards sligtly then shoot it forward
hl.curve( "windup", { type = "bezier", points = { {0.5, 0}, {0.5, -1} } } )
-- a bezier curve with a gentile start, fast middle, and gentile end
hl.curve( "easeinout", { type = "bezier", points = { {0.5, 0}, {0.5, 1} } } )
-- a spring curve that is supposed to bounce, but i don't see it
hl.curve( "bounce", { type = "spring", mass = 1, stiffness = 70, dampening = 10 } )

-- enable animation
hl.config({
  animations = {
    enabled = true,
  },
})

-- create the fade animation for desktop items
hl.animation( { leaf = "fade", enabled = true, speed = 8, bezier = "easeinout" } )
-- create the transition between workspaces
hl.animation( { leaf = "workspaces", enabled = true, speed = 8, bezier = "windup", style = "slide"} )
-- set winow slide (movement and  placment) animaition
hl.animation( { leaf = "windows", enabled = true, speed = 5, bezier = "easeinout", style = "slide" } )
-- set window appear animation
hl.animation( { leaf = "windowsIn", enabled = true, speed = 5, bezier = "hesitate" } )
-- set window disappear animation
hl.animation( { leaf = "windowsOut", enabled = true, speed = 8, bezier = "hesitate" } )

-- https://wiki.hypr.land/Configuring/Basics/Variables/#layout
-- hl.config({
--   layout = {
--     -- Avoid overly wide single-window layouts on wide screens.
--     single_window_aspect_ratio = { 1, 1 },
--   },
-- })

-- https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/
hl.config({
  scrolling = {
    -- See two columns per screen when scrolling at 100% fill
    column_width = 0.5,
  },
})


-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set:
--   omarchy_preinstalled_bindings = false

-- Add a new binding.
-- o.bind("SUPER + SHIFT + R", "SSH", "alacritty -e ssh your-server")

-- Change an existing binding by unbinding it first, then binding the key again.
-- This example changes SUPER+SPACE from the launcher to the Omarchy root menu.
-- hl.unbind("SUPER + SPACE")
-- o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-menu toggle root")

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + SHIFT + B")

-- Logitech MX Keys examples:
-- o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")
-- o.bind("SUPER + H", nil, "voxtype record toggle")
-- o.bind("SUPER + PERIOD", nil, "omarchy-shell shell toggle omarchy.emojis")

-- No need for Google Maps 
hl.unbind("SUPER + SHIFT + S")
o.bind("SUPER + SHIFT + S", "Screen Capture", "omarchy-capture-screenshot")

-- Screensaver Hot Key
hl.unbind("SUPER + N")
o.bind("SUPER + N", "Screensaver", "omarchy-launch-screensaver force")

-- Disable CTRL + ALT + DEL (close all windows)
hl.unbind("CTRL + ALT + DELETE")
-- o.bind("CTRL + ALT + DELETE", "Lock System and Screensaver", "omarchy-system-lock && omarchy-launch-screensaver force")
o.bind("CTRL + ALT + DELETE", "Lock system", "omarchy-system-lock")

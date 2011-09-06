import XMonad
import XMonad.Util.EZConfig
import XMonad.Config.Gnome

myWorkspaces = ["web", "code", "other"]

main = xmonad $ gnomeConfig 
    { terminal = "gnome-terminal"
    , modMask = mod4Mask
    , borderWidth = 3
    , workspaces = myWorkspaces
    }
    `additionalKeysP`
        [ ("M-S-q", spawn "gnome-session-save --gui --logout-dialog") -- ie mod-shift-q logs out
        ]

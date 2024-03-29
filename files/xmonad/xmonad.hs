-- [[file:xmonad.org::*Summary][Summary:1]]
-- [[[[file:~/.dotfiles/files/xmonad/xmonad.org::*Summary][Summary]]][]]
-- Default
import XMonad
import XMonad.Hooks.DynamicLog
import Data.List
-- import Data.Monoid
import Data.Ratio ((%))
import Data.Maybe
import qualified Data.Map as M
import qualified XMonad.StackSet as W
-- import System.Exit
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
    ( avoidStruts, docks, manageDocks )
import XMonad.Hooks.ServerMode
-- Addons
import XMonad.Actions.CopyWindow
import XMonad.Actions.FloatKeys
import XMonad.Actions.WorkspaceNames
import XMonad.Hooks.InsertPosition
import XMonad.Hooks.RefocusLast
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Layout.ToggleLayouts
import XMonad.Util.Loggers
--
import Graphics.X11.ExtraTypes.XF86

import Text.JSON
-- ends here
-- [[[[file:~/.dotfiles/files/xmonad/xmonad.org::*Summary][Summary]]][]]
import qualified Colors as CS
myWhite  = CS.foreground
myBlack = CS.background
myAccent = CS.accent
-- myAccent = CS.accent
-- ends here
-- [[[[file:~/.dotfiles/files/xmonad/xmonad.org::*Summary][Summary]]][]]
toggleFloat = withFocused (\windowId -> do
                              { floats <- gets (W.floating . windowset);
                                if windowId `M.member` floats
                                then withFocused $ windows . W.sink
                                else do
                                     keysMoveWindowTo (960, 540) (1%2, 1%2) windowId
                                     keysAbsResizeWindow (-50,-50) (960, 540) windowId
                              }
                          )
toggleSticky = withFocused (\windowId -> do
                               { copies <- wsContainingCopies;
                               if copies == []
                               then windows copyToAll
                               else killAllOtherCopies
                               }
                           )
-- ends here

main = xmonad $ docks $ ewmh $ def
    { terminal = "alacritty"
    , modMask = mod4Mask
    , borderWidth = 5
    , workspaces = [ show x ++ show y  | x <- [1..5], y <- [1..5] ]
    , normalBorderColor = myWhite
    , focusedBorderColor = myAccent
    , XMonad.keys = myKeys
    , layoutHook = myLayout
    , manageHook = myManageHook
    , logHook = myLogHook
    , handleEventHook = myEventHook
    }

-- [[[[file:~/.dotfiles/files/xmonad/xmonad.org::*Summary][Summary]]][]]
myKeys conf@(XConfig {}) = M.fromList $
    -- Start programs
    [ ((mod4Mask, xK_s), spawn $ XMonad.terminal conf)
    , ((mod4Mask, xK_e), spawn "emacsclient -c")
    , ((mod4Mask, xK_b), spawn "brave-browser")
    , ((mod4Mask .|. shiftMask, xK_b), spawn "brave-browser --incognito")
    , ((mod4Mask, xK_Tab), spawn "menu")
    , ((mod4Mask, xK_t), spawn "timebat")
    , ((mod4Mask, xK_Return), spawn "emojis")
    -- Close window
    , ((mod4Mask .|. shiftMask, xK_q), kill)
    -- Focus and swap window
    , ((mod4Mask, xK_h), windows W.focusMaster)
    , ((mod4Mask, xK_j), windows W.focusDown)
    , ((mod4Mask, xK_k), windows W.focusUp)
    , ((mod4Mask, xK_l), toggleFocus)
    , ((mod4Mask, xK_Down), windows W.swapDown)
    , ((mod4Mask, xK_Up), windows W.swapUp)
    , ((mod4Mask .|. shiftMask, xK_h), sendMessage Shrink)
    , ((mod4Mask .|. shiftMask, xK_l), sendMessage Expand)
    -- Default/Next layout
    , ((mod4Mask, xK_Left), sendMessage FirstLayout)
    , ((mod4Mask, xK_Right), sendMessage NextLayout)
    , ((mod4Mask, xK_f), sendMessage (Toggle "Full"))
    -- Toggle floating
    , ((mod4Mask, xK_space), toggleFloat)
    -- Toggle sticky
    , ((mod4Mask, xK_p ), toggleSticky)
    -- Brightness & volume
    , ((0, xF86XK_MonBrightnessUp), spawn "light -A 5")
    , ((0, xF86XK_MonBrightnessDown), spawn "light -U 5")
    , ((0, xF86XK_AudioLowerVolume), spawn "pactl set-sink-volume @DEFAULT_SINK@ -5%")
    , ((0, xF86XK_AudioRaiseVolume), spawn "pactl set-sink-volume @DEFAULT_SINK@ +5%")
    , ((0, xF86XK_AudioMute), spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle ")
    , ((0, xF86XK_AudioPrev), spawn "song prev")
    , ((0, xF86XK_AudioPlay), spawn "song toggle")
    , ((0, xF86XK_AudioStop), spawn "song pause")
    , ((0, xF86XK_AudioNext), spawn "song next")
    , ((0, xK_Print), spawn "flameshot gui")
    ]
    ++
    [((m .|. mod4Mask, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)] ]
-- ends here
-- [[[[file:~/.dotfiles/files/xmonad/xmonad.org::*Summary][Summary]]][]]
myLayout = toggleLayouts full layouts
  where
    full = noBorders Full
    layouts = avoidStruts(tiled)
    -- tiled = gaps $ smartBorders $ Tall n inc split
    tiled = gaps $ Tall n inc split
    n = 1
    split = 1/2
    inc = 3/100
    gaps w = spacing 5 w
-- ends here
-- [[[[file:~/.dotfiles/files/xmonad/xmonad.org::*Summary][Summary]]][]]
myManageHook = manageDocks <+> composeAll
    [ className =? "Alacritty" --> doShift "1"
    , className =? "kitty" --> doShift "1"
    , className =? "Emacs" --> doShift "1"
    , className =? "Zathura" --> doShift "1"
    , className =? "Brave-browser" --> doShift "2"
    , className =? "Ferdi" --> doShift "3"
    , className =? "mpv" --> doShift "3"
    , className =? "minecraft-launcher" --> doShift "3"
    , fmap("Minecraft" `isPrefixOf`) className --> doShift "3" ]

myLogHook = refocusLastLogHook
-- ends here
-- [[[[file:~/.dotfiles/files/xmonad/xmonad.org::*Summary][Summary]]][]]
myEventHook = serverModeEventHookCmd' $ return myCommands

myCommands =
    [ ("list", listCommands)
    -- , ("a", currentWorkspaceMessage)
    , ("test-up", windows W.focusUp)]


-- currentWorkspaceMessage = do
--   x <- show logCurrent
--   message x


message msg = spawn ("echo '" ++ msg ++ "' | xmessage -file -")

listCommands = spawn ("echo '" ++ asmc ++ "' | xmessage -file -")
  where asmc = concat $ "Available commands:" : map (\(x, _)-> "    " ++ x) myCommands
-- ends here
-- Summary:1 ends here

import XMonad
import Data.Monoid
import System.Exit
 
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops(fullscreenEventHook)
import XMonad.Layout.NoBorders
import XMonad.Actions.UpdatePointer

import XMonad.Layout.IndependentScreens
 
import XMonad.Util.Run(spawnPipe)
import System.IO(hPutStrLn)
 
import qualified XMonad.StackSet as W
import qualified Data.Map        as M
 
myTerminal = "gnome-terminal"
 
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True
 
myBorderWidth = 1
myModMask = mod1Mask
myWinMask = mod4Mask
 
myWorkspaces = withScreens 2 ["1", "2", "3", "4"]
 
myMainColor = "#82cbea"
myTextcolor = "#EFEFEF"
myBgColor = "#333333"
myLowColor = "#999999"
myNormalBorderColor = myBgColor
myFocusedBorderColor = myMainColor

------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.
--
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
 
    -- launch a terminal
    [ ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)
 
    -- launch dmenu
    , ((modm,               xK_p     ), spawn "exe=`dmenu_path | dmenu_run` && eval \"exec $exe\"")
 
    -- launch gmrun
    , ((modm .|. shiftMask, xK_p     ), spawn "gmrun")

    , ((myWinMask         , xK_v     ), spawn "gnome-terminal -e vim")
    , ((myWinMask         , xK_m     ), spawn "gnome-terminal -e mocp")
    , ((myWinMask         , xK_f     ), spawn "firefox")

    -- sound management {{
    --   XF86AudioPlay
    -- , ((0, xF_AudioLowerVolume   ), spawn "pactl set-sink-volume 6 -- -1.5%")
    -- , ((0, xF_AudioRaiseVolume   ), spawn "pactl set-sink-volume 6    +1.5%")
    -- , ((0, xF_AudioMute          ), spawn "pactl set-sink-mute 6 toggle")
    --}}

    -- close focused window
    , ((modm .|. shiftMask, xK_c     ), kill)
 
     -- Rotate through the available layout algorithms
    , ((modm,               xK_space ), sendMessage NextLayout)
 
    --  Reset the layouts on the current workspace to default
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)
 
    -- Resize viewed windows to the correct size
    , ((modm,               xK_n     ), refresh)
 
    -- Move focus to the next window
    , ((modm,               xK_Tab   ), windows W.focusDown)
 
    -- Move focus to the next window
    , ((modm,               xK_j     ), windows W.focusDown)
 
    -- Move focus to the previous window
    , ((modm,               xK_k     ), windows W.focusUp  )
 
    -- Move focus to the master window
    , ((modm,               xK_m     ), windows W.focusMaster  )
 
    -- Swap the focused window and the master window
    , ((modm,               xK_Return), windows W.swapMaster)
 
    -- Swap the focused window with the next window
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )
 
    -- Swap the focused window with the previous window
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )
 
    -- Shrink the master area
    , ((modm,               xK_h     ), sendMessage Shrink)
 
    -- Expand the master area
    , ((modm,               xK_l     ), sendMessage Expand)
 
    -- Push window back into tiling
    , ((modm,               xK_t     ), withFocused $ windows . W.sink)
 
    -- Increment the number of windows in the master area
    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))
 
    -- Deincrement the number of windows in the master area
    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))
 
    -- Toggle the status bar gap
    -- Use this binding with avoidStruts from Hooks.ManageDocks.
    -- See also the statusBar function from Hooks.DynamicLog.
    --
    -- , ((modm              , xK_b     ), sendMessage ToggleStruts)
 
    -- Quit xmonad
    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))
 
    -- Restart xmonad
    , ((modm              , xK_q     ), spawn "xmonad --recompile; xmonad --restart")

    ]
    ++
 
    --
    -- mod-[1..9], Switch to workspace N
    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    [((m .|. modm, k), windows $ onCurrentScreen f i)
        | (i, k) <- zip (workspaces' conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++
 
    --
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]
 
 
------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events
--
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $
 
    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))
 
    -- mod-button2, Raise the window to the top of the stack
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))
 
    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))
 
    -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]
 
-- Layouts
------------------------------------------------------------------------
myLayout = avoidStruts $ smartBorders tiled ||| smartBorders (Mirror tiled) ||| noBorders Full ||| smartBorders (Mirror xtiled)
  where
     -- default tiling algorithm partitions the screen into two panes
     tiled   = Tall nmaster delta ratio

     -- default tiling algorithm partitions the screen into two panes
     xtiled  = Tall xnmaster delta ratio
     -- The default number of windows in the master pane
     xnmaster = 2
 
     -- The default number of windows in the master pane
     nmaster = 1
 
     -- Default proportion of screen occupied by master pane
     ratio   = 1/2
 
     -- Percent of screen to increment by when resizing panes
     delta   = 3/100
 
-- Window rules:
-- > xprop | grep WM_CLASS
-------------------------------------------------------------------------------
myManageHook = manageDocks <+> composeAll
    [ --resource  =? "desktop_window" --> doIgnore
    ]
 
-- Event handling
------------------------------------------------------------------------
myEventHook = fullscreenEventHook
 
-- Status bars and logging
-------------------------------------------------------------------------------
addPad = wrap " " " "
 
myPP statusPipe = xmobarPP { 
    ppOutput = hPutStrLn statusPipe
    , ppCurrent = xmobarColor myMainColor myBgColor . addPad
    , ppHiddenNoWindows = xmobarColor myLowColor "" . addPad
    , ppHidden = xmobarColor myTextcolor "" . addPad
    , ppTitle = xmobarColor myTextcolor "" 
    , ppSep = xmobarColor myMainColor myBgColor " | "
}
 
myLogHook pipe = (dynamicLogWithPP (myPP pipe)) >> (updatePointer (Relative 0.5 0.5))
 
-- Startup hook
-------------------------------------------------------------------------------
myStartupHook = return ()
 
-- Configuration structure
-------------------------------------------------------------------------------
defaults statusPipe = defaultConfig {
    -- simple stuff
    terminal           = myTerminal,
    focusFollowsMouse  = myFocusFollowsMouse,
    borderWidth        = myBorderWidth,
    modMask            = myModMask,
    workspaces         = myWorkspaces,
    normalBorderColor  = myNormalBorderColor,
    focusedBorderColor = myFocusedBorderColor,
 
    -- bindings
    keys               = myKeys,
    mouseBindings      = myMouseBindings,
 
    -- hooks, layouts
    layoutHook         = myLayout,
    manageHook         = myManageHook,
    handleEventHook    = myEventHook,
    logHook            = myLogHook statusPipe,
    startupHook        = myStartupHook
}

-- Run xmonad with the settings you specify. No need to modify this.
main = do 
    statusPipe <- spawnPipe "xmobar ~/.xmonad/xmobar.hs"
    xmonad $ defaults statusPipe

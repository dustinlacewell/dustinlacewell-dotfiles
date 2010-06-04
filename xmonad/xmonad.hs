import IO
import qualified Data.Map as M

import XMonad
import XMonad.Config.Gnome
import qualified XMonad.StackSet as W
import XMonad.Hooks.FadeInactive
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.UrgencyHook
import XMonad.Util.Run

import XMonad.Layout.ResizableTile

import XMonad.Layout.NoBorders
import XMonad.Hooks.EwmhDesktops
import XMonad.Config (defaultConfig)
import XMonad.Hooks.ManageDocks


main = do
       xmonad $ withUrgencyHook StdoutUrgencyHook $ gnomeConfig
            { borderWidth = 1
            , normalBorderColor = "#202020"
            , focusedBorderColor = "#663333"
            , terminal = "gnome-terminal"
            , focusFollowsMouse = False
            , keys = myKeys
            , mouseBindings = myMouseBindings
            , layoutHook = myLayoutHook
            , manageHook = myManageHook
            , workspaces = map show [1..10]
            }

myLayoutHook = desktopLayoutModifiers $ tiled ||| Mirror tiled ||| Full
  where tiled = ResizableTall 1 (3/100) (1/2) []

desktopLayoutModifiers layout = avoidStruts $ ewmhDesktopsLayout layout

myXmoLogHook :: Handle ->  X ()
myXmoLogHook h = dynamicLogWithPP $ customPP { ppOutput = hPutStrLn h }

customPP :: PP
customPP = defaultPP { ppCurrent = xmobarColor "#5c663a" ""
                     , ppTitle =  shorten 200
                     , ppSep =  "<fc=#60462c> | </fc>"
                     , ppHiddenNoWindows = xmobarColor "#444444" ""
                     , ppUrgent = xmobarColor "#663232" ""
                     }

myLogHook :: X ()
myLogHook = fadeInactiveLogHook fadeAmount
    where fadeAmount = 0xaaaaaaaa

myKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $
    [ ((controlMask .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)
    , ((controlMask .|. shiftMask,               xK_p     ), spawn "gmrun")
    , ((controlMask .|. shiftMask, xK_q     ), kill)
    , ((modMask,               xK_space ), sendMessage NextLayout)
    , ((modMask .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)
    , ((modMask,               xK_j     ), windows W.focusDown)
    , ((modMask,               xK_k     ), windows W.focusUp  )
    , ((modMask,               xK_Return), windows W.swapMaster)
    , ((modMask .|. shiftMask, xK_j     ), windows W.swapDown  )
    , ((modMask .|. shiftMask, xK_k     ), windows W.swapUp    )
    , ((modMask,               xK_h     ), sendMessage Shrink)
    , ((modMask,               xK_l     ), sendMessage Expand)
    , ((modMask,               xK_t     ), withFocused $ windows . W.sink)
    , ((modMask              , xK_comma ), sendMessage (IncMasterN 1))
    , ((modMask              , xK_period), sendMessage (IncMasterN (-1)))
    , ((modMask              , xK_q     ), restart "xmonad" True)
    , ((modMask              , xK_i     ), sendMessage MirrorShrink)
    , ((modMask              , xK_m     ), sendMessage MirrorExpand)
    ]
    ++
    [((m .|. shiftMask, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_a, xK_s, xK_d, xK_f, xK_g, xK_z, xK_x, xK_c, xK_v, xK_b]
        , (f, m) <- [(W.greedyView, controlMask), (W.shift, modMask)]
    ]

myMouseBindings (XConfig {XMonad.modMask = modMask}) = M.fromList $
    [ ((mod4Mask, button1), (\w -> focus w >> mouseMoveWindow w
                                          >> windows W.swapMaster))
    , ((mod4Mask, button2), (\w -> focus w >> windows W.swapMaster))
    , ((mod4Mask, button3), (\w -> focus w >> mouseResizeWindow w
                                          >> windows W.swapMaster))
    ]

myManageHook = composeAll
        [ className =? "Tilda"          --> doFloat ]
                        <+> manageDocks

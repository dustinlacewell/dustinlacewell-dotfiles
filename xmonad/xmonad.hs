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
       xmonad $ withUrgencyHook StdoutUrgencyHook $ ewmh gnomeConfig
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

desktopLayoutModifiers layout = avoidStruts layout

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
    [ ((mod4Mask .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)
    , ((mod4Mask .|. shiftMask,               xK_p     ), spawn "gmrun")
    , ((mod4Mask .|. shiftMask, xK_q     ), kill)
    , ((mod4Mask,               xK_space ), sendMessage NextLayout)
    , ((mod4Mask .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)
    , ((mod4Mask,               xK_j     ), windows W.focusDown)
    , ((mod4Mask,               xK_k     ), windows W.focusUp  )
    , ((mod4Mask,               xK_Return), windows W.swapMaster)
    , ((mod4Mask .|. shiftMask, xK_j     ), windows W.swapDown  )
    , ((mod4Mask .|. shiftMask, xK_k     ), windows W.swapUp    )
    , ((mod4Mask,               xK_h     ), sendMessage Shrink)
    , ((mod4Mask,               xK_l     ), sendMessage Expand)
    , ((mod4Mask,               xK_t     ), withFocused $ windows . W.sink)
    , ((mod4Mask              , xK_comma ), sendMessage (IncMasterN 1))
    , ((mod4Mask              , xK_period), sendMessage (IncMasterN (-1)))
    , ((mod4Mask              , xK_q     ), restart "xmonad" True)
    , ((mod4Mask              , xK_i     ), sendMessage MirrorShrink)
    , ((mod4Mask              , xK_m     ), sendMessage MirrorExpand)
    ]
    ++
    [((m .|. mod4Mask, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_a, xK_s, xK_d, xK_f, xK_g, xK_z, xK_x, xK_c, xK_v, xK_b]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]
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

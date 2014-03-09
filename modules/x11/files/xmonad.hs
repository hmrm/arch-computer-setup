import XMonad
import XMonad.Layout.NoBorders
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName
import XMonad.Hooks.DynamicLog
import XMonad.Actions.CycleWS
import XMonad.Util.EZConfig

-- LAYOUTS
import XMonad.Layout.Spacing
import XMonad.Layout.ResizableTile
import XMonad.Layout.Grid



--------------------------------------------------------------------------------------------------------------------
-- DECLARE WORKSPACES RULES
--------------------------------------------------------------------------------------------------------------------
myLayout = avoidStruts (tiledSpace        ||| 
                        Mirror tiledSpace |||
                        fullscreen        ||| 
                        grid              ||| 
                        Mirror grid       ||| 
                        tiled             |||
                        Mirror tiled)
	where
		tiled  		= spacing 5 $ ResizableTall nmaster delta ratio []
		tiledSpace  	= spacing 60 $ ResizableTall nmaster delta ratio []
                grid            = spacing 20 $ Grid
                fullscreen      = noBorders Full
		-- Default number of windows in master pane
		nmaster = 1
		-- Percent of the screen to increment when resizing
		delta 	= 5/100
		-- Default proportion of the screen taken up by main pane
		ratio 	= toRational (2/(1 + sqrt 5 :: Double)) 


--------------------------------------------------------------------------------------------------------------------
-- WORKSPACE DEFINITIONS
--------------------------------------------------------------------------------------------------------------------
myWorkspaces = map show [1..10]

main = do
	xmonad =<< myXmobar (defaultConfig
		{ terminal              = myTerminal
                , borderWidth		= 1
		, layoutHook 		= smartBorders $ myLayout
		, workspaces 		= myWorkspaces
                , normalBorderColor     = color8
                , focusedBorderColor    = color8
                -- Hack to make java apps work
                , startupHook           = setWMName "LG3D"
		} `additionalKeys` [ ((mod1Mask, xK_Right), nextWS)
                  , ((mod1Mask, xK_Left), prevWS)
                  , ((mod1Mask .|. shiftMask, xK_Right), shiftToNext >> nextWS)
                  , ((mod1Mask .|. shiftMask, xK_Left), shiftToPrev >> prevWS)
                  , ((mod1Mask, xK_Down), moveTo Next EmptyWS)
                  , ((mod1Mask, xK_Up), toggleWS)
                  ])
    

myTerminal 	= "urxvtc"

background= "#181512"
foreground= "#D6C3B6"
color0=  "#332d29"
color8=  "#817267"
color1=  "#8c644c"
color9=  "#9f7155"
color2=  "#746C48"
color10= "#9f7155"
color3=  "#bfba92"
color11= "#E0DAAC"
color4=  "#646a6d"
color12= "#777E82"
color5=  "#766782"
color13= "#897796"
color6=  "#4B5C5E"
color14= "#556D70"
color7=  "#504339"
color15= "#9a875f"

myXmobar conf = statusBar "xmobar" myXmobarPP toggleStrutsKey conf

toggleStrutsKey XConfig {XMonad.modMask = modMask1} = (modMask1, xK_b)

myXmobarPP = defaultPP { ppCurrent = xmobarColor color9 "" . wrap "[" "]"
                       , ppTitle   = xmobarColor color8 "" . shorten 110
                       , ppLayout  = concat . map (" " ++) . map (take 2) . words
                       , ppVisible = wrap "(" ")"
                       , ppUrgent  = xmobarColor color12 color13
                       }

{-# LANGUAGE TemplateHaskell, GADTs #-}
import XMonad

import Control.Applicative
import Control.Monad.IO.Class
import Control.Lens
import Control.Lens.TH
import Data.Char (toUpper)
import Data.Default
import Data.Map (Map)
import qualified Data.Map as Map
import Data.Monoid
import Language.Haskell.TH
import System.Exit
import System.IO

import System.Taffybar.Support.PagerHints

import XMonad.Actions.SwapWorkspaces
import XMonad.Hooks.DebugEvents
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.FadeInactive
import XMonad.Hooks.EwmhDesktops
import XMonad.Layout.Fullscreen (fullscreenFull)
import XMonad.Prompt
import XMonad.Prompt.FuzzyMatch
import XMonad.Prompt.Pass

makeLensesWith (lensRules & lensField .~ \_ _ ns -> pure . TopName . mkName . (\n -> ("ln" <> (n & _head %~ toUpper))) . nameBase $ ns) ''XConfig

myMask = mod4Mask

myPromptConfig :: XPConfig
myPromptConfig = def
  { searchPredicate = fuzzyMatch
  , font = "xft:Source Code Pro:pixelsize=28:antialias=true"
  , maxComplRows = Just 2
  , height = 36
  }

main = do
    xmonad $ ewmh $ pagerHints $ withUrgencyHook NoUrgencyHook $
        def & lnTerminal .~ "urxvt"
            & lnFocusFollowsMouse .~ False
            & lnBorderWidth .~ 0
            & lnModMask .~ myMask
            & lnNormalBorderColor .~ "#073642"
            & lnFocusedBorderColor .~ "#d33682"
            & lnClickJustFocuses .~ False
            & lnLayoutHook %~ (fullscreenFull . avoidStruts)
            & lnManageHook %~ (manageDocks <>)
            & lnHandleEventHook %~ (mconcat [fullscreenEventHook, docksEventHook{-, debugEventsHook -}] <>)
            & lnLogHook .~ fadeInactiveLogHook 0.85
            & lnKeys %~ newKeys

newKeys oldKeys conf@(XConfig {XMonad.modMask = modMask}) =
  oldKeys conf & at (modMask, xK_q) .~  Just (spawn "physlock")
               & at (modMask, xK_F12) .~ Just (sendMessage ToggleStruts)
               & at (modMask, xK_r) .~ Just (passPrompt def)
               & at (modMask .|. shiftMask, xK_r) .~ Just (passGeneratePrompt myPromptConfig)

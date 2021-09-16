{-# LANGUAGE OverloadedStrings #-}
module Main where

import System.Taffybar
import System.Taffybar.Information.Battery
import System.Taffybar.Information.CPU
import System.Taffybar.Information.Memory
import System.Taffybar.SimpleConfig
import System.Taffybar.Widget.Battery
import System.Taffybar.Widget.Generic.Graph
import System.Taffybar.Widget.Generic.PollingGraph
import System.Taffybar.Widget.Layout
import System.Taffybar.Widget.Text.NetworkMonitor
import System.Taffybar.Widget.SimpleClock
import System.Taffybar.Widget.SNITray
import System.Taffybar.Widget.Windows
import System.Taffybar.Widget.Workspaces


fg = "#FFFF22"

cpuCallback = do
  (_, systemLoad, totalLoad) <- cpuLoad
  return [ totalLoad, systemLoad ]

cpuGraphConfig = defaultGraphConfig
  { graphDataColors = [ (0, 0, 0, 1), (0.4, 0.4, 0.4, 0.5)]
  , graphLabel = Just "CPU:"
  , graphBackgroundColor = (0.767,0.767,0.767, 1)
  , graphHeight = 30
  }

memCallback = do
  mi <- parseMeminfo
  return [memoryUsedRatio mi]

memGraphConfig = defaultGraphConfig
  { graphDataColors = [ (0, 0, 0, 1), (0.4, 0.4, 0.4, 0.5)]
  , graphBackgroundColor = (0.767,0.767,0.767, 1)
  , graphLabel = Just "Mem:"
  , graphHeight = 30
  }

clockFormat :: String
clockFormat = mconcat
  [ "<span fgcolor='", fg, "'>%a %b %_d %H:%M</span>" ]

myWorkspacesConfig = defaultWorkspacesConfig
  { minIcons = 0
  , maxIcons = Just 0
  , widgetGap = 0
  , updateRateLimitMicroseconds = 100000
  , urgentWorkspaceState = True
  , showWorkspaceFn = hideEmpty
  , labelSetter = \w -> pure $ case workspaceState w of
      Active -> mconcat [ "[", workspaceName w, "]" ]
      Urgent -> mconcat [ workspaceName w, "*"]
      _ -> workspaceName w
  }

main = do
  let clock = textClockNew Nothing clockFormat 0.5
      cpu = pollingGraphNew cpuGraphConfig 0.5 cpuCallback
      mem = pollingGraphNew memGraphConfig 0.5 memCallback
      tray = sniTrayNew
      bat = textBatteryNew "Bat:$percentage$% ($status$)"
      net = networkMonitorNew defaultNetFormat (Just ["wlp0s20f3"])
      layout = layoutNew defaultLayoutConfig
      windows = windowsNew defaultWindowsConfig
      workspaces = workspacesNew myWorkspacesConfig
  startTaffybar $ toTaffyConfig $ defaultSimpleTaffyConfig
    { startWidgets = [ workspaces, layout, windows ]
    , endWidgets = [ tray, clock, bat, mem, cpu, net ]
    , monitorsAction = usePrimaryMonitor
    , barHeight = ExactSize 32
    }

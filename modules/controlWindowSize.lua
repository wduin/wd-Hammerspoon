-- window管理
-- 这个文件中的代码都是用来控制应用窗口的大小,如二分之一,四分之一等
local hotkey = require "hs.hotkey"
local window = require "hs.window"
local layout = require "hs.layout"
-- local grid = require "hs.grid"
-- local hints = require "hs.hints"
local screen = require "hs.screen"
local alert = require "hs.alert"
-- local fnutils = require "hs.fnutils"
-- local geometry = require "hs.geometry"
-- local mouse = require "hs.mouse"

hyper = {"cmd", "ctrl", "alt"} -- equals ⌘ + ⌥ + ⌃
hyperShift = {"cmd", "ctrl", "alt","shift"} -- equals ⌘ + ⌥ + ⌃ + ⇧

-- default 0.2
window.animationDuration = 0

-- 通过 window.focusedWindow():moveToUnit'[0,0,100,50]' 来控制窗口的大小
-- [0,0,100,50] 表示的是左上角和右下角顶点的位置,从0到100,按照百分比来进行控制

-------------------------一半---------------------------------------
hotkey.bind(hyper, "A", function()
  if window.focusedWindow() then
    window.focusedWindow():moveToUnit(layout.left50)
  else
    alert.show("No active window")
  end
end)

-- right half
hotkey.bind(hyper, "D", function()
  window.focusedWindow():moveToUnit(layout.right50)
end)

-- top half
hotkey.bind(hyper, "W", function()
  window.focusedWindow():moveToUnit'[0,0,100,50]'
end)

-- bottom half
hotkey.bind(hyper, "S", function()
  window.focusedWindow():moveToUnit'[0,50,100,100]'
end)
-------------------------四分之一---------------------------------------
-- left top quarter
hotkey.bind(hyper, "J", function()
  window.focusedWindow():moveToUnit'[0,0,50,50]'
end)

-- right bottom quarter
hotkey.bind(hyper, "L", function()
  window.focusedWindow():moveToUnit'[50,50,100,100]'
end)

-- right top quarter
hotkey.bind(hyper, "I", function()
  window.focusedWindow():moveToUnit'[50,0,100,50]'
end)

-- left bottom quarter
hotkey.bind(hyper, "K", function()
  window.focusedWindow():moveToUnit'[0,50,50,100]'
end)

----------------------------------------------------------------
-- 全屏,不会单独占据一个窗口
-- 再次按时会返回到上次设置的窗口大小
hotkey.bind(hyper, 'F', function() toggle_maximize() end)
-- defines for window maximize toggler
local frameCache = {}
-- toggle a window between its normal size, and being maximized
function toggle_maximize()
    local win = window.focusedWindow()
    if frameCache[win:id()] then
        win:setFrame(frameCache[win:id()])
        frameCache[win:id()] = nil
    else
        frameCache[win:id()] = win:frame()
        win:maximize()
    end
end
-- 全屏,会单独占据一个窗口
hotkey.bind(hyperShift, 'F', function()
  window.focusedWindow():toggleFullScreen()
end)

----------------------------------------------------------------
-- center window,will not change size
hotkey.bind(hyper, 'C', function()
  window.focusedWindow():centerOnScreen()
end)
-- center window,will change size
hotkey.bind(hyper, 'V', function()
  window.focusedWindow():centerOnScreen()
  window.focusedWindow():moveToUnit'[25,25,75,75]'
end)
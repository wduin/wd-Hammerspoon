-- window管理
local application = require "hs.application"
local hotkey = require "hs.hotkey"
local window = require "hs.window"
local hints = require "hs.hints"
local screen = require "hs.screen"
local fnutils = require "hs.fnutils"
local geometry = require "hs.geometry"
local mouse = require "hs.mouse"

hyper = {"cmd", "ctrl", "alt"} -- equals ⌘ + ⌥ + ⌃
hyperShift = {"cmd", "ctrl", "alt","shift"} -- equals ⌘ + ⌥ + ⌃ + ⇧

----------------------------------------------------------------
-- move active window to other monitor
-- 移动应用窗口到其他屏幕
hotkey.bind(hyper, "pageup", function()
  window.focusedWindow():moveOneScreenWest()
end)

hotkey.bind(hyper, "pagedown", function()
  window.focusedWindow():moveOneScreenEast()
end)


-- hotkey.bind(hyper, "M", function()
--   window.focusedWindow():move
-- end)

----------------------------------------------------------------
-- 展示所有屏幕的应用,可以快捷选择应用
hotkey.bind(hyper, '.', function()
    hints.windowHints()
    -- Display current application window
    -- hints.windowHints(hs.window.focusedWindow():application():allWindows())
end)

----------------------------------------------------------------
-- move cursor to other monitor
-- 移动鼠标到其他屏幕
hotkey.bind(hyper, "/", function ()
  focusScreen(window.focusedWindow():screen():previous())
end)

--Predicate that checks if a window belongs to a screen
function isInScreen(screen, win)
  return win:screen() == screen
end

function focusScreen(screen)
  --Get windows within screen, ordered from front to back.
  --If no windows exist, bring focus to desktop. Otherwise, set focus on
  --front-most application window.
  local windows = fnutils.filter(
      window.orderedWindows(),
      fnutils.partial(isInScreen, screen))
  local windowToFocus = #windows > 0 and windows[1] or window.desktop()
  windowToFocus:focus()

  -- move cursor to center of screen
  local pt = geometry.rectMidPoint(screen:fullFrame())
  mouse.setAbsolutePosition(pt)
end

----------------------------------------------------------------

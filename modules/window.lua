-- 窗口管理

require("global.shortcut")

-- 关闭动画持续时间
hs.window.animationDuration = 0

-- 居中,大小会设置为二分之一
hs.hotkey.bind(windows.centerQuarter.prefix, windows.centerQuarter.key, windows.centerQuarter.message, function()
    if window.focusedWindow() then
        window.focusedWindow():centerOnScreen()
        window.focusedWindow():moveToUnit '[25,25,75,75]'
    else
        alert.show("No active window")
    end
end)

-- 居中,大小会设置为三分之一,我一般只在竖屏中使用
hs.hotkey.bind(windows.centerOneThird.prefix, windows.centerOneThird.key, windows.centerOneThird.message, function()
    if window.focusedWindow() then
        local newrect
        newrect = { 0, 1 / 3, 1, 1 / 3 }
        window.focusedWindow():move(newrect)
    else
        alert.show("No active window")
    end
end)

-- 居中,大小会设置为四分之一
hs.hotkey.bind(windows.centerHalf.prefix, windows.centerHalf.key, windows.centerHalf.message, function ()
if window.focusedWindow() then
window.focusedWindow():centerOnScreen()
window.focusedWindow():moveToUnit '[15,15,85,85]'
else
alert.show("No active window")
end
end )

--全屏,会单独占据一个窗口
hs.hotkey.bind(windows.fullscreen.prefix, windows.fullscreen.key, windows.fullscreen.message, function ()
if window.focusedWindow() then
window.focusedWindow():toggleFullScreen()
else
alert.show("No active window")
end
end )

-- 下面的是比较有意思的布局------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 窗口枚举
local AUTO_LAYOUT_TYPE = {
-- 网格式布局
GRID = "GRID",
-- 水平或垂直评分
HORIZONTAL_OR_VERTICAL = "HORIZONTAL_OR_VERTICAL",
}

-- 同一应用的所有窗口自动网格式布局
if windows.same_application_auto_layout_grid ~= nil then
hs.hotkey.bind(
windows.same_application_auto_layout_grid.prefix,
windows.same_application_auto_layout_grid.key,
windows.same_application_auto_layout_grid.message,
function ()
same_application(AUTO_LAYOUT_TYPE.GRID)
end
)
end

-- 同一应用的所有窗口自动水平均分或垂直均分
if windows.same_application_auto_layout_horizontal_or_vertical ~= nil then
hs.hotkey.bind(
windows.same_application_auto_layout_horizontal_or_vertical.prefix,
windows.same_application_auto_layout_horizontal_or_vertical.key,
windows.same_application_auto_layout_horizontal_or_vertical.message,
function ()
same_application(AUTO_LAYOUT_TYPE.HORIZONTAL_OR_VERTICAL)
end
)
end

-- 同一工作空间下的所有窗口自动网格式布局
if windows.same_space_auto_layout_grid ~= nil then
hs.hotkey.bind(
windows.same_space_auto_layout_grid.prefix,
windows.same_space_auto_layout_grid.key,
windows.same_space_auto_layout_grid.message,
function ()
same_space(AUTO_LAYOUT_TYPE.GRID)
end
)
end

-- 同一工作空间下的所有窗口自动水平均分或垂直均分
if windows.same_space_auto_layout_horizontal_or_vertical ~= nil then
hs.hotkey.bind(
windows.same_space_auto_layout_horizontal_or_vertical.prefix,
windows.same_space_auto_layout_horizontal_or_vertical.key,
windows.same_space_auto_layout_horizontal_or_vertical.message,
function ()
same_space(AUTO_LAYOUT_TYPE.HORIZONTAL_OR_VERTICAL)
end
)
end

function same_application(auto_layout_type)
local focusedWindow = hs.window.focusedWindow()
local application = focusedWindow:application()
-- 当前屏幕
local focusedScreen = focusedWindow:screen()
-- 同一应用的所有窗口
local visibleWindows = application:visibleWindows()
for k, visibleWindow in ipairs(visibleWindows) do
-- 关于 Standard window 可参考：http://www.hammerspoon.org/docs/hs.window.html#isStandard
-- 例如打开 Finder 就一定会存在一个非标准窗口，这种窗口需要排除
if not visibleWindow:isStandard() then
table.remove(visibleWindows, k)
end
if visibleWindow ~= focusedWindow then
-- 将同一应用的其他窗口移动到当前屏幕
visibleWindow:moveToScreen(focusedScreen)
end
end
layout_auto(visibleWindows, auto_layout_type)
end

function same_space(auto_layout_type)
local spaceId = hs.spaces.focusedSpace()
-- 该空间下的所有 window 的 id，注意这里的 window 概念和 Hammerspoon 的 window 概念并不同，详请参考：http://www.hammerspoon.org/docs/hs.spaces.html#windowsForSpace
local windowIds = hs.spaces.windowsForSpace(spaceId)
local windows = {}
for k, windowId in ipairs(windowIds) do
local window = hs.window.get(windowId)
if window ~= nil then
table.insert(windows, window)
end
end
layout_auto(windows, auto_layout_type)
end

function layout_auto(windows, auto_layout_type)
if AUTO_LAYOUT_TYPE.GRID == auto_layout_type then
layout_grid(windows)
elseif AUTO_LAYOUT_TYPE.HORIZONTAL_OR_VERTICAL == auto_layout_type then
layout_horizontal_or_vertical(windows)
end
end

-- 平铺模式-网格均分
function layout_grid(windows)
local focusedScreen = hs.screen.mainScreen()

local layout = {
{
num = 1,
row = 0,
column = 0,
},
{
num = 2,
row = 0,
column = 1,
},
{
num = 4,
row = 1,
column = 1,
},
{
num = 6,
row = 1,
column = 2,
},
{
num = 9,
row = 2,
column = 2,
},
{
num = 12,
row = 2,
column = 3,
},
{
num = 16,
row = 3,
column = 3,
},
}

local windowNum = #windows
local focusedScreenFrame = focusedScreen:frame()
for _k, item in ipairs(layout) do
if windowNum <= item.num then
local column = item.column
local row = item.row
if isVerticalScreen(focusedScreen) then
if item.column > item.row then
column = item.row
row = item.column
end
end
local widthForPerWindow = focusedScreenFrame.w / (column + 1)
local heightForPerWindow = focusedScreenFrame.h / (row + 1)
local nth = 1

for i = 0, column, 1 do
for j = 0, row, 1 do
-- 已没有可用窗口
if nth > windowNum then
break
end
local window = windows[nth]
local windowFrame = window:frame()
windowFrame.x = focusedScreenFrame.x + i * widthForPerWindow
windowFrame.y = focusedScreenFrame.y + j * heightForPerWindow
windowFrame.w = widthForPerWindow
windowFrame.h = heightForPerWindow
window:setFrame(windowFrame)
-- 让窗口获取焦点以将窗口置前
window:focus()
nth = nth + 1
end
end
break
end
end
end

-- 平铺模式 - 水平（竖屏）或垂直（横屏）均分
function layout_horizontal_or_vertical(windows)
local focusedScreen = hs.screen.mainScreen()
local focusedScreenFrame = focusedScreen:frame()
-- 如果是竖屏，就水平均分，否则垂直均分
if isVerticalScreen(focusedScreen) then
layout_horizontal(windows, focusedScreenFrame)
else
layout_vertical(windows, focusedScreenFrame)
end
end

-- 平铺模式 - 水平均分
function layout_horizontal(windows, focusedScreenFrame)
local windowNum = #windows
local heightForPerWindow = focusedScreenFrame.h / windowNum
for i, window in ipairs(windows) do
local windowFrame = window:frame()
windowFrame.x = focusedScreenFrame.x
windowFrame.y = focusedScreenFrame.y + heightForPerWindow * (i - 1)
windowFrame.w = focusedScreenFrame.w
windowFrame.h = heightForPerWindow
window:setFrame(windowFrame)
window:focus()
end
end

-- 平铺模式 - 垂直均分
function layout_vertical(windows, focusedScreenFrame)
local windowNum = #windows
local widthForPerWindow = focusedScreenFrame.w / windowNum
for i, window in ipairs(windows) do
local windowFrame = window:frame()
windowFrame.x = focusedScreenFrame.x + widthForPerWindow * (i - 1)
windowFrame.y = focusedScreenFrame.y
windowFrame.w = widthForPerWindow
windowFrame.h = focusedScreenFrame.h
window:setFrame(windowFrame)
window:focus()
end
end

-- 判断指定屏幕是否为竖屏
function isVerticalScreen(screen)
if screen:rotate() == 90 or screen:rotate() == 270 then
return true
else
return false
end
end
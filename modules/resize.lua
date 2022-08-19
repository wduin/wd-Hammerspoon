-- window管理
-- 这个文件中的代码都是用来控制应用窗口的大小,如二分之一,四分之一等

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
    window.focusedWindow():moveToUnit '[0,0,100,50]'
end)

-- bottom half
hotkey.bind(hyper, "S", function()
    window.focusedWindow():moveToUnit '[0,50,100,100]'
end)
-------------------------四分之一---------------------------------------
-- left top quarter
hotkey.bind(hyper, "J", function()
    window.focusedWindow():moveToUnit '[0,0,50,50]'
end)

-- right bottom quarter
hotkey.bind(hyper, "L", function()
    window.focusedWindow():moveToUnit '[50,50,100,100]'
end)

-- right top quarter
hotkey.bind(hyper, "I", function()
    window.focusedWindow():moveToUnit '[50,0,100,50]'
end)

-- left bottom quarter
hotkey.bind(hyper, "K", function()
    window.focusedWindow():moveToUnit '[0,50,50,100]'
end)

----------------------------------------------------------------
-- 全屏,不会单独占据一个窗口
hotkey.bind(hyper, 'F', function()
    window.focusedWindow():moveToUnit '[0,0,100,100]'
end)

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
    window.focusedWindow():moveToUnit '[25,25,75,75]'
end)

----------------------------------------------------------------
-- 只支持纵向的三分之一,因为横向的基本用不到
-- 使用 ⌘ + ⌥ + ⌃ + O 使用
hyper = { "cmd", "ctrl", "alt" } -- equals ⌘ + ⌥ + ⌃

function winresize(how)
    local win = hs.window.focusedWindow()
    local app = win:application():name()
    local windowLayout
    local newrect

    if how == "top_third" or how == "vthird-0" then
        newrect = { 0, 0, 1, 1 / 3 }
    elseif how == "middle_third_v" or how == "vthird-1" then
        newrect = { 0, 1 / 3, 1, 1 / 3 }
    elseif how == "bottom_third" or how == "vthird-2" then
        newrect = { 0, 2 / 3, 1, 1 / 3 }
    end

    win:move(newrect)
end

function get_vertical_third(win)
    local frame = win:frame()
    local screenframe = win:screen():frame()
    local relframe = hs.geometry(frame.x - screenframe.x, frame.y - screenframe.y, frame.w, frame.h)
    local third = math.floor(3.01 * relframe.y / screenframe.h)
    return third
end

function up_third()
    local win = hs.window.focusedWindow()
    local third = get_vertical_third(win)
    if third == 0 then
        winresize("vthird-1")
    elseif third == 1 then
        winresize("vthird-2")
    elseif third == 2 then
        winresize("vthird-0")
    end
end
hs.hotkey.bind(hyper, "o", up_third)

-- window管理
-- 这个文件中的代码都是用来控制应用窗口的大小,如二分之一,四分之一等

window.animationDuration = 0
-- 通过 window.focusedWindow():moveToUnit'[0,0,100,50]' 来控制窗口的大小
-- [0,0,100,50] 表示的是左上角和右下角顶点的位置,从0到100,按照百分比来进行控制

-------------------------一半---------------------------------------
function leftHalf()
    if window.focusedWindow() then
        window.focusedWindow():moveToUnit(layout.left50)
    else
        alert.show("No active window")
    end
end

function rightHalf()
    if window.focusedWindow() then
        window.focusedWindow():moveToUnit(layout.right50)
    else
        alert.show("No active window")
    end
end

function topHalf()
    if window.focusedWindow() then
        window.focusedWindow():moveToUnit '[0,0,100,50]'
    else
        alert.show("No active window")
    end
end

function bottomHalf()
    if window.focusedWindow() then
        window.focusedWindow():moveToUnit '[0,50,100,100]'
    else
        alert.show("No active window")
    end
end


-------------------------四分之一---------------------------------------

function leftQuarter()
    if window.focusedWindow() then
        window.focusedWindow():moveToUnit '[0,0,50,50]'
    else
        alert.show("No active window")
    end
end

function rightQuarter()
    if window.focusedWindow() then
        window.focusedWindow():moveToUnit '[50,50,100,100]'
    else
        alert.show("No active window")
    end
end

function topQuarter()
    if window.focusedWindow() then
        window.focusedWindow():moveToUnit '[50,0,100,50]'
    else
        alert.show("No active window")
    end
end

function bottomQuarter()
    if window.focusedWindow() then
        window.focusedWindow():moveToUnit '[0,50,50,100]'
    else
        alert.show("No active window")
    end
end

----------------------------------------------------------------
-- 全屏,不会单独占据一个窗口
function fullscreenNotResize()
    if window.focusedWindow() then
        window.focusedWindow():moveToUnit '[0,0,100,100]'
    else
        alert.show("No active window")
    end
end

-- 全屏,会单独占据一个窗口
function fullscreenWillResize()
    if window.focusedWindow() then
        window.focusedWindow():toggleFullScreen()
    else
        alert.show("No active window")
    end
end

----------------------------------------------------------------
-- 居中,不会改变大小
function centerNoResize()
    if window.focusedWindow() then
        window.focusedWindow():centerOnScreen()
    else
        alert.show("No active window")
    end
end

-- 居中,大小会设置为默认值
function centerWillRisize()
    if window.focusedWindow() then
        window.focusedWindow():centerOnScreen()
        window.focusedWindow():moveToUnit '[25,25,75,75]'
    else
        alert.show("No active window")
    end
end

----------------------------------------------------------------
--三分之一
function get_vertical_third()
    local frame = win:frame()
    local screenframe = win:screen():frame()
    local relframe = hs.geometry(frame.x - screenframe.x, frame.y - screenframe.y, frame.w, frame.h)
    local third = math.floor(3.01 * relframe.y / screenframe.h)
    return third
end

function get_horizontal_third()
    local frame = win:frame()
    local screenframe = win:screen():frame()
    local relframe = hs.geometry(frame.x - screenframe.x, frame.y - screenframe.y, frame.w, frame.h)
    local third = math.floor(3.01 * relframe.x / screenframe.w)
    return third
end

function verticalThird()
    local third = get_vertical_third()
    local newrect
    if third == 0 then
        newrect = { 0, 1 / 3, 1, 1 / 3 }
    elseif third == 1 then
        newrect = { 0, 2 / 3, 1, 1 / 3 }
    elseif third == 2 then
        newrect = { 0, 0, 1, 1 / 3 }
    end
    window.focusedWindow():move(newrect)
end

function horizontalThird()
    local third = get_horizontal_third()
    local newrect
    if third == 0 then
        newrect = { 1 / 3, 0, 1 / 3, 1 }
    elseif third == 1 then
        newrect = { 2 / 3, 0, 1 / 3, 1 }
    elseif third == 2 then
        newrect = { 0, 0, 1 / 3, 1 }
    end
    window.focusedWindow():move(newrect)
end

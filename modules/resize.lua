-- window管理
-- 这个文件中的代码都是用来控制应用窗口的大小,如二分之一,四分之一等

window.animationDuration = 0
-- 通过 window.focusedWindow():moveToUnit'[0,0,100,50]' 来控制窗口的大小
-- [0,0,100,50] 表示的是左上角和右下角顶点的位置,从0到100,按照百分比来进行控制

-- 全屏,会单独占据一个窗口
function fullscreenWillResize()
    if window.focusedWindow() then
        window.focusedWindow():toggleFullScreen()
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

-- 居中,大小会设置为默认值
function centerHalf()
    if window.focusedWindow() then
        window.focusedWindow():centerOnScreen()
        window.focusedWindow():moveToUnit '[0,25,100,75]'
    else
        alert.show("No active window")
    end
end
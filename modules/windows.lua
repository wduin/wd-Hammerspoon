-- window管理
----------------------------------------------------------------
-- move active window to other monitor
-- 移动应用窗口到其他屏幕
hotkey.bind(hyper, "pageup", function()
    window.focusedWindow():moveOneScreenWest()
end)

hotkey.bind(hyper, "pagedown", function()
    window.focusedWindow():moveOneScreenEast()
end)

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

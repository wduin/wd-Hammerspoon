-- window管理
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

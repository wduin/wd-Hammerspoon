require "modules/globalData"
require "modules/windows"
require "modules/resize"
require "modules/volume"
--require "modules/reload"
require "modules/bluetooth"

----二分之一
--hotkey.bind(hyper, "A", leftHalf)
--hotkey.bind(hyper, "D", rightHalf)
--hotkey.bind(hyper, "W", topHalf)
--hotkey.bind(hyper, "S", bottomHalf)
--
----三分之一
--hs.hotkey.bind(hyper, "o", verticalThird)
--hs.hotkey.bind(hyper, "p", horizontalThird)
--
----四分之一
--hotkey.bind(hyper, "J", leftQuarter)
--hotkey.bind(hyper, "L", rightQuarter)
--hotkey.bind(hyper, "I", topQuarter)
--hotkey.bind(hyper, "K", bottomQuarter)
----全屏
--hotkey.bind(hyper, 'F', fullscreenNotResize)
--居中
----hotkey.bind(hyper, 'C', centerNoResize)
--
----全屏,单独一个窗口
hotkey.bind(hyperShift, 'F', fullscreenWillResize)
--居中四分之一
hotkey.bind(hyper, 'V', centerWillRisize)
----居中二分之一
hotkey.bind(hyper, 'B', centerHalf)
--音量控制
hs.hotkey.bind(hyper, '[', changeVolume(-3))
hs.hotkey.bind(hyper, ']', changeVolume(3))

-- 移动鼠标到其他屏幕
--hotkey.bind(hyper, "/", function()
--    focusScreen(window.focusedWindow():screen():previous())
--end)

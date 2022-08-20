require "modules/globalData"
require "modules/windows"
require "modules/resize"
require "modules/volume"
require "modules/reload"
require "modules/test"

--二分之一
hotkey.bind(hyper, "A", leftHalf)
hotkey.bind(hyper, "D", rightHalf)
hotkey.bind(hyper, "W", topHalf)
hotkey.bind(hyper, "S", bottomHalf)

--三分之一
hs.hotkey.bind(hyper, "o", verticalThird)
hs.hotkey.bind(hyper, "p", horizontalThird)

--四分之一
hotkey.bind(hyper, "J", leftQuarter)
hotkey.bind(hyper, "L", rightQuarter)
hotkey.bind(hyper, "I", topQuarter)
hotkey.bind(hyper, "K", bottomQuarter)

--全屏
hotkey.bind(hyper, 'F', fullscreenNotResize)
hotkey.bind(hyperShift, 'F', fullscreenWillResize)

--居中
hotkey.bind(hyper, 'C', centerNoResize)
hotkey.bind(hyper, 'V', centerWillRisize)

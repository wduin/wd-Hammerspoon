-- 此文件为示例文件，用户请勿修改，如需自定义快捷键，请修改 shortcut.lua 文件，如不存在 shortcut.lua 文件，则执行命令 cp shortcut.lua.example shortcut.lua 创建一份即可



--这里是快捷键
hyper = { "cmd", "ctrl", "alt" } -- equals ⌘ + ⌥ + ⌃
hyperShift = { "cmd", "ctrl", "alt", "shift" } -- equals ⌘ + ⌥ + ⌃ + ⇧
Option = { "alt" }
OptionShift = { "alt", "shift" }

--下面是一些别名
win = hs.window.focusedWindow()
hotkey = require "hs.hotkey"
window = require "hs.window"
layout = require "hs.layout"
grid = require "hs.grid"
hints = require "hs.hints"
screen = require "hs.screen"
alert = require "hs.alert"
fnutils = require "hs.fnutils"
geometry = require "hs.geometry"
mouse = require "hs.mouse"

-- 快捷键配置版本号
shortcut_config = {
    version = 1.0
}

-- prefix：表示快捷键前缀，
-- key：可选值 [A-Z]、[1-9]、Left、Right、Up、Down、-、=、/
-- message 表示提示信息

-- 窗口管理快捷键配置
windows = {
    -- 同一应用的所有窗口自动网格式布局 
    same_application_auto_layout_grid = { prefix = hyper, key = "1", message = "同一应用的所有窗口自动网格式布局" },
    -- 同一应用的所有窗口自动水平均分或垂直均分 
    same_space_auto_layout_grid = { prefix = hyper, key = "2", message = "同一应用的所有窗口自动水平均分或垂直均分" },
    -- 同一工作空间下的所有窗口自动网格式布局
    same_application_auto_layout_horizontal_or_vertical = { prefix = hyper, key = "3", message = "同一工作空间下的所有窗口自动网格式布局" },
    -- 同一工作空间下的所有窗口自动水平均分或垂直均分
    same_space_auto_layout_horizontal_or_vertical = { prefix = hyper, key = "4", message = "同一工作空间下的所有窗口自动水平均分或垂直均分" },


    --全屏,会单独占据一个窗口
    fullscreen = { prefix = hyper, key = "G", message = "全屏,会单独占据一个窗口" },
    -- 居中,大小会设置为四分之一
    centerQuarter = { prefix = hyper, key = "V", message = "居中:四分之一" },
    -- 居中,大小会设置为二分之一
    centerHalf = { prefix = hyper, key = "B", message = "居中:二分之一" },
    -- 居中,大小会设置为三分之一,我一般只在竖屏中使用
    centerOneThird = { prefix = hyper, key = "H", message = "居中:三分之一" },
}

volumes = {
    volumeUp = { prefix = hyper, key = "]", message = "音量加" },
    volumeDown = { prefix = hyper, key = "[", message = "音量减" },
}

-- 应用切换快捷键配置
-- bundleID 可以通过 karabiner-EventViewer 来查看
applications = {
    { prefix = Option, key = "`", message = "Chrome", bundleId = "com.google.Chrome" },
    { prefix = Option, key = "1", message = "Typora", bundleId = "abnerworks.Typora" },
    { prefix = Option, key = "2", message = "Android Studio", bundleId = "com.google.android.studio" },
    { prefix = Option, key = "3", message = "iTerm2", bundleId = "com.googlecode.iterm2" },
    { prefix = Option, key = "4", message = "Sublime", bundleId = "com.sublimetext.4" },
    { prefix = Option, key = "5", message = "VSCode", bundleId = "com.microsoft.VSCode" },
    { prefix = Option, key = "6", message = "one Command", bundleId = "com.eltima.cmd1" },
    { prefix = OptionShift, key = "6", message = "Finder", bundleId = "com.apple.finder" },
    { prefix = Option, key = "7", message = "IntelliJ IDEA", bundleId = "com.jetbrains.intellij" },
    { prefix = Option, key = "8", message = "Clion", bundleId = "com.jetbrains.CLion" },

    { prefix = Option, key = "0", message = "Zoom", bundleId = "us.zoom.xos" },
    --{ prefix = Option, key = "", message = "", bundleId = "" },
}

-- 表情包搜索快捷键配置
emoji_search = { prefix = hyper, key = "E" }

-- 快捷键查看面板快捷键配置
hotkey = {
    prefix = hyper,key = "M"
}

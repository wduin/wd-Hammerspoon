--这个文件中存储一些常用的数据,如快捷键,常用缩写

--这里是快捷键
hyper = { "cmd", "ctrl", "alt" } -- equals ⌘ + ⌥ + ⌃
hyperShift = { "cmd", "ctrl", "alt", "shift" } -- equals ⌘ + ⌥ + ⌃ + ⇧
hyperCtrl = {"alt", "ctrl"}
hyperAlt = {"ctrl", "alt", "shift"}

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
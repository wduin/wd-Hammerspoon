-- 自动reload hammerspoon 的配置
-- 每次路径中文件有改变都会自动保存
local pathwatcher = require "hs.pathwatcher"
local alert = require "hs.alert"

-- http://www.hammerspoon.org/go/#fancyreload
function reloadHammerspoonConfig(files)
    doReload = false
    for _, file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end

pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon", reloadHammerspoonConfig):start()
alert.show("Hammerspoon Config Reloaded")
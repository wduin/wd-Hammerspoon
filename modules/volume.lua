--调整音量
function changeVolume(diff)
    return function()
        alert.show("No active window")
        local current = hs.audiodevice.defaultOutputDevice():volume()
        local new = math.min(100, math.max(0, math.floor(current + diff)))
        if new > 0 then
            hs.audiodevice.defaultOutputDevice():setMuted(false)
        end
        hs.alert.closeAll(0.0)
        hs.alert.show("Volume " .. new .. "%", {}, 0.5)
        hs.audiodevice.defaultOutputDevice():setVolume(new)

    end
end

--音量控制
hs.hotkey.bind(volumes.volumeUp.prefix, volumes.volumeUp.key, volumes.volumeUp.message,changeVolume(3))
hs.hotkey.bind(volumes.volumeDown.prefix, volumes.volumeDown.key, volumes.volumeDown.message, changeVolume(-3))

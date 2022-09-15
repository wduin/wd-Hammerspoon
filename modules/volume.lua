--调整音量
function changeVolume(diff)
    return function()
        local current = hs.audiodevice.defaultOutputDevice():volume()
        local new = math.min(100, math.max(0, current + diff))
        if new > 0 then
            hs.audiodevice.defaultOutputDevice():setMuted(false)
        end
        hs.alert.closeAll(0.0)
        hs.alert.show("Volume " .. new .. "%", {}, 0.5)
        hs.audiodevice.defaultOutputDevice():setVolume(new)

    end
end

--设置音量是否静音
function muteVolume(isMute)
    return function()
        if isMute then
            hs.audiodevice.defaultOutputDevice():setMuted(true)
        else
            hs.audiodevice.defaultOutputDevice():setMuted(false)
        end
    end
end

--音量控制
hs.hotkey.bind(volumes.volumeUp.prefix, volumes.volumeUp.key, volumes.volumeUp.message, changeVolume(5))
hs.hotkey.bind(volumes.volumeDown.prefix, volumes.volumeDown.key, volumes.volumeDown.message, changeVolume(-5))

hs.hotkey.bind(volumes.volumeMute.prefix, volumes.volumeMute.key, volumes.volumeMute.message, muteVolume(true))
hs.hotkey.bind(volumes.volumeNotMute.prefix, volumes.volumeNotMute.key, volumes.volumeNotMute.message, muteVolume(false))

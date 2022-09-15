function controlBrightness_primaryScreen(diff)
    return function()

        local current = hs.screen.primaryScreen():getBrightness()
        local new = math.min(1, math.max(0, current + diff))

        alert.show("NEW " .. new)
        hs.alert.closeAll(0.0)
        hs.alert.show("Brightness " .. new)
        hs.screen.primaryScreen():setBrightness(new)
    end
end

--尝试让全部屏幕都可以调整亮度,但是遇到了一些问题
function controlBrightness_AllScreen(diff)
    return function()


        local screens = hs.screen.allScreens()

        local size = #screens;


        --for i, screen in ipairs(screens) do
        --        hs.alert.closeAll(0.0)
        --    hs.alert.show("Brightness " .. new)
        --    hs.alert.show("Brightness " .. new)
        --    hs.alert.show("i " .. i)
        --    hs.alert.show("screen " .. screen)
        --    screen:setBrightness(new)
        --
        --end


        for index = 1, size do
            hs.alert.closeAll(0.0)
            --local screen = screens[index]
            --local isSuccess = screen.setPrimary()
            --local current = hs.screen.primaryScreen():getBrightness()
            --local new = math.min(1, math.max(0, current + diff))
            --hs.alert.show("Brightness " .. new )

            --alert.show("screen "..screen)
            --
            --screen:setBrightness(new)
        end
    end
end

hs.hotkey.bind(brightness.brightnessUp.prefix, brightness.brightnessUp.key, brightness.brightnessUp.message, controlBrightness_primaryScreen(0.2))
hs.hotkey.bind(brightness.brightnessDown.prefix, brightness.brightnessDown.key, brightness.brightnessDown.message, controlBrightness_primaryScreen(-0.2))

hs.hotkey.bind(brightness.brightnessUp_allScreen.prefix, brightness.brightnessUp_allScreen.key, brightness.brightnessUp_allScreen.message, controlBrightness_AllScreen(0.1))
hs.hotkey.bind(brightness.brightnessDown_allScreen.prefix, brightness.brightnessDown_allScreen.key, brightness.brightnessDown_allScreen.message, controlBrightness_AllScreen(-0.1))
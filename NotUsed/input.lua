local function Chinese()
    hs.keycodes.currentSourceID("com.sogou.inputmethod.sogou.pinyin")
end

local function English()
    hs.keycodes.currentSourceID("com.apple.keylayout.ABC")
end

local function set_app_input_method(app_name, set_input_method_function, event)
    event = event or hs.window.filter.windowFocused

    hs.window.filter.new(app_name)
      :subscribe(event, function()
        set_input_method_function()
    end)
end

--使用指定APP时,自动使用指定语言输入法
set_app_input_method('iTerm2', English)
set_app_input_method('Google Chrome', English)
set_app_input_method('Android Studio', English)
set_app_input_method('Visual Studio Code', English)
set_app_input_method('Sublime Text', English)
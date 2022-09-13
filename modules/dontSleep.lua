local caf = require "hs.caffeinate"

local function enable()
    caf.set("displayIdle", true, true)
    caf.set("systemIdle", true, true)
    caf.set("system", true, true)
end

--function disable()
--    caf.set("displayIdle", false, false)
--    caf.set("systemIdle", false, false)
--    caf.set("system", false, false)
--    menu:delete()
--end

enable()

--参考文档
--https://www.hammerspoon.org/docs/hs.caffeinate.html
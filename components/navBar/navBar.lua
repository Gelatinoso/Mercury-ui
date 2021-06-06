local mercuryIcon = love.graphics.newImage("images/favicon.png")
local style = require "components.navBar.style"
local version = require "version"
local fontIcons = require "components.fontIcons"

searchFilter = {value = "", placeholder = "Search..."}

local function navBar()
    -- LuaFormatter off
    ui:menubarBegin()
        ui:layoutRow("dynamic", 30, {0.2, 0.2, 0.2, 0.05, 0.30, 0.05})
            ui:stylePush(style)
                ui:label("\t\tMercury UI - " .. version)
                ui:image(mercuryIcon, 5, 4, 32, 32)
                if ui:button("Available") then
                    searchFilter.value = ""
                    currentPage = "availablePackages"
                end
                if ui:button("Installed") then
                    searchFilter.value = ""
                    currentPage = "installedPackages"
                end
                ui:stylePush({font = love.graphics.newFont("fonts/fontello.ttf"), text = {padding = {x= 2, y = 0}}})
                    ui:label(fontIcons.search, "right")
                ui:stylePop()
                ui:edit("simple", searchFilter)
            ui:stylePop()
            ui:stylePush({font = love.graphics.newFont("fonts/fontello.ttf")})
                ui:button(fontIcons.cog)
            ui:stylePop()
    ui:menubarEnd()
    height = height - 30
    -- LuaFormatter on
end

return navBar
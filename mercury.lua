------------------------------------------------------------------------------
-- Mercury Communication
-- Gelatinoso, Sledmine
-- Module to communicate with Mercury available on the host system
------------------------------------------------------------------------------
local cjson = require "cjson"
local inspect = require "inspect"

local mercury = {}

---@class mercDependencies
---@field label string
---@field version string

---@class mercFiles
---@field path string
---@field type string
---@field outputPath string

---@class mercUpdates
---@field path string
---@field diffPath string
---@field type string
---@field outputPath string

---@class packageMercury
---@field name string
---@field label string
---@field description string
---@field author string
---@field version string
---@field targetVersion string
---@field internalVersion string
---@field manifestVersion string
---@field files mercFiles[]
---@field updates mercUpdates[]
---@field dependencies mercDependencies[]

--- Get an array of installed Mercury packages
---@return packageMercury[]
function mercury.getInstalled()
    local installedPackages

    local pipe = io.popen("mercury list -j", "r")
    if (pipe) then
        local output = pipe:read("*all")
        pipe:close()
        if (output and not output:find("Warning,")) then
            installedPackages = cjson.decode(output)
            return installedPackages
        end
    end
    return {}
end

-- Fetch the latest package index available on the repository
-- TODO Add return annotation
function mercury.fetchPackages()
    -- Get the package index output on json format
    local pipe = io.popen("mercury fetch -j")
    if (pipe) then
        local response = pipe:read("*all")
        pipe:close()
        print(inspect(response))
        if (response and not response:find("Error,")) then
            local fetchedPackages = cjson.decode(response)
            return fetchedPackages
        end
    end
    return {}
end

-- Installs selected package
function mercury.installPackage(label)
    local pipe = io.popen("mercury install " .. label)
    if(pipe) then
        local response = pipe:read("*all")
        pipe:close()
        return response
    end
end

return mercury

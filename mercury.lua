------------------------------------------------------------------------------
-- Mercury Communication
-- Gelatinoso, Sledmine
-- Module to communicate with Mercury available on the host system
------------------------------------------------------------------------------
local cjson = require "cjson"

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
    local response
    local output
    local installedPackages

    response = io.popen("mercury list -j", "r")
    output = response:read("*all")
    response:close()

    installedPackages = cjson.decode(output)

    return installedPackages
end

-- Fetch the latest package index available on the repository
-- TODO Add return annotation
function mercury.fetchPackages()
    -- Get the package index output on json format
    local pipe = io.popen("mercury fetch")
    if (pipe) then
        local response = pipe:read("*all")
        pipe:close()
        local fetchedPackages = cjson.decode(response)
        return fetchedPackages
    end
end

return mercury

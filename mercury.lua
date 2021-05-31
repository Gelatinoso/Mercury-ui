local cjson = require "cjson"

local model = {}

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
function model.getInstalled()
    local response
    local output
    local installedPackages

    response = io.popen('mercury list -j', 'r')
    output = response:read('*all')
    response:close()

    installedPackages = cjson.decode(output)

    return installedPackages
end

return model
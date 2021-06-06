local rowSize = 60

local packages = mercury.fetchPackages()

local function availablePackages(filter)
    ui:groupBegin("packages", "scrollbar")
        -- Page title
        ui:layoutRow("dynamic", 30, 1)
        ui:label("List of all packages available on the Mercury repository.")
        -- Packages list
        -- Show packages loaded in memory
        for packageIndex, package in pairs(packages) do
            if (package.label:find(filter)) then
                ui:layoutRow("dynamic", 60, {0.9, 0.1})
                ui:label(package.label .. " - " .. package.version)
                if ui:button("Install") and canInstall then
                    response = mercury.installPackage(package.label)
                    print(response)
                end
            end
        end
    ui:groupEnd()
end

return availablePackages
local width, height
local flags = {
    "border",
    "movable",
    "title",
    "closable"
}

return function(ui)
    if ui:windowBegin("Confirm", 200, 200, 300, 300, flags) then
        width, height = ui:windowGetSize()
        ui:layoutRow("dynamic", 200, 1)
        if ui:popupBegin("dynamic", "options", 0, 0, width - 12, height) then
            ui:layoutRow("dynamic", height, 1)
            if ui:button("Test") then
                print("jala")
            end
            ui:popupEnd()
        end
    end
    ui:windowEnd()
end
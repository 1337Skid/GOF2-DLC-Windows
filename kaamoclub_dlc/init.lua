RegisterEvent("IsInGame", function()
    if not system:IsVisible(26) then
        system:SetVisible(26, true)
    end
end)
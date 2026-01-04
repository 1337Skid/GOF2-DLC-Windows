local enabledvalkyrie = false
local enabledloma = false

RegisterEvent("IsInMainMenu", function()
	if not enabledvalkyrie then
		mission:EnableValkyrie()
		enabledvalkyrie = true
	end
end)

RegisterEvent("IsInGame", function()
	if enabledvalkyrie and not enabledloma then
		if not system:IsVisible(25) then
			system:SetVisible(25, true)
			enabledloma = true
		end
	end
end)
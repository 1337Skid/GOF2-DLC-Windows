local agentsinfo = require("agentsinfo")

RegisterEvent("IsInGame", function()
    if not system:IsVisible(26) then
        system:SetVisible(26, true)
    end
end)

RegisterEvent("OnSystemChanged", function(id)
	-- agentscount is really important or else the game will create over and over again agents resulting in a game crash
	if id == 26 and station.agentscount == 0 then
		station:CreateAgent("Longwei Zhou",  0, -1, 0, 0, 0, 0, agentsinfo.basic_talking); -- name, factiontype, isterranwoman, hair, eyes, mouth, armor, agentinfo 
		station:CreateAgent("Nemor Kalant",  2, -1, 0, 0, 0, 0, agentsinfo.basic_talking);
		station:CreateAgent("Tedanor",       7, -1, 0, 0, 0, 0, agentsinfo.basic_talking);
		station:CreateAgent("Jelka Lithgow", 0,  1, 0, 0, 0, 0, agentsinfo.basic_talking);
		station:CreateAgent("Jakk Zoboon",   6, -1, 1, 0, 0, 0, agentsinfo.selling_talking);
		station:CreateAgent("Unmar Zoboon",  6, -1, 0, 0, 0, 0, agentsinfo.basic_talking);
	end
end)
-- I could make an item table where I store the new items ids in so it doesn't conflicts with mods that also made an item and are loaded firstly but if we save the game your items will be swapped with the first mod loaded so just keep this mod name "00_"
local agentsinfo = require("agentsinfo")
local itemsinfo = require("itemsinfo")

RegisterEvent("EarlyInit", function()
	item:Create('M6 A4 "Raccoon"', "The M6 A4 is the most powerful laser beam in the entire galaxy. If you've mounted several of these lethal devices to your ship, you will be able to pulverize your enemies before they are even close enough to open fire on you. In most cases, a single shot of the M6 A4 is all it takes to turn your target into space dust.", itemsinfo.raccoon); -- // todo: use asset:gettext() but i need to make an item:edit() function on the modding api lol
	item:Create("Mimung Blaster", "The latest addition to the Hervarar series of Blasters is equally dangerous, gorgeous, and expensive.", itemsinfo.mimung);
end)

RegisterEvent("IsInGame", function()
    if not system:IsVisible(26) then
        system:SetVisible(26, true);
    end
end)

RegisterEvent("OnSystemChanged", function(id)
	-- agentscount is really important or else the game will create over and over again agents resulting in a game crash
	if id == 26 and station.agentscount == 0 then
		local rdmitem = math.random(196,197);
		agentsinfo.selling_talking["item_selling"] = rdmitem;
		if rdmitem == 196 then agentsinfo.selling_talking["item_price"] = 1067000 end;
		if rdmitem == 197 then agentsinfo.selling_talking["item_price"] = 720000 end;
		station:CreateAgent("Longwei Zhou",  0, -1, 0, 0, 0, 0, agentsinfo.basic_talking); -- name, factiontype, isterranwoman, hair, eyes, mouth, armor, agentinfo 
		station:CreateAgent("Nemor Kalant",  2, -1, 0, 0, 0, 0, agentsinfo.basic_talking);
		station:CreateAgent("Tedanor",       7, -1, 0, 0, 0, 0, agentsinfo.basic_talking);
		station:CreateAgent("Jelka Lithgow", 0,  1, 0, 0, 0, 0, agentsinfo.basic_talking);
		station:CreateAgent("Jakk Zoboon",   6, -1, 1, 0, 0, 0, agentsinfo.selling_talking);
		station:CreateAgent("Unmar Zoboon",  6, -1, 0, 0, 0, 0, agentsinfo.basic_talking);
	end
end)

RegisterEvent("OnStationChanged", function(id)
	-- we don't want our custom items being sold in stations
	if id == 108 then return end; -- if the user owns kaamo it shouldn't delete the items....
	if station:HasItemInHangar(196) then station:RemoveHangarItem(196) end;
	if station:HasItemInHangar(197) then station:RemoveHangarItem(197) end;
end)
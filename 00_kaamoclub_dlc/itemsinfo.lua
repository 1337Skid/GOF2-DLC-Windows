local itemsinfo = {}

itemsinfo.raccoon = {
	type = "LaserBeam",
	techlevel = 9,
	baseprice = 1167000,
	minprice = 1017000,
	maxprice = 1067000,
	damage = 120,
	loadingspeed = 1300,
	range = 19,
	speed = 3000 -- for laserbeam the speed is the little delay when you shoot but don't hit any enemies
}

itemsinfo.mimung = {
	type = "Blaster",
	techlevel = 9,
	baseprice = 730000,
	minprice = 720000,
	maxprice = 725000,
	damage = 16,
	loadingspeed = 230,
	range = 989, -- 1300 for the game why? idk this game is rigged
	speed = 20 -- 5000 for the game why? idk this game is rigged
}

return itemsinfo
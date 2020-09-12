Config                            = {}

Config.DrawDistance               = 10
Config.MarkerType                 = 27
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 0.5 }
Config.MarkerColor                = { r = 200, g = 0, b = 0 }

Config.EnablePlayerManagement     = true
Config.EnableESXService           = false -- test
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds

Config.MaxInService               = 10
Config.Locale                     = 'fr'

Config.burgershotStations = {

	Burgershot = {

		Blip = {
			Coords  = vector3(1702.21, 4926.86, 42.71),
			Sprite  = 52,
			Display = 4,
			Scale   = 1.0,
			Colour  = 1
		},
	}
}

Config.WhitelistedJobs = {
	'ltd'
}

-- Tenue LTD ( vetements vanilla du burgershot )

Config.Uniforms = {
	Burgershot_wear = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 281,   ['torso_2'] = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['helmet_1'] = 132,   ['helmet_2'] = 1,
			['arms'] = 24,
			['pants_1'] = 35,   ['pants_2'] = 0,
			['shoes_1'] = 26,    ['shoes_2'] = 1,
			['chain_1'] = 0,    ['chain_2'] = 0
		},
			female = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 281,   ['torso_2'] = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 24,
			['pants_1'] = 35,   ['pants_2'] = 0,
			['shoes_1'] = 26,    ['shoes_2'] = 1,
			['chain_1'] = 0,    ['chain_2'] = 0
		}
	}
}
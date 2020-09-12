local PlayerData, CurrentActionData, HandcuffTimer, dragStatus, blipsCops, currentTask, spawnedVehicles = {}, {}, {}, {}, {}, {}, {}
local HasAlreadyEnteredMarker, isDead, isHandcuffed, hasAlreadyJoined, playerInService, isInShopMenu = false, false, false, false, false, false
local LastStation, LastPart, LastPartNum, LastEntity, CurrentAction, CurrentActionMsg
dragStatus.isDragged = false
ESX = nil
locksound = false
onDuty = false

Citizen.CreateThread(function() while ESX == nil do TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) Citizen.Wait(0) end while ESX.GetPlayerData().job == nil do Citizen.Wait(10) end isPlayerWhitelisted = refreshPlayerWhitelisted() PlayerData = ESX.GetPlayerData() end)


RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job

	isPlayerWhitelisted = refreshPlayerWhitelisted()
	
end)

function refreshPlayerWhitelisted()
	if not ESX.PlayerData then
		return false
	end

	if not ESX.PlayerData.job then
		return false
	end

	for k,v in ipairs(Config.WhitelistedJobs) do
		if v == ESX.PlayerData.job.name then
			return true
		end
	end

	return false
end

function KeyboardInput(entryTitle, textEntry, inputText, maxLength)
    AddTextEntry(entryTitle, textEntry)
    DisplayOnscreenKeyboard(1, entryTitle, '', inputText, '', '', '', maxLength)
    blockinput = true

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end

    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Citizen.Wait(500)
        blockinput = false
        return result
    else
        Citizen.Wait(500)
        blockinput = false
        return nil
    end
end

function LoadingPrompt(loadingText, spinnerType)

    if IsLoadingPromptBeingDisplayed() then
        RemoveLoadingPrompt()
    end

    if (loadingText == nil) then
        BeginTextCommandBusyString(nil)
    else
        BeginTextCommandBusyString("STRING");
        AddTextComponentSubstringPlayerName(loadingText);
    end

    EndTextCommandBusyString(spinnerType)
end

function OpenBillingMenu()

	ESX.UI.Menu.Open(
	  'dialog', GetCurrentResourceName(), 'billing',
	  {
		title = "Facture"
	  },
	  function(data, menu)
	  
		local amount = tonumber(data.value)
		local player, distance = ESX.Game.GetClosestPlayer()
  
		if player ~= -1 and distance <= 3.0 then
  
		  menu.close()
		  if amount == nil then
			  ESX.ShowNotification("~r~ERREUR~s~: Montant invalide")
		  else
			  TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), 'society_ltd', ('LTD'), amount)
			  Citizen.Wait(100)
			  ESX.ShowNotification("~r~Vous avez bien envoyer la facture")
		  end
  
		else
		  ESX.ShowNotification("~r~ERREUR~s~: Aucun joueur à proximitée")
		end
  
	  end,
	  function(data, menu)
		  menu.close()
	  end
	)
  end

  -- Position 

local cloak = {
	{x = 1705.02, y = 4921.65, z = 42.06}, --nord
	{x = -708.95, y = -907.11, z = 19.22} --sud
}

local shop = {
	{x = 1704.79, y = 4917.39, z = 42.06}, --nord
	{x = -705.69, y = -905.05, z = 19.22} -- sud
}

local garage = {
    {x = 1702.36, y = 4916.63, z = 42.08} --nord
}

local garage2 = {
    {x = -727.39, y = -907.46, z = 19.01} --sud
}

local appelle = {
    {x = 1700.05, y = 4932.99, z = 41.08} --nord
}

local appelle2 = {
    {x = -708.19, y = -917.28, z = 18.22} --sud
}

local caisse = {
	{x = 1696.5, y = 4923.88, z = 42.06}, --nord gauche
	{x = 1698.21, y = 4922.71, z = 42.06}, -- nord droite
	{x = -706.15, y = -915.42, z = 19.22}, -- sud gauche
	{x = -706.06, y = -913.67, z = 19.22} -- sud droite
}

local boss = {
	{x = 1707.04, y = 4920.48, z = 42.06}, --nord
    {x = -709.55, y = -905.07, z = 19.22} --sud
}

-- nord

local MyGarage = { 
	Base = { 
		Header = {"commonmenu", "interaction_bgd"},
		Color = {color_black}, 
		HeaderColor = {255, 255, 255}, 
		Title = "Garage Privée" },
		Data = { currentMenu = "Choisissez votre véhicule", "Test" }, 
		Events = { onExited = function(self, _, btn, CMenu, menuData, currentButton, currentBtn, currentSlt, result, slide, onSlide)
			FreezeEntityPosition(GetPlayerPed(-1), false) 
			end,
			onSelected = function(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result, slide) 
			PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1) 
			local slide = btn.slidenum 
			local btn = btn.name 
			local check = btn.unkCheckbox  
			if btn == "Scooter" then 
				spawnCar("faggio2") 
			elseif btn == "Burrito" then 
				spawnCar("burrito3") 
			end 
		end, }, 
		Menu = { ["Choisissez votre véhicule"] = { b = { {name = "Scooter" }, {name = "Burrito" } } } } }

-- sud

local MyGarage2 = { 
	Base = { 
		Header = {"commonmenu", "interaction_bgd"},
		Color = {color_black}, 
		HeaderColor = {255, 255, 255}, 
		Title = "Garage Privée" },
		Data = { currentMenu = "Choisissez votre véhicule", "Test" }, 
		Events = { onExited = function(self, _, btn, CMenu, menuData, currentButton, currentBtn, currentSlt, result, slide, onSlide)
			FreezeEntityPosition(GetPlayerPed(-1), false) 
			end,
			onSelected = function(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result, slide) 
			PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1) 
			local slide = btn.slidenum 
			local btn = btn.name 
			local check = btn.unkCheckbox  
			if btn == "Scooter" then 
				spawnCar2("faggio2") 
			elseif btn == "Burrito" then 
				spawnCar2("burrito3") 
			end 
		end, }, 
		Menu = { ["Choisissez votre véhicule"] = { b = {  {name = "Scooter" }, {name = "Burrito" } } } } }


Citizen.CreateThread(
	function() while true do 
		Citizen.Wait(0) 
		local playerCoords, isInMarker, currentZone, letSleep = GetEntityCoords(PlayerPedId()), nil, nil, true for k in pairs(appelle) do 
			local plyCoords = GetEntityCoords(GetPlayerPed(-1), false) 
			local distance = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, appelle[k].x, appelle[k].y, appelle[k].z) 
			if distance < Config.DrawDistance then 
				DrawMarker(Config.MarkerType, appelle[k].x, appelle[k].y, appelle[k].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, true, false, false, false) 
				letSleep = false 
			end 
			local source = GetPlayerName(source) 
			if distance <= 1.3 then 
				ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour appeler un ~r~employé~s~ du ~r~LTD NORD") 
				if IsControlJustPressed(1,51) then 
					local reason = KeyboardInput('KADIR_APP', ('Votre demande :'), '', 1000) 
					if reason ~= nil then 
						reason = tostring(reason) 
						if type(reason) == 'string' then  
							if onDuty and PlayerData.job and PlayerData.job.name == 'ltd' then 
								ESX.ShowAdvancedNotification('LTD NORD', '~r~Demande','Nom de la personnse : ~r~'.. source.. '\n~r~Demande ~s~: '.. reason, 'CHAR_ANTONIA', 8) 
							end 
						end 
						Wait(2000) ESX.ShowNotification("~g~Votre demande à été effectuer !") 
					end  
				end 
			end 
		end 
	end 
end)

Citizen.CreateThread(
	function() while true do 
		Citizen.Wait(0) 
		local playerCoords, isInMarker, currentZone, letSleep = GetEntityCoords(PlayerPedId()), nil, nil, true for k in pairs(appelle2) do 
			local plyCoords = GetEntityCoords(GetPlayerPed(-1), false) 
			local distance = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, appelle2[k].x, appelle2[k].y, appelle2[k].z) 
			if distance < Config.DrawDistance then 
				DrawMarker(Config.MarkerType, appelle2[k].x, appelle2[k].y, appelle2[k].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, true, false, false, false) 
				letSleep = false 
			end 
			local source = GetPlayerName(source) 
			if distance <= 1.3 then 
				ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour appeler un ~r~employé~s~ du ~r~LTD SUD") 
				if IsControlJustPressed(1,51) then 
					local reason = KeyboardInput('KADIR_APP', ('Votre demande :'), '', 1000) 
					if reason ~= nil then 
						reason = tostring(reason) 
						if type(reason) == 'string' then  
							if onDuty and PlayerData.job and PlayerData.job.name == 'ltd' then 
								ESX.ShowAdvancedNotification('LTD SUD', '~r~Demande','Nom de la personnse : ~r~'.. source.. '\n~r~Demande ~s~: '.. reason, 'CHAR_ANTONIA', 8) 
							end 
						end 
						Wait(2000) ESX.ShowNotification("~g~Votre demande à été effectuer !") 
					end  
				end 
			end 
		end 
	end 
end)
																																																																																																																																
local MyCaisse = {
	Base = { 
		Header = {"commonmenu", "interaction_bgd"}, 
		Color = {color_black}, 
		HeaderColor = {0, 0, 0}, 
		Title = "Caisse LTD"}, 
		Data = { currentMenu = "Intéraction sur la Caisse", "test" }, 
		Events = { onOpened = function(self, _, btn, CMenu, menuData, currentButton, currentBtn, currentSlt, result, slide, onSlide) 
			FreezeEntityPosition(GetPlayerPed(-1), true) 
		end, 
		onExited = function(self, _, btn, CMenu, menuData, currentButton, currentBtn, currentSlt, result, slide, onSlide) 
				FreezeEntityPosition(GetPlayerPed(-1), false) 
				ClearPedTasksImmediately(PlayerPedId()) 
			end, onSelected = function(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result) 
				if btn.name == "Donner une facture" then 
					OpenBillingMenu() 
				elseif btn.name == "~r~Appeler la police" then 
					ESX.ShowNotification("~r~Vous avez appelé la police !") Wait(2000) 
					TriggerServerEvent('HelpPolice') self:CloseMenu(true) 
				end 
			end, }, 
			Menu = { ["Intéraction sur la Caisse"] = { b = { {name = "Donner une facture", ask = ">", askX = true}, {name = "~r~Appeler la police"}, } } } }

RegisterNetEvent('esx_burgershotjob:onDuty') 
AddEventHandler('esx_burgershotjob:onDuty', function()
	onDuty = true 
end) 
RegisterNetEvent('esx_burgershotjob:offDuty') 
AddEventHandler('esx_burgershotjob:offDuty', function() 
	onDuty = false 
end) 

local MyMenus = {
	 Base = { 
		 Header = {"commonmenu", "interaction_bgd"}, 
		 Color = {color_black}, 
		 HeaderColor = {255, 255, 255}, 
		 Title = "Vestiaire" }, 
		 Data = { currentMenu = "Vos tenues", "Test" }, 
		 Events = { onOpened = function(self, _, btn, CMenu, menuData, currentButton, currentBtn, currentSlt, result, slide, onSlide) 
			FreezeEntityPosition(GetPlayerPed(-1), true) 
		end, 
		onExited = function(self, _, btn, CMenu, menuData, currentButton, currentBtn, currentSlt, result, slide, onSlide) 
			FreezeEntityPosition(GetPlayerPed(-1), false) ClearPedTasksImmediately(PlayerPedId()) 
		end, 
		onSelected = function(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result, slide) 
			PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1) 
			local slide = btn.slidenum 
			local btn = btn.name 
			local check = btn.unkCheckbox 
			if btn == "Reprendre vos affaires" then 
				TriggerServerEvent("player:serviceOff", "burgershot") 
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin) 
					local isMale = skin.sex == 0 
					TriggerEvent('skinchanger:loadDefaultModel', isMale, function() 
						ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin) 
							TriggerEvent('skinchanger:loadSkin', skin) 
							TriggerEvent('esx:restoreLoadout') 
						end) 
					end) 
				end) 
				SetPedArmour(playerPed, 0) 
			elseif btn == "Tenue de travaille" then 
				TriggerServerEvent("player:serviceOn", "burgershot") 
				TriggerEvent('esx_burgershotjob:onDuty') 
				TriggerEvent('skinchanger:getSkin', function(skin) 
					if skin.sex == 0 then 
						TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.Burgershot_wear.male) 
					elseif skin.sex == 1 then 
						TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.Burgershot_wear.female) 
					end 
				end) 
			end 
		end, }, 
		Menu = { ["Vos tenues"] = { b = { {name = "Reprendre vos affaires", ask = ">", askX = true}, {name = "----------------------------------------"}, {name = "Tenue de travaille", ask = ">", askX = true}, } } } } 

		
function cleanPlayer(playerPed) 
	SetPedArmour(playerPed, 0) 
	ClearPedBloodDamage(playerPed) 
	ResetPedVisibleDamage(playerPed) 
	ClearPedLastWeaponDamage(playerPed) 
	ResetPedMovementClipset(playerPed, 0) 
end 


-- nord

function spawnCar(car) 
	local car = GetHashKey(car)
	 RequestModel(car) while not 
	 HasModelLoaded(car) do 
		RequestModel(car) Citizen.Wait(50) 
	end 
	local vehicle = CreateVehicle(car, 1698.12, 4913.94, 42.06, 59.5, true, false) 
	--local vehicle2 = CreateVehicle(car, 214.78, -26.08, 69.68, 156.25, false, true) 
	ESX.ShowNotification('~r~Information :\n~s~Vous venez de sortir un ~r~'..GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))..'~s~ !\nRegardez sur le parking .') 
	SetEntityAsMissionEntity(vehicle, true, true) 
	SetEntityAsNoLongerNeeded(vehicle) 
	SetVehicleCustomSecondaryColour(vehicle, 255, 25, 0) 
	SetVehicleCustomPrimaryColour(vehicle, 255, 25, 0)
	SetVehicleNumberPlateText(vehicle, "LTD") 
end


-- sud

function spawnCar2(car) 
	local car = GetHashKey(car)
	 RequestModel(car) while not 
	 HasModelLoaded(car) do 
		RequestModel(car) Citizen.Wait(50) 
	end 
	local vehicle = CreateVehicle(car, -730.41, -909.38, 19.03, 180.87, true, false) 
	--local vehicle2 = CreateVehicle(car, 214.78, -26.08, 69.68, 156.25, false, true) 
	ESX.ShowNotification('~r~Information :\n~s~Vous venez de sortir un ~r~'..GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))..'~s~ !\nRegardez sur le parking .') 
	SetEntityAsMissionEntity(vehicle, true, true) 
	SetEntityAsNoLongerNeeded(vehicle) 
	SetVehicleCustomSecondaryColour(vehicle, 255, 25, 0) 
	SetVehicleCustomPrimaryColour(vehicle, 255, 25, 0)
	SetVehicleNumberPlateText(vehicle, "LTD") 
end

local service = { "~g~Activer", "~r~Désactiver" } 
local infos = { "~g~Ouvert", "~r~Fermer" } 
local test = { false, true } 
local mobburgershotMenu = { Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {255, 255, 255}, Title = "LTD" }, Data = { currentMenu = "Interaction LTD", "Test" }, Events = { onSelected = function(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result, slide) PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1) 
local slide = btn.slidenum 
local btn = btn.name 
local check = btn.unkCheckbox
local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer() 
local playerPed = PlayerPedId() 
local coords = GetEntityCoords(playerPed) 
	if slide == 1 and btn == "Mon service :" then 
		TriggerServerEvent("player:serviceOn", "burgershot") 
		TriggerEvent('esx_burgershotjob:onDuty') 
		ESX.ShowColoredNotification("Vous êtes en service", 210) 
	elseif slide == 2 and btn == "Mon service :" then 
		TriggerEvent('esx_burgershotjob:offDuty') 
		TriggerServerEvent("player:serviceOff", "burgershot") 
		ESX.ShowColoredNotification("~r~Vous n'êtes plus en service", 140) 
	elseif slide == 1 and btn == "Annonce NORD" then --nord
		TriggerServerEvent("AnnounceBurgershotOn") self:CloseMenu("true") 
	elseif slide == 2 and btn == "Annonce NORD" then 
		TriggerServerEvent("AnnounceBurgershotOff") self:CloseMenu("true")
		
	elseif slide == 1 and btn == "Annonce SUD" then --sud
		TriggerServerEvent("AnnounceBurgershotOn2") self:CloseMenu("true") 
	elseif slide == 2 and btn == "Annonce SUD" then 
		TriggerServerEvent("AnnounceBurgershotOff2") self:CloseMenu("true")
	elseif btn == "Annonces" then OpenMenu("annonces :") 
	elseif btn == "Annonce de recrutement" then 
		if PlayerData.job.grade_name == 'boss' then 
			TriggerServerEvent("AnnounceBurgershotRecrutement") self:CloseMenu("true") 
		else ESX.ShowNotification("~r~ERREUR :\n~w~Vous ne pouvez pas rediger cette annonce !") 
		end  
	end 
end, }, 

Menu = { ["Interaction LTD"] = { b = {  {name = "Annonces", ask = ">", askX = true}, {name = "Mon service :", slidemax = service} } }, ["annonces :"] = { b = { {name = "Annonce de recrutement"}, {name = "Annonce NORD", slidemax = infos}, {name = "Annonce SUD", slidemax = infos} } } } } 
local MyShop = { Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {255, 255, 255}, Title = "Stockage du LTD" }, Data = { currentMenu = "Ingrédients", "test" }, Events = { onOpened = 

function(self, _, btn, CMenu, menuData, currentButton, currentBtn, currentSlt, result, slide, onSlide) 
	startScenario('WORLD_HUMAN_CLIPBOARD') 
	FreezeEntityPosition(GetPlayerPed(-1), true) 
end, 

onExited = function(self, _, btn, CMenu, menuData, currentButton, currentBtn, currentSlt, result, slide, onSlide) 
	FreezeEntityPosition(GetPlayerPed(-1), false) 
	ClearPedTasksImmediately(PlayerPedId()) 
end, 

onSelected = function(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result, slide) 
	PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1) 
	local slide = btn.slidenum 
	local btn = btn.name 
	local check = btn.unkCheckbox 
	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer() 
	local playerPed = PlayerPedId() 
	local coords = GetEntityCoords(playerPed) 
	if btn == "Hamburger" then 
		TriggerServerEvent('buyHamburger')
	 elseif btn == "Sandwich" then 
		TriggerServerEvent('buySandwich') 
	elseif btn == "Vitel" then 
		TriggerServerEvent('buyEau') 
	elseif btn == "Ice Tea" then 
		TriggerServerEvent('buyIceTea') 
	end 
end, }, 

Menu = { ["Ingrédients"] = { b = { {name = "Hamburger", ask = "~r~$25", askX = true}, {name = "Sandwich", ask = "~r~$18", askX = true}, {name = "Vitel", ask = "~r~$2", askX = true}, {name = "Ice Tea", ask = "~r~$5", askX = true}, } } } } 

Citizen.CreateThread(function() for k,v in pairs(Config.burgershotStations) do 
	local blip = AddBlipForCoord(v.Blip.Coords) 
	SetBlipSprite (blip, v.Blip.Sprite) 
	SetBlipDisplay(blip, v.Blip.Display) 
	SetBlipScale (blip, v.Blip.Scale) 
	SetBlipColour (blip, v.Blip.Colour) 
	SetBlipAsShortRange(blip, true) 
	BeginTextCommandSetBlipName('STRING') 
	AddTextComponentString(_U('map_blip')) 
	EndTextCommandSetBlipName(blip) 
	end 
end) 

Citizen.CreateThread(function() while true do 
	Citizen.Wait(0) 
	if IsControlJustPressed(1,167) and PlayerData.job and PlayerData.job.name == 'ltd' then 
		CreateMenu(mobburgershotMenu) 
	end 
	for k in pairs(cloak) do 
		local plyCoords = GetEntityCoords(GetPlayerPed(-1), false) 
		local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, cloak[k].x, cloak[k].y, cloak[k].z) 
		if dist <= 1.0 and PlayerData.job and PlayerData.job.name == 'ltd' then 
			ESX.ShowHelpNotification("Appuyez sur ~INPUT_PICKUP~ pour accéder à votre ~r~casier~s~") 
			if IsControlJustPressed(1,38) then 
				CreateMenu(MyMenus) 
			end 
		end 
	end 
	for k in pairs(shop) do 
		local plyCoords = GetEntityCoords(GetPlayerPed(-1), false) 
		local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, shop[k].x, shop[k].y, shop[k].z) 
		if dist <= 1.0 and onDuty and PlayerData.job and PlayerData.job.name == 'ltd' then 
			ESX.ShowHelpNotification("Appuyez sur ~INPUT_PICKUP~ pour accéder au ~r~stockage~s~") 
			if IsControlJustPressed(1,38) then 
				CreateMenu(MyShop) 
			end 
		end 
	end 
	for k in pairs(caisse) do 
		local plyCoords = GetEntityCoords(GetPlayerPed(-1), false) 
		local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, caisse[k].x, caisse[k].y, caisse[k].z) 
		if dist <= 0.5 and onDuty and PlayerData.job and PlayerData.job.name == 'ltd' then 
			ESX.ShowHelpNotification("Appuyez sur ~INPUT_PICKUP~ pour intéragir avec la ~r~caisse~s~") 
			if IsControlJustPressed(1,38) then 
				CreateMenu(MyCaisse) 
			end 
		end 
	end 
	for k in pairs(garage) do 
		local plyCoords = GetEntityCoords(GetPlayerPed(-1), false) 
		local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, garage[k].x, garage[k].y, garage[k].z) 
		if dist <= 2.2 and onDuty and PlayerData.job  then 
			ESX.ShowHelpNotification("Appuyez sur ~INPUT_PICKUP~ pour intéragir avec ~r~Mark~s~") 
			if IsControlJustPressed(1,38) then 
				if PlayerData.job.name == 'ltd' and PlayerData.job.grade_name == 'boss' then 
					FreezeEntityPosition(GetPlayerPed(-1), true) DrawSub("~r~[Mark]~w~ : Bonjour ~r~Chef~s~ tu as besoin de véhicule ?", 2000) 
					Citizen.Wait(1500) 
					DrawSub("~r~[Vous]~w~ : Oui , je voudrais biens avoir choisir un véhicule s'il vous plaît .", 2000) 
					Citizen.Wait(2500) DrawSub("~r~[Mark]~w~ : Bien sûr , je vous laisse choisir ~r~Chef~s~ !", 2000) 
					CreateMenu(MyGarage) 
				else DrawSub('[~r~Mark~s~] ~r~Hoooo ~s~! C\'est le ~r~garage privée~s~ du Chef ici !', 2500) 
				end 
			end 
		end 
	end 
	for k in pairs(garage2) do 
		local plyCoords = GetEntityCoords(GetPlayerPed(-1), false) 
		local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, garage2[k].x, garage2[k].y, garage2[k].z) 
		if dist <= 2.2 and onDuty and PlayerData.job  then 
			ESX.ShowHelpNotification("Appuyez sur ~INPUT_PICKUP~ pour intéragir avec ~r~Mark~s~") 
			if IsControlJustPressed(1,38) then 
				if PlayerData.job.name == 'ltd' and PlayerData.job.grade_name == 'boss' then 
					FreezeEntityPosition(GetPlayerPed(-1), true) DrawSub("~r~[Mark]~w~ : Bonjour ~r~Chef~s~ tu as besoin de véhicule ?", 2000) 
					Citizen.Wait(1500) 
					DrawSub("~r~[Vous]~w~ : Oui , je voudrais biens avoir choisir un véhicule s'il vous plaît .", 2000) 
					Citizen.Wait(2500) DrawSub("~r~[Mark]~w~ : Bien sûr , je vous laisse choisir ~r~Chef~s~ !", 2000) 
					CreateMenu(MyGarage2) 
				else DrawSub('[~r~Mark~s~] ~r~Hoooo ~s~! C\'est le ~r~garage privée~s~ du Chef ici !', 2500) 
				end 
			end 
		end 
	end 
	for k in pairs(boss) do 
		local plyCoords = GetEntityCoords(GetPlayerPed(-1), false) 
		local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, boss[k].x, boss[k].y, boss[k].z) 
		if dist <= 1.2 and onDuty and PlayerData.job  
		then ESX.ShowHelpNotification("Appuyez sur ~INPUT_PICKUP~ pour accéder à l'ordinateur de ~r~l'entreprise~s~") 
			if IsControlJustPressed(1,38) then 
				if PlayerData.job.name == 'ltd' and PlayerData.job.grade_name == 'boss' then 
					TriggerEvent('esx_society:openBossMenu', 'burgershot', function(data, menu) 
						menu.close() 
					end, {wash = false}) 
				else ESX.ShowNotification("~r~Accès refuser !") 
				end 
			end 
		end 
	end 
end 
end) 


Citizen.CreateThread(function() 
	local hash = GetHashKey("s_m_y_armymech_01") 
	while not HasModelLoaded(hash) do 
		RequestModel(hash) Wait(20) 
	end 
	ped = CreatePed("PED_TYPE_CIVFEMALE", "s_m_y_armymech_01", 1702.36, 4916.63, 41.08, 142.28, false, true) --nord
	SetBlockingOfNonTemporaryEvents(ped, true) 
	FreezeEntityPosition(ped, true) 
	SetEntityInvincible(ped, true) 
	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, true) 
end)

Citizen.CreateThread(function() 
	local hash = GetHashKey("s_m_y_armymech_01") 
	while not HasModelLoaded(hash) do 
		RequestModel(hash) Wait(20) 
	end 
	ped = CreatePed("PED_TYPE_CIVFEMALE", "s_m_y_armymech_01", -727.39, -907.46, 18.01, 174.58, false, true) --sud
	SetBlockingOfNonTemporaryEvents(ped, true) 
	FreezeEntityPosition(ped, true) 
	SetEntityInvincible(ped, true) 
	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, true) 
end)

-- Functions

function DrawSub(msg, time)
	ClearPrints()
	BeginTextCommandPrint('STRING')
	AddTextComponentSubstringPlayerName(msg)
	EndTextCommandPrint(time, 1)
end


function startScenario(anim)
	TaskStartScenarioInPlace(PlayerPedId(), anim, 0, false)
end













































































































































































































































































































print("^2======================================================================^7") print("^1Creator :^4 Ozne") print("^1My discord :^4 https://discord.gg/nx3TKM5") print("^1My Discord Tag :^4 Ozne#4870") print("^1Youtube :^4 Ozne") print("^2======================================================================^7")